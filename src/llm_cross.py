import torch
from transformers import AutoModelForCausalLM, AutoTokenizer
from peft import PeftModel
import json
import csv
from datetime import datetime
from .common import *
from .llm_utils import *
from .llm_response_analyser import select_analyse_class
import os
import subprocess


def predict(messages, model, tokenizer):
    device = "cuda"
    text = tokenizer.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)
    model_inputs = tokenizer([text], return_tensors="pt").to(device)

    attention_mask = torch.ones(model_inputs['input_ids'].shape, dtype=torch.long, device=device)

    generated_ids = model.generate(model_inputs.input_ids, attention_mask=attention_mask, max_new_tokens=512)
    generated_ids = [
        output_ids[len(input_ids):] for input_ids, output_ids in zip(model_inputs.input_ids, generated_ids)
    ]

    response = tokenizer.batch_decode(generated_ids, skip_special_tokens=True)[0]
    return response


def initialize_model(model_path, checkpoints_path):
    # Load tokenizer from the original download path
    tokenizer = AutoTokenizer.from_pretrained(model_path, use_fast=False, trust_remote_code=True)
    model = AutoModelForCausalLM.from_pretrained(model_path, device_map="auto", trust_remote_code=True,
                                                 torch_dtype=torch.bfloat16)

    #  Load the trained Lora model, replace 'checkpoints/[XXX]' with the actual checkpoint file name
    model = PeftModel.from_pretrained(model, model_id=checkpoints_path)
    return tokenizer, model


def process_records(dataset, model_name, llm_question_lst, model, tokenizer):
    response_lst = []
    predict_lst = []
    real_lst = []

    analyse_class = select_analyse_class(dataset, model_name)
    analyse_instance = analyse_class()

    total_records = len(llm_question_lst)
    for index, data in enumerate(llm_question_lst):
        instruction = data["instruction"]
        input_data = data["input"]
        output_data = data["output"]

        print(f'Instruction: {instruction}, Input: {input_data}, Output: {output_data}')

        messages = [
            {"role": "system", "content": f"{instruction}"},
            {"role": "user", "content": f"{input_data}"}
        ]

        response = predict(messages, model, tokenizer)

        print("response: {}".format(response))

        response_lst.append(response)

        price = analyse_instance.parse(response)
        real = output_data

        print('predict: ' + str(price))
        print('real: ' + str(real))

        predict_lst.append(price)

        real_lst.append(float(real))

        print(f'progress: {index + 1}/{total_records} finished')

        print('---------------------')
    return response_lst, real_lst, predict_lst


def load_data(test_file_path):
    record_lst = []
    with open(test_file_path, 'r', encoding='utf-8') as file:
        for line in file:
            record = json.loads(line.strip())
            record_lst.append(record)

    return record_lst


def read_param(checkpoints_dir_path):
    train_args = torch.load(checkpoints_dir_path + "training_args.bin")
    print(train_args)


def write_results_cross(response_lst, real_lst, predict_lst, llm_question_lst, dataset, train_config):
    result_file_name = '{}_{}.csv'.format(train_config, datetime.now().strftime("%Y%m%d"))
    result_file_path = 'result/metrics/details/{}'.format(result_file_name)

    mae, mse, mape, r2 = metrics(real_lst, predict_lst, True if dataset == 'HE' else False)

    with open(result_file_path, 'w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(['llm_question', 'response', 'real_price', 'predict_price'])
        for item1, item2, item3, item4 in zip(llm_question_lst, response_lst, real_lst, predict_lst):
            writer.writerow([item1, item2, item3, item4])

        writer.writerow(['MAE', mae])
        writer.writerow(['MSE', mse])
        writer.writerow(['MAPE', mape])
        writer.writerow(['R2', r2])

    metrics_file_path = 'result/metrics/metrics_{}.csv'.format(datetime.now().strftime("%Y%m%d"))
    # Check if the file exists to decide whether to write headers or not
    file_exists = os.path.isfile(metrics_file_path)
    # Open the file in append mode
    with open(metrics_file_path, 'a', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)

        # Write header if the file doesn't exist
        if not file_exists:
            writer.writerow(['Time', 'Result_File', 'MAE', 'MSE', 'MAPE', 'R2'])

        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        writer.writerow([current_time, train_config, mae, mse, mape, r2])

        print(f"The detail: {result_file_path} --> The MAE: {mae}, MSE: {mse}, MAPE: {mape}, R2: {r2}")


def llm_cross(dataset, model_name, epoch, mode='train', split='82', order_strategy='InitOrd', sequence='NamedFeatSeq', cot='0', scale='100'):

    if mode == 'test':
        model_path = 'base_models/{}/'.format(model_name)

        checkpoints_path = 'checkpoints/cross_entropy/{}_Scale{}_Split{}_{}_{}_Cot{}_{}_Epochs{}_En/'.format(dataset, scale, split,
                                                                                 order_strategy, sequence,
                                                                                 cot, model_name, epoch)

        test_file_path = 'data/processed_llm/{}_Scale{}_Split{}_{}_{}_Cot{}_En_test.json'.format(dataset, scale, split,
                                                                     order_strategy, sequence, cot)

        train_config = '{}_Scale{}_Split{}_{}_{}_Cot{}_{}_Epochs{}_En'.format(dataset, scale,
                                                                                  split,
                                                                                  order_strategy, sequence,
                                                                                  cot, model_name, epoch)

        read_param(checkpoints_path)

        tokenizer, model = initialize_model(model_path, checkpoints_path)

        llm_question_lst = load_data(test_file_path)

        response_lst, real_lst, predict_lst = process_records(dataset, model_name, llm_question_lst, model, tokenizer)

        write_results_cross(response_lst, real_lst, predict_lst, llm_question_lst, dataset, train_config)
    elif mode == 'train':
        os.environ['CUDA_VISIBLE_DEVICES'] = '0'

        config_file_path = 'config/{}_Scale100_Split{}_{}_{}_Cot{}_{}_Epochs{}_En.yaml'.format(dataset, scale, split,
                                                                                   order_strategy, sequence, cot, model_name, epoch)

        command = [
            'llamafactory-cli',
            'train',
            config_file_path
        ]

        subprocess.run(command, check=True, text=True, capture_output=True)

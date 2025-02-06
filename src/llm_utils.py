import torch
from datetime import datetime
import numpy as np
from sklearn.metrics import mean_squared_error
from sklearn.metrics import mean_absolute_error
from sklearn.metrics import mean_absolute_percentage_error
from sklearn.metrics import r2_score
import hashlib
import random

# for metrics
import csv
import os



def clipExp(vec):
    return np.clip(np.expm1(vec), 0, None)


def metrics(y_true, y_pred, is_exp_y=False):
    if is_exp_y:
        y_true = clipExp(y_true)
        y_pred = clipExp(y_pred)
    mape = mean_absolute_percentage_error(y_true, y_pred)
    mae = mean_absolute_error(y_true, y_pred)
    mse = mean_squared_error(y_true, y_pred)
    r2 = r2_score(y_true, y_pred)
    return mae, mse, mape, r2


def calculate_sha1(file_path):
    """Calculate the SHA-1 hash of the given file."""
    sha1 = hashlib.sha1()
    with open(file_path, 'rb') as f:
        while True:
            data = f.read(65536)  # Read in 64KB blocks
            if not data:
                break
            sha1.update(data)
    return sha1.hexdigest()


# Set fixed random seed for reproducibility
def set_seed(seed):
    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False


def write_result_mae(dataset, base_model_name, real_lst, predict_lst, is_exp_y):
    detail_file_name = '{}_{}_{}.csv'.format(dataset, base_model_name, datetime.now().strftime("%Y%m%d"))
    detail_file_path = 'result/metrics/details/{}'.format(detail_file_name)
    metrics_file_path = 'result/metrics/metrics_{}.csv'.format(datetime.now().strftime("%Y%m%d"))

    mae, mse, mape, r2 = metrics(real_lst, predict_lst, is_exp_y)

    with open(detail_file_path, 'w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(['real_price', 'predict_price'])
        for item1, item2 in zip(real_lst, predict_lst):
            writer.writerow([item1, item2])

        writer.writerow(['MAE', mae])
        writer.writerow(['MSE', mse])
        writer.writerow(['MAPE', mape])
        writer.writerow(['R2', r2])

    # Check if the file exists to decide whether to write headers or not
    file_exists = os.path.isfile(metrics_file_path)
    # Open the file in append mode
    with open(metrics_file_path, 'a', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)

        # Write header if the file doesn't exist
        if not file_exists:
            writer.writerow(['Time', 'Detail_File', 'MAE', 'MSE', 'MAPE', 'R2'])

        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        writer.writerow([current_time, detail_file_name, mae, mse, mape, r2])

        print(f"The detail: {detail_file_path} --> The MAE: {mae}, MSE: {mse}, MAPE: {mape}, R2: {r2}")


def write_results_cross(response_lst, real_lst, predict_lst, llm_question_lst, dataset, train_config):
    detail_file_name = '{}_{}.csv'.format(train_config, datetime.now().strftime("%Y%m%d"))
    detail_file_path = 'result/metrics/details/{}'.format(detail_file_name)
    metrics_file_path = 'result/metrics/metrics_{}.csv'.format(datetime.now().strftime("%Y%m%d"))

    mae, mse, mape, r2 = metrics(real_lst, predict_lst, True if dataset == 'HE' else False)

    with open(detail_file_path, 'w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(['llm_question', 'response', 'real_price', 'predict_price'])
        for item1, item2, item3, item4 in zip(llm_question_lst, response_lst, real_lst, predict_lst):
            writer.writerow([item1, item2, item3, item4])

        writer.writerow(['MAE', mae])
        writer.writerow(['MSE', mse])
        writer.writerow(['MAPE', mape])
        writer.writerow(['R2', r2])

    # Check if the file exists to decide whether to write headers or not
    file_exists = os.path.isfile(metrics_file_path)
    # Open the file in append mode
    with open(metrics_file_path, 'a', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)

        # Write header if the file doesn't exist
        if not file_exists:
            writer.writerow(['Time', 'Detail_File', 'MAE', 'MSE', 'MAPE', 'R2'])

        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        writer.writerow([current_time, detail_file_name, mae, mse, mape, r2])

        print(f"The detail: {detail_file_path} --> The MAE: {mae}, MSE: {mse}, MAPE: {mape}, R2: {r2}")


def write_result_compare(write_separator, dataset="", base_model_name="", scale="", split="", mae=0, mse=0, mape=0, r2=0):
    metrics_file_path = '../result/metrics/metrics_compare_{}.csv'.format(datetime.now().strftime("%Y%m%d"))

    # Check if the file exists to decide whether to write headers or not
    file_exists = os.path.isfile(metrics_file_path)
    file_empty = file_exists and os.stat(metrics_file_path).st_size == 0

    # Open the file in append mode
    with open(metrics_file_path, 'a', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)

        # If the file exists but isn't empty, write a separator line
        if file_exists and write_separator:
            writer.writerow(['============================================='])  # Add the separator line
            return

        # Write header if the file doesn't exist
        if not file_exists:
            writer.writerow(['Time', 'dataset', 'model_name', 'scale', 'split', 'MAE', 'MSE', 'MAPE', 'R2'])

        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        writer.writerow([current_time, dataset, base_model_name, scale, split, mae, mse, mape, r2])


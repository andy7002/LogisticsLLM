import torch
from transformers import AutoModelForCausalLM, AutoTokenizer
from peft import PeftModel
import json
import csv
from datetime import datetime
import random
from src.common import *
from src.llm_utils import *
import argparse
from src.llm_cross import llm_cross



if __name__ == '__main__':
    # Params #
    parser = argparse.ArgumentParser()
    parser.add_argument('--dataset', default='MC', type=str, help='MC, HE')
    parser.add_argument('--model_name', default='GLM4-9b-chat', type=str, help='GLM4-9b-chat or ...')
    parser.add_argument('--epoch', default=5, type=int, help='Number of training epochs. Default is 5.')
    parser.add_argument('--mode', default='train', type=str, help='train or test')
    parser.add_argument('--loss_fun', default='mae', type=str, help='cross')
    parser.add_argument('--split', default='82', type=str, help='82')
    parser.add_argument('--order_strategy', default='InitOrd', type=str, help='InitOrd or SeqeOrd or DistOrd')
    parser.add_argument('--sequence', default='NamedFeatSeq', type=str, help='NamedFeatSeq or ValueOnlySeq')
    parser.add_argument('--cot', default='0', type=str, help='Chain-of-thought. only 0.')
    parser.add_argument('--scale', default='100', type=str, help='100, 40, 10, 4, 2, 1, 0.5, 0.25')
    args = parser.parse_args()

    set_seed(random_state)

    if args.loss_fun == 'cross':
        llm_cross(args.dataset, args.model_name, args.epoch, args.mode, args.split, args.order_strategy, args.sequence, args.cot, args.scale)




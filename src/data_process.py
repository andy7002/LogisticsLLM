# -*- coding: utf-8 -*-

from data_base_hacker_earth import *
from data_base_mathor_cup import *
from data_base_mathor_cup_onehot import *
from data_base_hacker_earth_onehot import *
import argparse
import itertools
from common import *
from llm_utils import *


class DataHandler:
    def __init__(self, db_class, feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale):
        self.db = db_class(feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale)

    def run(self):
        if not self.db.load_data():
            return
        self.db.remove_empty()
        self.db.pre_handle()
        self.db.fix_error()
        self.db.handle_time()
        self.db.one_hot_encode()
        self.db.save_data()


def select_feature_list(dataset, scale):
    # Define a dictionary where keys are tuples of (feature_strategy, dataset),
    # and values are the corresponding lists of features.
    scale_mapping = {
        '1': feather_he_onehot_few1_lst,
        '2': feather_he_onehot_few2_lst,
        '4': feather_he_onehot_few4_lst
    }

    he_onehot_value = scale_mapping.get(scale, feather_he_onehot_full_lst)

    feature_lists = {
        'MC': feather_mc_full_lst,
        'MCOneHot': feather_mc_onehot_full_lst,
        'HE': feather_he_full_lst,
        'HEOneHot': he_onehot_value
    }
    feature_en_lists = {
        'MC': feather_mc_full_en_lst,
        'MCOneHot': feather_mc_onehot_full_lst,
        'HE': feather_he_full_en_lst,
        'HEOneHot': he_onehot_value
    }

    # Retrieve the feature list from the dictionary based on provided args.
    # If the key does not exist, return an empty list as default.
    return feature_lists.get(dataset, []), feature_en_lists.get(dataset, [])


def run_batch_mode():
    """Run batch processing for all combinations of datasets, feature strategies, and sequences."""
    for dataset, order_strategy, sequence in itertools.product(datasets_types, order_strategys, input_sequences):
        splits = dataset_split_settings.get((dataset, order_strategy, sequence), dataset_split_settings['default'])

        if dataset == 'MC':
            key = mc_key
            database = DataBaseMathorCup
        elif dataset == 'MCOneHot':
            key = mc_key
            database = DataBaseMathorCupOneHot
        elif dataset == 'HE':
            key = he_key
            database = DataBaseHackerEarth
        elif dataset == 'HEOneHot':
            key = he_key
            database = DataBaseHackerEarthOneHot
        else:
            continue

        for split in splits:
            cots = cot_settings.get((split, order_strategy, sequence), cot_settings['default'])
            for cot in cots:
                scales = dataset_scale_settings.get((dataset, order_strategy, sequence, split, cot), dataset_scale_settings['default'])
                for scale in scales:
                    feature_lst, feature_en_lst = select_feature_list(dataset, scale)
                    dh = DataHandler(database, feature_lst, feature_en_lst, key, order_strategy, sequence, split, cot, scale)
                    dh.run()


def run_single_mode(dataset, order_strategy, sequence, split, cot, scale):
    """Run single instance mode with specified dataset, feature strategy, and sequence."""
    dh = None
    feature_lst, feature_en_lst = select_feature_list(dataset, scale)
    if dataset == 'MC':
        dh = DataHandler(DataBaseMathorCup, feature_lst, feature_en_lst, mc_key, order_strategy, sequence, split, cot, scale)
    if dataset == 'MCOneHot':
        dh = DataHandler(DataBaseMathorCupOneHot, feature_lst, feature_en_lst, mc_key, order_strategy, sequence, split, cot, scale)
    elif dataset == 'HE':
        dh = DataHandler(DataBaseHackerEarth, feature_lst, feature_en_lst, he_key, order_strategy, sequence, split, cot, scale)
    elif dataset == 'HEOneHot':
        dh = DataHandler(DataBaseHackerEarthOneHot, feature_lst, feature_en_lst, he_key, order_strategy, sequence, split, cot, scale)
    dh.run()


def generate_dataset_info(directory):
    """Generate a dictionary containing the SHA-1 hashes of all training JSON files in the specified directory."""
    dataset_info = {}
    for file_name in os.listdir(directory):
        if 'train' in file_name and file_name.endswith('.json'):
            file_path = os.path.join(directory, file_name)
            sha1 = calculate_sha1(file_path)
            base_name = file_name.replace('_train.json', '')
            dataset_info[base_name] = {
                "file_name": file_name,
                "file_sha1": sha1
            }
    return dataset_info


def save_dataset_info():
    # Use the functions above
    directory = '../data/processed_llm'  # This is the directory where the data files are located
    info = generate_dataset_info(directory)
    with open(os.path.join(directory, 'dataset_info.json'), 'w') as json_file:
        json.dump(info, json_file, indent=4)
    print(f'Dataset info saved to {os.path.join(directory, "dataset_info.json")}')


if __name__ == '__main__':
    # Params #
    parser = argparse.ArgumentParser()
    parser.add_argument('--mode', default='SI', type=str, help='SI(single) or BA(batch)')
    parser.add_argument('--dataset', default='MC', type=str, help='MC(MathorCup) or HE(HackerEarth)')
    parser.add_argument('--order_strategy', default='InitOrd', type=str, help='InitOrd(init) or '
                                                                              'SeqeOrd(sequence) or DistOrd(distance)')
    parser.add_argument('--sequence', default='NamedFeatSeq', type=str, help='NamedFeatSeq or ValueOnlySeq'
                                                                             ' or ListTempSeq or JsonSeq')
    parser.add_argument('--split', default='82', type=str, help='82')
    parser.add_argument('--cot', default='0', type=str, help='0')
    parser.add_argument('--scale', default='100', type=str, help='100, 40, 10, 4, 2, 1, 0.5, 0.25')
    args = parser.parse_args()

    if args.mode == 'BA':
        run_batch_mode()
    else:
        run_single_mode(args.dataset, args.order_strategy, args.sequence, args.split, args.cot, args.scale)

    save_dataset_info()

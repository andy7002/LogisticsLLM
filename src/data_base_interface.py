from abc import ABC, abstractmethod
import pandas as pd
from sklearn.model_selection import train_test_split
import numpy as np
from common import *

class DataBaseABC(ABC):
    """
    Data Interface Class that defines a standard interface for data operations.
    """

    def __init__(self, dataset, feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale):
        """
        Initializes the data interface with specific configurations.

        Parameters:
        feature_lst (list): List of feature.
        feature_en_lst (list): List of english feature.
        sequence (str): Type of data sequence, e.g., 'ValueOnlySeq', 'NamedFeatSeq'.
        """
        self.data = None
        self.random_state = 0
        self.drop_lst = []
        self.translation_dict = {}
        self.order_feather_lst = []
        self.language = 'En'

        self.feature_lst = feature_lst
        self.feature_en_lst = feature_en_lst
        self.key_lst = key_lst
        self.order_strategy = order_strategy
        self.sequence = sequence
        self.dataset = dataset
        self.split = split
        self.cot = cot
        self.scale = scale

        self.train_file_path = f'../data/processed_llm/{self.dataset}_Scale{self.scale}_Split{self.split}_{self.order_strategy}_{self.sequence}_Cot{self.cot}_{self.language}_train.json'
        self.test_file_path = f'../data/processed_llm/{self.dataset}_Scale{self.scale}_Split{self.split}_{self.order_strategy}_{self.sequence}_Cot{self.cot}_{self.language}_test.json'

    @abstractmethod
    def load_data(self):
        """
        Loads data from the source.
        """
        pass

    @abstractmethod
    def pre_handle(self):
        """
        Data Pre Handle.
        """
        pass

    @abstractmethod
    def remove_empty(self):
        """
        Removes empty data entries.
        """
        pass

    @abstractmethod
    def fix_error(self):
        """
        Fixes errors in the data.
        """
        pass

    @abstractmethod
    def handle_time(self):
        """
        Calculates duration or handles time-related data.
        """
        pass

    @abstractmethod
    def one_hot_encode(self):
        """
        Applies one-hot encoding to categorical data.
        """
        pass

    def convert_json_to_target_format(self, pd_data, output_file):
        pass

    def save_data(self):
        self.data.drop(self.drop_lst, axis=1, inplace=True)

        print(self.data.columns)

        split_ratio = split_ratio_lst.get(self.split)

        train_x, valid_x, train_y, valid_y = train_test_split(self.data[self.feature_lst], self.data[self.key_lst],
                                                              test_size=split_ratio,
                                                              random_state=self.random_state)

        if self.order_strategy == 'InitOrd':
            sorted_train_x = train_x
            sorted_train_y = train_y
        elif self.order_strategy == 'SeqeOrd':
            sorted_train_x = train_x.sort_values(by=self.order_feather_lst)
            sorted_train_y = train_y.loc[sorted_train_x.index]
        else:
            train_x_np = train_x[self.order_feather_lst].values
            n_samples = train_x_np.shape[0]
            batch_size = n_samples // 100

            distances = np.zeros(n_samples)

            for i in range(0, n_samples, batch_size):
                end = min(i + batch_size, n_samples)
                batch_distances = np.sum(np.abs(train_x_np[i:end, np.newaxis, :] - train_x_np[np.newaxis, :, :]),
                                         axis=2).sum(axis=1)
                distances[i:end] = batch_distances
            train_x['distance_sum'] = distances
            sorted_train_x = train_x.sort_values(by='distance_sum')
            sorted_train_y = train_y.loc[sorted_train_x.index]

        # merge data
        data_train = pd.concat((sorted_train_x, sorted_train_y), axis=1)
        data_test = pd.concat((valid_x, valid_y), axis=1)

        if 'OneHot' not in self.dataset:
            self.convert_json_to_target_format(data_train, self.train_file_path)
            self.convert_json_to_target_format(data_test, self.test_file_path)

        data_train.to_csv('../data/processed_tabular/{}_scale{}_Split{}_{}_Cot{}_train.csv'.format(self.dataset, self.scale, self.split, self.order_strategy, self.cot), index=False)
        data_test.to_csv('../data/processed_tabular/{}_scale{}_Split{}_{}_Cot{}_test.csv'.format(self.dataset, self.scale, self.split, self.order_strategy, self.cot), index=False)
        self.data[self.feature_lst+self.key_lst].to_csv('../data/processed_tabular/{}_Scale{}.csv'.format(self.dataset, self.scale), index=False)

        print("last data len: {}".format(len(self.data)))
        print('done.')

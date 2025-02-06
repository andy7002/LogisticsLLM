# -*- coding: utf-8 -*-


import warnings

from sklearn.model_selection import train_test_split
import pandas as pd
from common import *
from llm_utils import *

warnings.filterwarnings("ignore")


class Logistics:
    def __init__(self, model_name, model_class, random_state, dataset, split, scale):
        # dataset
        self.input_file_path = r''

        self.dataset = dataset
        self.split = split
        self.scale = scale

        # feature
        self.candidate_feather_lst = []
        self.key_lst = []

        self.labels_train = []
        self.data_train_index_lst = []
        self.data_train_lst = []
        self.quantity_ratio_lst = []
        self.normal_dist_lst = []
        self.model_lst = []
        self.model_mse_lst = []
        self.model_price_mean_lst = []

        # model
        self.model_name = model_name
        self.model_class = model_class

        # random seed
        self.random_state = random_state

        # data
        self.data = pd.DataFrame()
        self.train_X = pd.DataFrame()
        self.train_cluster_X_t = torch.tensor([])
        self.train_y = pd.DataFrame()
        self.valid_X = pd.DataFrame()
        self.valid_y = pd.DataFrame()
        self.train_data = pd.DataFrame()

    def data_load(self):
        self.data = pd.read_csv(self.input_file_path)

        existing_features = set(self.data.columns)
        self.candidate_feather_lst = [feature for feature in self.candidate_feather_lst if feature in existing_features]

        split_ratio = split_ratio_lst.get(self.split)

        self.train_X, self.valid_X, self.train_y, self.valid_y = train_test_split(self.data[self.candidate_feather_lst],
                                                                                  self.data[self.key_lst],
                                                                                  test_size=split_ratio,
                                                                                  random_state=self.random_state)

        self.train_data = pd.concat((self.train_X, self.train_y), axis=1)

    def single_classify(self):
        model = self.create_model()
        model.fit(self.train_X, self.train_y)
        predict_y = model.predict(self.valid_X)
        return metrics(self.valid_y, predict_y, self.dataset == 'HEOneHot')

    def create_model(self):
        model = self.model_class(self.random_state)
        return model

    def run(self):
        self.data_load()
        return self.single_classify()


class Logistics_HackerEarth(Logistics):
    def __init__(self, model_name, model_class, random_state, dataset, split, scale):
        super().__init__(model_name, model_class, random_state, dataset, split, scale)

        self.input_file_path = r'../data/processed_tabular/{}_Scale{}.csv'.format(dataset, scale)

        if scale == '4':
            self.candidate_feather_lst = feather_he_onehot_few4_lst
        elif scale == '2':
            self.candidate_feather_lst = feather_he_onehot_few2_lst
        elif scale == '1':
            self.candidate_feather_lst = feather_he_onehot_few1_lst
        else:
            self.candidate_feather_lst = feather_he_onehot_full_lst

        self.key_lst = he_key


class Logistics_MathorCup(Logistics):
    def __init__(self, model_name, model_class, random_state,  dataset, split, scale):
        super().__init__(model_name, model_class, random_state, dataset, split, scale)

        self.input_file_path = r'../data/processed_tabular/{}_Scale{}.csv'.format(dataset, scale)

        self.candidate_feather_lst = feather_mc_onehot_full_lst

        self.key_lst = mc_key

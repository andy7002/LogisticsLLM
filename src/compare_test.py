import time
import argparse
from compare_model import *
from compare_base_model.model_mathor_cup import *
from compare_base_model.model_hacker_earth import *

import logging


# Create a logger
logger = logging.getLogger('my_logger')
logger.setLevel(logging.DEBUG)  # Set the log level to DEBUG

# Create a stream handler for console output
stream_handler = logging.StreamHandler()
stream_handler.setLevel(logging.DEBUG)  # Set the log level for the stream handler to DEBUG

# Create a formatter and add it to the handlers
formatter = logging.Formatter('%(asctime)s - %(message)s')
stream_handler.setFormatter(formatter)

# Add the handlers to the logger
logger.addHandler(stream_handler)

# model class for HackerEarth
model_classes_he_dict = {
    'xgboost': XGBoost_HackerEarth,
    'lgb': LightGBM_HackerEarth,
    'randomforest': RandomForest_HackerEarth,
    'gbdt': GBDT_HackerEarth,
    'extratrees': ExtraTrees_HackerEarth,
    'decisiontree': DecisionTree_HackerEarth,
    'dnns': DNNs_HackerEarth,
    'pls': PLS_HackerEarth,
    'lasso': LASSO_HackerEarth,
    'ridge': RIDGE_HackerEarth,
    'elasticNet': ELASTICNet_HackerEarth,
    'svr': Svr_HackerEarth
}

model_classes_he_few4_dict = {
    'xgboost': XGBoost_HackerEarth,
    'lgb': LightGBM_HackerEarth,
    'randomforest': RandomForest_HackerEarth,
    'gbdt': GBDT_HackerEarth,
    'extratrees': ExtraTrees_HackerEarth,
    'decisiontree': DecisionTree_HackerEarth,
    'dnns': DNNs_HackerEarth_Few4,
    'pls': PLS_HackerEarth,
    'lasso': LASSO_HackerEarth,
    'ridge': RIDGE_HackerEarth,
    'elasticNet': ELASTICNet_HackerEarth,
    'svr': Svr_HackerEarth
}

model_classes_he_few2_dict = {
    'xgboost': XGBoost_HackerEarth,
    'lgb': LightGBM_HackerEarth,
    'randomforest': RandomForest_HackerEarth,
    'gbdt': GBDT_HackerEarth,
    'extratrees': ExtraTrees_HackerEarth,
    'decisiontree': DecisionTree_HackerEarth,
    'dnns': DNNs_HackerEarth_Few2,
    'pls': PLS_HackerEarth,
    'lasso': LASSO_HackerEarth,
    'ridge': RIDGE_HackerEarth,
    'elasticNet': ELASTICNet_HackerEarth,
    'svr': Svr_HackerEarth
}

model_classes_he_few1_dict = {
    'xgboost': XGBoost_HackerEarth,
    'lgb': LightGBM_HackerEarth,
    'randomforest': RandomForest_HackerEarth,
    'gbdt': GBDT_HackerEarth,
    'extratrees': ExtraTrees_HackerEarth,
    'decisiontree': DecisionTree_HackerEarth,
    'dnns': DNNs_HackerEarth_Few1,
    'pls': PLS_HackerEarth,
    'lasso': LASSO_HackerEarth,
    'ridge': RIDGE_HackerEarth,
    'elasticNet': ELASTICNet_HackerEarth,
    'svr': Svr_HackerEarth
}

# model class for MathorCup
model_classes_mc_dict = {
    'xgboost': XGBoost_MathorCup,
    'lgb': LightGBM_MathorCup,
    'randomforest': RandomForest_MathorCup,
    'gbdt': GBDT_MathorCup,
    'extratrees': ExtraTrees_MathorCup,
    'decisiontree': DecisionTree_MathorCup,
    'dnns': DNNs_MathorCup,
    'pls': PLS_MathorCup,
    'lasso': LASSO_MathorCup,
    'ridge': RIDGE_MathorCup,
    'elasticNet': ELASTICNet_MathorCup,
    'svr': Svr_MathorCup
}

Logistics_Class_Map = {
    "HEOneHot": Logistics_HackerEarth,
    "MCOneHot": Logistics_MathorCup
}


def traverse(base_model_name, base_model_class, dataset, split, scale):
    # random seeds
    random_begin = 0
    random_count = 1
    # column names
    columns = ['split{}'.format(split)]
    # init result dataframe
    df_mae = pd.DataFrame(0, index=range(random_count), columns=columns)
    df_mse = pd.DataFrame(0, index=range(random_count), columns=columns)
    df_mape = pd.DataFrame(0, index=range(random_count), columns=columns)
    df_r2 = pd.DataFrame(0, index=range(random_count), columns=columns)
    # Logistics model
    Logistics_Class = Logistics_Class_Map[dataset]

    start_time = time.time()

    for random in range(random_begin, random_begin + random_count):
        mae, mse, mape, r2 = Logistics_Class(base_model_name, base_model_class, random, dataset, split, scale).run()

        write_result_compare(False, dataset, base_model_name, scale, split, mae, mse, mape, r2)

        df_mae.at[random - random_begin, 'split{}'.format(split)] = mae
        df_mse.at[random - random_begin, 'split{}'.format(split)] = mse
        df_mape.at[random - random_begin, 'split{}'.format(split)] = mape
        df_r2.at[random - random_begin, 'split{}'.format(split)] = r2

    end_time = time.time()

    mae_mean = round(df_mae['split{}'.format(split)].mean(), 2)
    mse_mean = round(df_mse['split{}'.format(split)].mean(), 2)
    mape_mean = round(df_mape['split{}'.format(split)].mean(), 6)
    r2_mean = round(df_r2['split{}'.format(split)].mean(), 6)
    duration_time = int(end_time - start_time)

    logger.debug("dataset: {}".format(dataset))
    logger.debug("base mode: {}".format(base_model_name))
    logger.debug("split: {}".format(split))
    logger.debug("scale: {}".format(scale))
    logger.debug("random_begin: {}, random_count: {}".format(random_begin, random_count))
    logger.debug(f"execution time: {duration_time} seconds")
    logger.debug("mae: {}".format(mae_mean))
    logger.debug("mse: {}".format(mse_mean))
    logger.debug("mape: {}".format(mape_mean))
    logger.debug("r2: {}".format(r2_mean))
    logger.debug("==================================")


def run_single_mode(dataset, split, scale):
    scale_mapping = {
        '1': model_classes_he_few1_dict,
        '2': model_classes_he_few2_dict,
        '4': model_classes_he_few4_dict
    }
    if dataset == 'HEOneHot':
        model_classes_dict = scale_mapping.get(scale, model_classes_he_dict)
    elif dataset == 'MCOneHot':
        model_classes_dict = model_classes_mc_dict
    else:
        print("Unknown dataset: {}".format(dataset))
        return

    for model_name, model_class in model_classes_dict.items():
        traverse(model_name, model_class, dataset, split, scale)


def run_batch_mode():
    scale_mapping = {
        '1': model_classes_he_few1_dict,
        '2': model_classes_he_few2_dict,
        '4': model_classes_he_few4_dict
    }
    for dataset in ['MCOneHot', 'HEOneHot']:

        scales = dataset_scale_settings.get((dataset, 'InitOrd', 'NamedFeatSeq', '82', '0'), dataset_scale_settings['default'])
        for scale in scales:
            if dataset == 'HEOneHot':
                model_classes_dict = scale_mapping.get(scale, model_classes_he_dict)
            else:
                model_classes_dict = model_classes_mc_dict
            for model_name, model_class in model_classes_dict.items():
                traverse(model_name, model_class, dataset, "82", scale)


if __name__ == '__main__':
    # Params #
    parser = argparse.ArgumentParser()
    parser.add_argument('--mode', default='SI', type=str, help='SI(single) or BA(batch)')
    parser.add_argument('--dataset', default='MCOneHot', type=str, help='MCOneHot(MathorCup) or HEOneHot(HackerEarth)')
    parser.add_argument('--split', default='82', type=str, help='82')
    parser.add_argument('--scale', default='100', type=str, help='100, 40, 10, 4, 2, 1, 0.5, 0.25')
    args = parser.parse_args()

    if args.mode == 'BA':
        run_batch_mode()
    else:
        run_single_mode(args.dataset, args.split, args.scale)

    write_result_compare(True)

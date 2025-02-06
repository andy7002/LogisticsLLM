import lightgbm as lgb
import catboost as cb
from sklearn.ensemble import RandomForestRegressor
from sklearn.ensemble import ExtraTreesRegressor
from sklearn import tree
from xgboost import XGBRegressor
from sklearn.ensemble import GradientBoostingRegressor
from .interface import *
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.optimizers import Adam
import numpy as np
import pandas as pd
import random
import joblib
# from pytorch_tabnet.tab_model import TabNetRegressor
import torch
from sklearn.cross_decomposition import PLSRegression
from sklearn.linear_model import Lasso, Ridge, ElasticNet
from sklearn.svm import SVR


class XGBoost_MathorCup(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/xgboost.model'
        self.model = XGBRegressor(max_depth=19, n_estimators=200)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        self.model.save_model(self.model_path)

    def load(self):
        self.model.load_model(self.model_path)


class LightGBM_MathorCup(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/lightgbm.model'
        self.model = lgb.LGBMRegressor(objective='regression', max_depth=15, n_estimators=200,
                                       num_leaves=int(2 ** 15 / 4), min_data_in_leaf=20, verbose=-1,
                                       random_state=random)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)


class CatBoost_MathorCup(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/catboost.model'
        self.model = cb.CatBoostRegressor(iterations=2000, learning_rate=0.1, depth=15, loss_function='MAE',
                                          verbose=False)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        self.model.save_model(self.model_path)

    def load(self):
        self.model.load_model(self.model_path)


class ExtraTrees_MathorCup(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/extratrees.model'
        self.model = ExtraTreesRegressor(n_estimators=200, max_depth=19, random_state=random)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)


class RandomForest_MathorCup(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/randomforest.model'
        self.model = RandomForestRegressor(n_estimators=100, max_depth=15, random_state=random)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)


class GBDT_MathorCup(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/gbdt.model'
        self.model = GradientBoostingRegressor(n_estimators=60, max_depth=17, random_state=random)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)


class DecisionTree_MathorCup(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/decisiontree.model'
        self.model = tree.DecisionTreeRegressor(max_depth=10, random_state=random)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)


class DNNs_MathorCup(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/dnns.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)

    def fit(self, x, y):
        # 构建DNN模型
        self.model = Sequential([
            Dense(64, activation='relu', input_shape=(x.shape[1],)),
            Dense(64, activation='relu'),
            Dense(32, activation='relu'),
            Dense(1)
        ])

        self.model.compile(optimizer=Adam(learning_rate=0.01), loss='mae')

        if isinstance(y, list):
            y = np.array(y)

        # 训练模型
        self.model.fit(x, y, epochs=50, batch_size=12, validation_split=0.2, verbose=0)
        # self.model.fit(x, y, epochs=100, batch_size=32, verbose=0)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        predict_valid = predict_valid.reshape(-1)
        return predict_valid

    def save(self):
        return

    def load(self):
        return


class TabNet_MathorCup(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/tabnet.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        # print(f'Using device: {self.device}')

    def fit(self, x, y):
        # 创建和训练TabNet回归模型
        self.model = TabNetRegressor(device_name=self.device, verbose=0)

        if isinstance(y, pd.DataFrame):
            y = y.values
        elif isinstance(y, list):
            y = np.array(y)
            y = y.reshape(-1, 1)

        self.model.fit(
            x, y,
            max_epochs=20,
            patience=10,
            batch_size=1024,
            # virtual_batch_size=16
        )

    def predict(self, x):
        x = torch.tensor(x.values, dtype=torch.float32)
        y_pred = self.model.predict(x)
        y_pred = y_pred.reshape(-1)
        return y_pred

    def save(self):
        return

    def load(self):
        return


class PLS_MathorCup(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/sgd.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)
        self.model = PLSRegression(n_components=2)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        y_pred = self.model.predict(x)
        return y_pred

    def save(self):
        return

    def load(self):
        return


class LASSO_MathorCup(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/lasso.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)
        self.model = Lasso(alpha=0.1)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        y_pred = self.model.predict(x)
        return y_pred

    def save(self):
        return

    def load(self):
        return


class RIDGE_MathorCup(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/lasso.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)
        self.model = Ridge(alpha=0.1)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        y_pred = self.model.predict(x)
        return y_pred

    def save(self):
        return

    def load(self):
        return


class ELASTICNet_MathorCup(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/elasticNet.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)
        self.model = ElasticNet(alpha=1.0, l1_ratio=0.5)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        y_pred = self.model.predict(x)
        return y_pred

    def save(self):
        return

    def load(self):
        return


class Svr_MathorCup(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/svr.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)
        self.model = SVR(kernel='rbf', C=100, gamma=0.1, epsilon=0.1)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        y_pred = self.model.predict(x)
        return y_pred

    def save(self):
        return

    def load(self):
        return

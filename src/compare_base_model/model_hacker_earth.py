import lightgbm as lgb
import catboost as cb
from sklearn.ensemble import RandomForestRegressor
from sklearn.ensemble import ExtraTreesRegressor
from sklearn import tree
from xgboost import XGBRegressor
from sklearn.ensemble import GradientBoostingRegressor
from .interface import *
import tensorflow as tf
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader, TensorDataset
import numpy as np
import pandas as pd
import random
import joblib
from pytorch_tabnet.tab_model import TabNetRegressor
import torch
from sklearn.cross_decomposition import PLSRegression
from sklearn.linear_model import Lasso, Ridge, ElasticNet
from sklearn.svm import SVR


class XGBoost_HackerEarth(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/he/xgboost.model'
        # self.model = XGBRegressor(max_depth=19, n_estimators=200)
        self.model = XGBRegressor(max_depth=3, n_estimators=200, learning_rate=0.01)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        self.model.save_model(self.model_path)

    def load(self):
        self.model.load_model(self.model_path)


class LightGBM_HackerEarth(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/he/lightgbm.model'
        self.model = lgb.LGBMRegressor(objective='regression', max_depth=15, n_estimators=100, learning_rate=0.01,
                                       num_leaves=int(2 ** 15 / 4), min_data_in_leaf=40, verbose=-1,
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


class CatBoost_HackerEarth(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/he/catboost.model'
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


class ExtraTrees_HackerEarth(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/he/extree.model'
        self.model = ExtraTreesRegressor(n_estimators=200, max_depth=3, random_state=random)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)


class RandomForest_HackerEarth(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/he/rdforest.model'
        self.model = RandomForestRegressor(max_depth=4, n_estimators=400, random_state=random)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)


class GBDT_HackerEarth(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/he/gbdt.model'
        self.model = GradientBoostingRegressor(n_estimators=400, max_depth=3, learning_rate=0.01,
                                               random_state=random)
        #self.model = GradientBoostingRegressor()

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)


class DecisionTree_HackerEarth(ModelAbc):
    def __init__(self, random):
        self.model_path = 'models/he/decisiontree.model'
        self.model = tree.DecisionTreeRegressor(max_depth=3, min_samples_split=4,
                                                min_samples_leaf=0.1, random_state=random)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        predict_valid = self.model.predict(x)
        return predict_valid

    def save(self):
        joblib.dump(self.model, self.model_path)

    def load(self):
        self.model = joblib.load(self.model_path)

class DNNs_HackerEarth(nn.Module):
    def __init__(self, random_seed):
        super(DNNs_HackerEarth, self).__init__()
        self.model_path = 'models/he/dnns.model'
        np.random.seed(random_seed)
        torch.manual_seed(random_seed)
        random.seed(random_seed)

        # Device configuration - checks if GPU is available and sets the device accordingly
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

        # Model architecture definition
        self.layers = nn.Sequential(
            nn.Linear(102, 1024),
            nn.ReLU(),
            nn.Dropout(0.4),

            nn.Linear(1024, 512),
            nn.ReLU(),
            nn.Dropout(0.3),

            nn.Linear(512, 256),
            nn.ReLU(),
            nn.Dropout(0.3),

            nn.Linear(256, 128),
            nn.ReLU(),
            nn.Dropout(0.3),

            nn.Linear(128, 1)
        ).to(self.device)  # Moves the model to the specified device (GPU or CPU)

    def forward(self, x):
        return self.layers(x)

    def fit(self, x, y, epochs=50, batch_size=16):
        # Data conversion: converts pandas DataFrame to numpy if necessary
        if isinstance(x, pd.DataFrame):
            x = x.values
        if isinstance(y, pd.DataFrame):
            y = y.values
        x_tensor = torch.tensor(x, dtype=torch.float32).to(self.device)  # Converts data to tensors and moves to device
        y_tensor = torch.tensor(y, dtype=torch.float32).view(-1, 1).to(self.device)
        dataset = TensorDataset(x_tensor, y_tensor)  # Creates a dataset from tensors
        dataloader = DataLoader(dataset, batch_size=batch_size,
                                shuffle=True)  # Creates a DataLoader for batch processing

        # Sets up the optimizer and the loss function
        optimizer = optim.Adam(self.parameters(), lr=0.01)
        criterion = nn.L1Loss()

        # Training mode
        self.train()

        for epoch in range(epochs):
            for batch_x, batch_y in dataloader:
                optimizer.zero_grad()  # Zero the gradients
                outputs = self(batch_x)  # Forward pass
                loss = criterion(outputs, batch_y)  # Calculate loss
                loss.backward()  # Backpropagation
                optimizer.step()  # Update weights

    def predict(self, x):
        self.eval()  # Sets the module in evaluation mode
        if isinstance(x, pd.DataFrame):
            x = x.values
        x_tensor = torch.tensor(x, dtype=torch.float32).to(self.device)  # Converts data to tensor and moves to device
        with torch.no_grad():  # Disables gradient calculation
            outputs = self(x_tensor)
        return outputs.cpu().numpy().reshape(-1)  # Moves outputs to CPU and converts them to numpy array for return


class DNNs_HackerEarth_Few4(nn.Module):
    def __init__(self, random_seed):
        super(DNNs_HackerEarth_Few4, self).__init__()
        self.model_path = 'models/he/dnns_few4.model'
        np.random.seed(random_seed)
        torch.manual_seed(random_seed)
        random.seed(random_seed)

        # Device configuration - checks if GPU is available and sets the device accordingly
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

        # Model architecture definition
        self.layers = nn.Sequential(
            # nn.Linear(100, 100),
            # nn.ReLU(),
            # nn.Dropout(0.4),

            nn.Linear(100, 64),
            nn.ReLU(),
            nn.Dropout(0.3),

            nn.Linear(64, 1)
        ).to(self.device)  # Moves the model to the specified device (GPU or CPU)

    def forward(self, x):
        return self.layers(x)

    def fit(self, x, y, epochs=50, batch_size=16):
        # Data conversion: converts pandas DataFrame to numpy if necessary
        if isinstance(x, pd.DataFrame):
            x = x.values
        if isinstance(y, pd.DataFrame):
            y = y.values
        x_tensor = torch.tensor(x, dtype=torch.float32).to(self.device)  # Converts data to tensors and moves to device
        y_tensor = torch.tensor(y, dtype=torch.float32).view(-1, 1).to(self.device)
        dataset = TensorDataset(x_tensor, y_tensor)  # Creates a dataset from tensors
        dataloader = DataLoader(dataset, batch_size=batch_size,
                                shuffle=True)  # Creates a DataLoader for batch processing

        # Sets up the optimizer and the loss function
        optimizer = optim.Adam(self.parameters(), lr=0.01)
        criterion = nn.L1Loss()

        # Training mode
        self.train()

        for epoch in range(epochs):
            for batch_x, batch_y in dataloader:
                optimizer.zero_grad()  # Zero the gradients
                outputs = self(batch_x)  # Forward pass
                loss = criterion(outputs, batch_y)  # Calculate loss
                loss.backward()  # Backpropagation
                optimizer.step()  # Update weights

    def predict(self, x):
        self.eval()  # Sets the module in evaluation mode
        if isinstance(x, pd.DataFrame):
            x = x.values
        x_tensor = torch.tensor(x, dtype=torch.float32).to(self.device)  # Converts data to tensor and moves to device
        with torch.no_grad():  # Disables gradient calculation
            outputs = self(x_tensor)
        return outputs.cpu().numpy().reshape(-1)  # Moves outputs to CPU and converts them to numpy array for return


class DNNs_HackerEarth_Few2(nn.Module):
    def __init__(self, random_seed):
        super(DNNs_HackerEarth_Few2, self).__init__()
        self.model_path = 'models/he/dnns_few2.model'
        np.random.seed(random_seed)
        torch.manual_seed(random_seed)
        random.seed(random_seed)

        # Device configuration - checks if GPU is available and sets the device accordingly
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

        # Model architecture definition
        self.layers = nn.Sequential(
            # nn.Linear(100, 100),
            # nn.ReLU(),
            # nn.Dropout(0.4),

            nn.Linear(91, 64),
            nn.ReLU(),
            nn.Dropout(0.3),

            nn.Linear(64, 1)
        ).to(self.device)  # Moves the model to the specified device (GPU or CPU)

    def forward(self, x):
        return self.layers(x)

    def fit(self, x, y, epochs=50, batch_size=16):
        # Data conversion: converts pandas DataFrame to numpy if necessary
        if isinstance(x, pd.DataFrame):
            x = x.values
        if isinstance(y, pd.DataFrame):
            y = y.values
        x_tensor = torch.tensor(x, dtype=torch.float32).to(self.device)  # Converts data to tensors and moves to device
        y_tensor = torch.tensor(y, dtype=torch.float32).view(-1, 1).to(self.device)
        dataset = TensorDataset(x_tensor, y_tensor)  # Creates a dataset from tensors
        dataloader = DataLoader(dataset, batch_size=batch_size,
                                shuffle=True)  # Creates a DataLoader for batch processing

        # Sets up the optimizer and the loss function
        optimizer = optim.Adam(self.parameters(), lr=0.01)
        criterion = nn.L1Loss()

        # Training mode
        self.train()

        for epoch in range(epochs):
            for batch_x, batch_y in dataloader:
                optimizer.zero_grad()  # Zero the gradients
                outputs = self(batch_x)  # Forward pass
                loss = criterion(outputs, batch_y)  # Calculate loss
                loss.backward()  # Backpropagation
                optimizer.step()  # Update weights

    def predict(self, x):
        self.eval()  # Sets the module in evaluation mode
        if isinstance(x, pd.DataFrame):
            x = x.values
        x_tensor = torch.tensor(x, dtype=torch.float32).to(self.device)  # Converts data to tensor and moves to device
        with torch.no_grad():  # Disables gradient calculation
            outputs = self(x_tensor)
        return outputs.cpu().numpy().reshape(-1)  # Moves outputs to CPU and converts them to numpy array for return

class DNNs_HackerEarth_Few1(nn.Module):
    def __init__(self, random_seed):
        super(DNNs_HackerEarth_Few1, self).__init__()
        self.model_path = 'models/he/dnns_few2.model'
        np.random.seed(random_seed)
        torch.manual_seed(random_seed)
        random.seed(random_seed)

        # Device configuration - checks if GPU is available and sets the device accordingly
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

        # Model architecture definition
        self.layers = nn.Sequential(
            # nn.Linear(100, 100),
            # nn.ReLU(),
            # nn.Dropout(0.4),

            nn.Linear(80, 24),
            nn.ReLU(),
            nn.Dropout(0.3),

            nn.Linear(24, 1)
        ).to(self.device)  # Moves the model to the specified device (GPU or CPU)

    def forward(self, x):
        return self.layers(x)

    def fit(self, x, y, epochs=50, batch_size=16):
        # Data conversion: converts pandas DataFrame to numpy if necessary
        if isinstance(x, pd.DataFrame):
            x = x.values
        if isinstance(y, pd.DataFrame):
            y = y.values
        x_tensor = torch.tensor(x, dtype=torch.float32).to(self.device)  # Converts data to tensors and moves to device
        y_tensor = torch.tensor(y, dtype=torch.float32).view(-1, 1).to(self.device)
        dataset = TensorDataset(x_tensor, y_tensor)  # Creates a dataset from tensors
        dataloader = DataLoader(dataset, batch_size=batch_size,
                                shuffle=True)  # Creates a DataLoader for batch processing

        # Sets up the optimizer and the loss function
        optimizer = optim.Adam(self.parameters(), lr=0.01)
        criterion = nn.L1Loss()

        # Training mode
        self.train()

        for epoch in range(epochs):
            for batch_x, batch_y in dataloader:
                optimizer.zero_grad()  # Zero the gradients
                outputs = self(batch_x)  # Forward pass
                loss = criterion(outputs, batch_y)  # Calculate loss
                loss.backward()  # Backpropagation
                optimizer.step()  # Update weights

    def predict(self, x):
        self.eval()  # Sets the module in evaluation mode
        if isinstance(x, pd.DataFrame):
            x = x.values
        x_tensor = torch.tensor(x, dtype=torch.float32).to(self.device)  # Converts data to tensor and moves to device
        with torch.no_grad():  # Disables gradient calculation
            outputs = self(x_tensor)
        return outputs.cpu().numpy().reshape(-1)  # Moves outputs to CPU and converts them to numpy array for return


class TabNet_HackerEarth(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/he/tabnet.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        # print(f'Using device: {self.device}')

    def fit(self, x, y):
        # 创建和训练TabNet回归模型
        self.model = TabNetRegressor(device_name='cuda', verbose=0)

        if isinstance(y, pd.DataFrame):
            y = y.values
        elif isinstance(y, list):
            y = np.array(y)
            y = y.reshape(-1, 1)

        if isinstance(x, pd.DataFrame):
            x = x.values

        self.model.fit(
            x, y,
            max_epochs=30,
            patience=20,
            batch_size=8,
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


class PLS_HackerEarth(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/he/pls.model'
        np.random.seed(random_seed)
        tf.random.set_seed(random_seed)
        random.seed(random_seed)
        self.model = PLSRegression(n_components=1, scale=True, max_iter=300, tol=1e-07)

    def fit(self, x, y):
        self.model.fit(x, y)

    def predict(self, x):
        y_pred = self.model.predict(x)
        y_pred = y_pred.reshape(-1)
        return y_pred

    def save(self):
        return

    def load(self):
        return


class LASSO_HackerEarth(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/he/lasso.model'
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


class RIDGE_HackerEarth(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/he/ridge.model'
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


class ELASTICNet_HackerEarth(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/he/elnet.model'
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


class Svr_HackerEarth(ModelAbc):
    def __init__(self, random_seed):
        self.model_path = 'models/he/svr.model'
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

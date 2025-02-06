from abc import ABC, abstractmethod

class ModelAbc(ABC):
    # Model interface class

    # Training interface
    @abstractmethod
    def fit(self, x, y):
        pass

    # Prediction interface
    @abstractmethod
    def predict(self, x):
        pass

    # Save Model Interface
    @abstractmethod
    def save(self):
        pass

    # Loading model interface
    @abstractmethod
    def load(self):
        pass


class DataBaseABC(ABC):
    # Data Interface Class

    @abstractmethod
    def load_data(self):
        pass

    @abstractmethod
    def remove_empty(self):
        # 去除空数据
        return

    @abstractmethod
    def fix_error(self):
        # 修复错误数据
        pass

    @abstractmethod
    def handle_time(self):
        # 计算时长
        pass

    @abstractmethod
    def one_hot_encode(self):
        pass

    @abstractmethod
    def save_data(self):
        pass
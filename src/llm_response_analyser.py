from abc import ABC, abstractmethod
import re


# Define an abstract base class (ABC) as an interface
class Analyser(ABC):

    # Define an abstract method for parsing the LLMs response
    @abstractmethod
    def parse(self, response):
        pass


# Subclass that inherits the abstract base class and implements the interface methods
class MC_GLM4_9B_Chat_Analyser(Analyser):
    def __init__(self):
        return

    # Implement the area method for Rectangle
    def parse(self, response):
        price = response.split('\n')[1]

        try:
            price = int(price)
        except Exception as e:
            print(">>>>>MC_GLM4_9B_Chat_Analyser Error:", e)
            print(response)
            price = 1000
        return price


class MC_Qwen2_7B_Analyser(Analyser):
    def __init__(self):
        return

    # Implement the area method for Rectangle
    def parse(self, response):

        price = response.split('\n')[0]

        try:
            price = int(price)
        except Exception as e:
            print(">>>>>MC_Qwen2_7B_Analyser Error:", e)
            print(response)
            price = 1000
        return price


class MC_Qwen2_7B_Instruct_Analyser(Analyser):
    def __init__(self):
        return

    # Implement the area method for Rectangle
    def parse(self, response):

        price = response.split('\n')[0]

        try:
            price = float(price)
        except Exception as e:
            print(">>>>>MC_Qwen2_7B_Instruct_Analyser Error:", e)
            print(response)
            price = 1000
        return price


class MC_Llama3_8B_Instruct_Analyser(Analyser):
    def __init__(self):
        return

    # Implement the area method for Rectangle
    def parse(self, response):

        price = response.split('\n')[0]

        try:
            price = int(price)
        except Exception as e:
            print(">>>>>MC_Llama_8B_Instruct_Analyser Error:", e)
            print(response)
            price = 1000
        return price


# Subclass that inherits the abstract base class and implements the interface methods
class HE_GLM4_9B_Chat_Analyser(Analyser):
    def __init__(self):
        return

    # Implement the area method for Rectangle
    def parse(self, response):
        price = response.split('\n')[1]

        matched_number = re.match(r'^\d*\.?\d+', price)
        price = matched_number.group()

        try:
            price = float(price)
        except Exception as e:
            print(">>>>>HE_GLM4_9B_Chat_Analyser Error:", e)
            print(response)
            price = 1000
        return price


class HE_Qwen2_7B_Instruct_Analyser(Analyser):
    def __init__(self):
        return

    # Implement the area method for Rectangle
    def parse(self, response):

        price = response.split('\n')[0]
        # price = re.findall(r'[0-9]*\.[0-9]+|[0-9]+', price)
        price = re.findall(r'\d+\.\d+|\d+', price)

        price = price[0]

        try:
            price = float(price)
        except Exception as e:
            print(">>>>>HE_Qwen2_7B_Instruct_Analyser Error:", e)
            print(response)
            price = 1000
        return price


class HE_Llama3_8B_Instruct_Analyser(Analyser):
    def __init__(self):
        return

    # Implement the area method for Rectangle
    def parse(self, response):

        price = response.split('\n')[0]

        price = re.findall(r'[0-9]*\.[0-9]+|[0-9]+', price)
        price = price[0]

        try:
            price = float(price)
        except Exception as e:
            print(">>>>>HE_Llama_3_1_8B_Instruct_Analyser Error:", e)
            print(response)
            price = 1000
        return price


def select_analyse_class(dataset_name, model_name):
    class_mapping = {
        ("MC", "GLM4-9b-chat"): MC_GLM4_9B_Chat_Analyser,
        ("HE", "GLM4-9b-chat"): HE_GLM4_9B_Chat_Analyser,

        ("MC", "llama-3-8b-instruct"): MC_Llama3_8B_Instruct_Analyser,

        ("MC", "Qwen2.5-7B-Instruct"): MC_Qwen2_7B_Instruct_Analyser,

        ("HE", "Qwen2.5-7B-Instruct"): HE_Qwen2_7B_Instruct_Analyser,

        ("HE", "llama-3-8b-instruct"): HE_Llama3_8B_Instruct_Analyser
    }
    return class_mapping.get((dataset_name, model_name), None)

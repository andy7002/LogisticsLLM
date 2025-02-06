# -*- coding: utf-8 -*-

from data_base_interface import *
from common import *
import os
import json


class DataBaseHackerEarth(DataBaseABC):
    def __init__(self, feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale):
        super().__init__('HE', feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale)

        self.input_file_path = r'../data/raw/train.csv'

        self.random_state = random_state
        self.translation_dict = mc_translation_dict
        self.order_feather_lst = order_feather_he_lst

        self.drop_lst = ["Customer Id", "Artist Name", "Remote Location", "Scheduled Date", "Delivery Date",
                         # "Transport", "Month", "Year", "Week"
                         ]

    def load_data(self):
        self.data = pd.read_csv(self.input_file_path)
        if '100' != self.scale:
            self.data = self.data.sample(frac=int(self.scale) / 100, random_state=0)
        return True

    def remove_empty(self):
        self.data.dropna(axis=1, how="all", inplace=True)
        self.data.dropna(axis=0, how="all", inplace=True)
        return

    def pre_handle(self):
        return

    def fix_error(self):
        mean_to_be_filled = ["Artist Reputation", "Height", "Width", "Weight"]
        not_available_to_be_filled = ["Transport", "Material", "Remote Location"]

        for i in mean_to_be_filled:
            values = []
            counts = []
            tmp = self.data[i].value_counts()
            for val, count in tmp.items():
                values.append(val)
                counts.append(count)
            weighted_avg_artist_reputation = np.average(values, weights=counts)
            self.data[i].fillna(weighted_avg_artist_reputation, inplace=True)

        for i in not_available_to_be_filled:
            self.data[i].fillna(self.data[i].mode()[0], inplace=True)

        self.data["Customer Location"] = self.clean_customer_location(self.data["Customer Location"])

        self.data['Cost'] = self.data['Cost'].abs()

        # self.data = self.data[self.data['Cost'] < 4000000]

        self.data['Cost'] = np.log1p(self.data['Cost'])

        self.data['Area'] = self.data.apply(lambda x: x['Height'] * x['Width'], axis=1)
        self.data['Combined_Price'] = self.data.apply(lambda x: x['Price Of Sculpture'] + x['Base Shipping Price'],
                                                      axis=1)

        self.data = self.remove_outliers_iqr(self.data, 'Height')
        self.data = self.remove_outliers_iqr(self.data, 'Width')
        self.data = self.remove_outliers_iqr(self.data, 'Weight')
        self.data = self.remove_outliers_iqr(self.data, 'Price Of Sculpture')

    def handle_time(self):
        self.data['Scheduled Date'] = pd.to_datetime(self.data['Scheduled Date'])
        self.data['Delivery Date'] = pd.to_datetime(self.data['Delivery Date'])

        self.data['Duration'] = (self.data['Scheduled Date'] - self.data['Delivery Date']).dt.days

        # self.data['Day'] = self.data['Delivery Date'].dt.day
        self.data['Month'] = self.data['Delivery Date'].dt.month
        self.data['Year'] = self.data['Delivery Date'].dt.year
        self.data['Week'] = self.data['Delivery Date'].dt.dayofweek

        self.data['Month'] = self.data['Month'].astype(int)
        self.data['Year'] = self.data['Year'].astype(int)
        self.data['Week'] = self.data['Week'].astype(int)

    def one_hot_encode(self):
        return

    # from https://www.kaggle.com/code/rachitjain124/exhibition-art-shipment-cost-prediction
    def remove_outliers_iqr(self, dataframe, column):
        """
        Removes outliers from a specified column in a pandas DataFrame using the Interquartile Range (IQR) method.

        Parameters:
        dataframe (pandas.DataFrame): The DataFrame from which outliers are to be removed.
        column (str): The name of the column from which outliers will be removed.

        Returns:
        pandas.DataFrame: A DataFrame with outliers removed from the specified column.
        """
        # Extract the data from the specified column
        data = dataframe[column]
        # Calculate the first quartile (Q1)
        Q1 = data.quantile(0.25)
        # Calculate the third quartile (Q3)
        Q3 = data.quantile(0.75)
        # Compute the Interquartile Range (IQR)
        IQR = Q3 - Q1
        # Define the lower bound for filtering out outliers
        lower_bound = Q1 - 1.5 * IQR
        # Define the upper bound for filtering out outliers
        upper_bound = Q3 + 1.5 * IQR
        # Filter out the data points outside of the defined bounds and create the cleaned DataFrame
        cleaned_dataframe = dataframe[(data > lower_bound) & (data < upper_bound)]
        # Return the DataFrame with outliers removed
        return cleaned_dataframe

    def convert_json_to_target_format(self, pd_data, output_file):
        converted_data = []
        question_result = ''
        instruction = ''

        if os.path.exists(output_file):
            os.remove(output_file)

        with open(output_file, "a") as file:
            file.write('[\n')

        for index, row in pd_data.iterrows():
            # question
            if self.sequence == 'ValueOnlySeq':
                question_result = ' '.join([str(self.translation_dict.get(row[col2], row[col2])) for col1, col2 in
                                            zip(self.feature_en_lst, self.feature_lst)])
            elif self.sequence == 'NamedFeatSeq':
                question_result = ', '.join(
                    [f"{col1} is {self.translation_dict.get(row[col2], row[col2])}" for col1, col2 in
                     zip(self.feature_en_lst, self.feature_lst)])
            elif self.sequence == 'ListTempSeq':
                question_result = '\n'.join(
                    [f"{col1}: {self.translation_dict.get(row[col2], row[col2])}" for col1, col2 in
                     zip(self.feature_en_lst, self.feature_lst)])
            elif self.sequence == 'JsonSeq':
                question_result = "{" + ", ".join(
                    [f'"{col1}": "{self.translation_dict.get(row[col2], row[col2])}"'
                     for col1, col2 in zip(self.feature_en_lst, self.feature_lst)]) + "}"

            answer_result = ', '.join([f"{row[col]}" for col in self.key_lst])
            instruction = "As a network freight dispatcher, you are tasked with predicting the freight cost. Please use the provided shipment details to estimate the freight cost. The answer only outputs one number."

            # llm input
            converted_data.append({
                "instruction": instruction,
                "input": question_result,
                "output": answer_result
            })

        with open(output_file, 'w', encoding='utf-8') as f:
            for item in converted_data:
                json.dump(item, f, ensure_ascii=False)
                f.write('\n')

    def clean_customer_location(self, df):
        converted_list_1 = []
        for i in df:
            converted_list_1.append(i.split()[-2])
        return converted_list_1

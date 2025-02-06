# -*- coding: utf-8 -*-

import time
import os
import json
from data_base_interface import *


class DataBaseMathorCup(DataBaseABC):
    def __init__(self, feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale):
        super().__init__('MC', feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale)

        self.input_file_path = r'../data/raw/附件1：货运线路历史交易数据.xlsx'

        self.random_state = random_state
        self.translation_dict = mc_translation_dict
        self.order_feather_lst = order_feather_mc_lst

        self.drop_lst = ['子包号', '装卸的次数', '装的次数', '卸的次数', '是否需要装卸', '任务状态'
            , '标的状态', '异常状态', '交易模式', '需求状态', '任务id'
            , '标的_创建日期', '标的_创建时间', '交易开始时间', '分拨时间', '调价ECP创建时间'
            , '计划卸货等待时长', 'C端议价最低价', 'B端议价最低价', '标的状态'
            , '最后一次询价时间', '起止省份终止省份始发网点目的网点', '调价比例'
            , 'C端议价最低价', 'B端议价最低价', 'B端议价反馈数量', 'C端议价反馈数量', '车辆类型'
            , '计划发车日期', '计划发车时间', '计划到达时间', '计划卸货完成时间', '实际发车时间', '实际到车时间'
            , '实际到车时间', '实际结束时间', '最后一次询价时间', '调价审核完成时间', '实际靠车时间', '实际发车时间'
            , '计划靠车时间', '交易成功日期', '交易成功时间', '交易结束时间'
        ]

    def load_data(self):
        self.data = pd.read_excel(self.input_file_path)
        if '100' != self.scale:
            self.data = self.data.sample(frac=float(self.scale) / 100, random_state=0)
        return True

    def pre_handle(self):
        return

    def remove_empty(self):
        # 去除空数据
        self.data = self.data[~self.data['是否续签'].isin(['续签ECP审批驳回或撤销', '未知'])]
        self.data = self.data[~self.data['始发地省份名称'].isin(['N'])]
        self.data = self.data[~self.data['线路总成本'].isin(['N'])]
        self.data = self.data[~self.data['线路价格（不含税）'].isin(['N'])]
        self.data = self.data[~self.data['调价紧急程度'].isin(['N'])]
        self.data = self.data[~self.data['实际结束时间'].isin(['N'])]

    def fix_error(self):
        # 修复错误数据
        self.data['计划卸货完成时间'] = self.data.apply(
            lambda x: self.add_min_time('%s' % (x['计划到达时间']), 41) if x['计划卸货完成时间'] == 'N' else x[
                '计划卸货完成时间'], axis=1)
        self.data['调价审核完成时间'] = self.data.apply(
            lambda x: x['调价ECP创建时间'] if x['调价审核完成时间'] == 'N' else x['调价审核完成时间'], axis=1)

        self.data['始发地省份名称'] = self.data.apply(
            lambda x: '广东省' if x['始发地省份名称'] == 'N' and x['总里程'] == 144 else x['始发地省份名称'], axis=1)
        self.data['目的地省份名称'] = self.data.apply(
            lambda x: '广东省' if x['目的地省份名称'] == 'N' and x['总里程'] == 144 else x['目的地省份名称'], axis=1)

    def handle_time(self):
        # 计算时长
        self.data['计划靠车前可用分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s %s' % (x['标的_创建日期'].strftime("%Y-%m-%d"), x['标的_创建时间']),
                                        '%s' % (x['计划靠车时间'])), axis=1)
        self.data['计划发车前可用分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s %s' % (x['标的_创建日期'].strftime("%Y-%m-%d"), x['标的_创建时间']),
                                        '%s' % (x['计划发车时间'])), axis=1)
        self.data['计划到达前行驶分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s' % (x['计划发车时间']), '%s' % (x['计划到达时间'])), axis=1)
        self.data['计划卸货分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s' % (x['计划到达时间']), '%s' % (x['计划卸货完成时间'])), axis=1)
        self.data['交易运行分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s %s' % (x['交易成功日期'].strftime("%Y-%m-%d"), x['交易成功时间']),
                                        '%s' % (x['交易结束时间'])), axis=1)
        self.data['实际靠车前可用分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s %s' % (x['标的_创建日期'].strftime("%Y-%m-%d"), x['标的_创建时间']),
                                        '%s' % (x['实际靠车时间'])), axis=1)
        self.data['实际发车前可用分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s %s' % (x['标的_创建日期'].strftime("%Y-%m-%d"), x['标的_创建时间']),
                                        '%s' % (x['实际发车时间'])), axis=1)
        self.data['实际结束前分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s' % (x['实际到车时间']), '%s' % (x['实际结束时间'])), axis=1)
        self.data['调价审核分钟数'] = self.data.apply(
            lambda x: self.get_last_min('%s' % (x['最后一次询价时间']), '%s' % (x['调价审核完成时间'])), axis=1)
        self.data['车辆类型'] = self.data.apply(lambda x: ('%s_%s' % (x['车辆长度'], x['车辆吨位'])), axis=1)
        self.data['起止省份终止省份始发网点目的网点'] = self.data.apply(
            lambda x: ('%s_%s_%s_%s' % (x['始发地省份名称'], x['目的地省份名称'], x['始发网点'], x['目的网点'])),
            axis=1)

        self.data = self.data[self.data['计划靠车前可用分钟数'] > 0]
        self.data = self.data[self.data['计划发车前可用分钟数'] > 0]
        self.data = self.data[self.data['计划到达前行驶分钟数'] > 0]
        self.data = self.data[self.data['计划卸货分钟数'] > 0]
        self.data = self.data[self.data['交易运行分钟数'] > 0]
        self.data = self.data[self.data['实际靠车前可用分钟数'] > 0]
        self.data = self.data[self.data['实际发车前可用分钟数'] > 0]
        self.data = self.data[self.data['实际结束前分钟数'] > 0]
        self.data = self.data[self.data['调价审核分钟数'] > 0]

    def one_hot_encode(self):
        return

    def convert_json_to_target_format(self, pd_data, output_file):
        instruction = ''
        question_result = ''
        converted_data = []

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

    @staticmethod
    def get_last_min(start, end):
        start_time_array = time.strptime(start, "%Y-%m-%d %H:%M:%S")
        end_time_array = time.strptime(end, "%Y-%m-%d %H:%M:%S")
        start_time_stamp = time.mktime(start_time_array)
        end_time_stamp = time.mktime(end_time_array)
        return round((end_time_stamp - start_time_stamp) / 60, 6)

    @staticmethod
    def add_min_time(start_time, min):
        start_time_array = time.strptime(start_time, "%Y-%m-%d %H:%M:%S")
        start_time_stamp = time.mktime(start_time_array)
        start_time_stamp += 60 * min
        x = time.localtime(start_time_stamp)
        new_time = time.strftime('%Y-%m-%d %H:%M:%S', x)
        return new_time

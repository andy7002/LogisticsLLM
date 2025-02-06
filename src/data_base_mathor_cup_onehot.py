# -*- coding: utf-8 -*-

import time
from data_base_interface import *
from common import *


class DataBaseMathorCupOneHot(DataBaseABC):
    def __init__(self, feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale):
        super().__init__('MCOneHot', feature_lst, feature_en_lst, key_lst, order_strategy, sequence, split, cot, scale)

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
            self.data = self.data.sample(frac=float(self.scale) / 100, random_state=random_state)
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

    def category_feature(self, ori_feature_name, new_feature_name):
        full_features = [col.replace('{}_'.format(new_feature_name), '') for col in feather_mc_onehot_full_lst if col.startswith('{}_'.format(new_feature_name))]

        self.data[ori_feature_name] = pd.Categorical(self.data[ori_feature_name], categories=full_features)

        self.data = self.data.join(pd.get_dummies(self.data[ori_feature_name], prefix=new_feature_name).astype(int))

    def one_hot_encode(self):
        # 数值化
        self.data['业务类型'] = self.data['业务类型'].apply(lambda x: 1 if x == '重货' else 0)  # 重货1，速货0
        self.data['需求类型1'] = self.data['需求类型1'].apply(lambda x: 1 if x == '普通' else 0)  # 普通1，区域发货0
        self.data['需求类型2'] = self.data['需求类型2'].apply(lambda x: 1 if x == '临时' else 0)  # 临时1，计划0
        self.data['是否续签'] = self.data['是否续签'].apply(lambda x: 1 if x == '非续签' else 0)  # 非续签1，已分拨续签0
        self.data['标的展示策略'] = self.data['标的展示策略'].apply(lambda x: 1 if x == 'BDC' else 0)  # BDC 1，DIR 0
        self.data['地区类型'] = self.data['地区类型'].apply(lambda x: 1 if x == '分拨区' else 0)  # 分拨区 1，业务区0
        self.data['省内省外'] = self.data.apply(lambda x: 0 if x['始发地省份名称'] == x['目的地省份名称'] else 1,
                                                axis=1)  # 省内0，省外1

        # onehot编码
        self.category_feature('始发地省份名称', '始发地')
        self.category_feature('地区', '地区')
        self.category_feature('目的地省份名称', '目的地')
        self.category_feature('车辆类型分类', '车辆类型分类')
        self.category_feature('打包类型', '打包类型')
        self.category_feature('运输等级', '运输等级')
        self.category_feature('交易对象', '交易对象')
        self.category_feature('需求紧急程度', '需求紧急程度')
        self.category_feature('调价紧急程度', '调价紧急程度')
        self.category_feature('调价类型', '调价类型')
        self.category_feature('车辆类型', '车辆类型')
        self.category_feature('线路编码', '线路编码')
        self.category_feature('起止省份终止省份始发网点目的网点', '起止省份终止省份始发网点目的网点')

        self.data.reset_index(drop=True, inplace=True)

    def convert_json_to_target_format(self, pd_data, output_file):
        return

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



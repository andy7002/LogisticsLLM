# -*- coding: utf-8 -*-

random_state = 0


# MathorCup
feather_mc_full_lst = [
   '总里程', '业务类型', '需求类型1', '需求类型2', '线路编码',
   '是否续签', '始发网点', '目的网点', '交易成功时长', '成交对象', '车辆长度', '车辆吨位', '标的展示策略',
   '打包类型', '运输等级', '调价类型', '调价紧急程度',
   '始发地省份名称', '目的地省份名称', '车辆类型分类',
   '交易对象', '地区类型', '地区', '需求紧急程度', '计划靠车前可用分钟数', '计划发车前可用分钟数',
   '计划到达前行驶分钟数', '计划卸货分钟数', '交易运行分钟数', '实际靠车前可用分钟数', '实际发车前可用分钟数',
   '实际结束前分钟数', '调价审核分钟数'
]

feather_mc_onehot_full_lst = [
    '总里程', '业务类型', '需求类型1', '需求类型2', '是否续签', '标的展示策略', '地区类型', '省内省外',
    '计划靠车前可用分钟数', '计划发车前可用分钟数', '计划到达前行驶分钟数', '计划卸货分钟数', '交易运行分钟数', '实际靠车前可用分钟数',
    '实际发车前可用分钟数', '实际结束前分钟数', '调价审核分钟数', '始发地_北京市', '始发地_广东省', '始发地_河南省', '始发地_陕西省',
    '目的地_北京市', '目的地_广东省', '目的地_新疆维吾尔自治区', '目的地_河南省', '车辆类型分类_厢式运输车',
    '打包类型_人工', '打包类型_单边', '打包类型_周期往返', '打包类型_周期流向', '运输等级_一级运输', '运输等级_三级运输',
    '运输等级_二级运输', '交易对象_B', '交易对象_BC', '交易对象_C', '需求紧急程度_常规订单', '需求紧急程度_特急订单',
    '需求紧急程度_紧急订单', '调价紧急程度_常规', '调价紧急程度_紧急', '调价紧急程度_非常紧急', '调价类型_未调整', '调价类型_调低', '调价类型_调高',
    '车辆类型_15.0_30.0', '车辆类型_4.2_1.5', '车辆类型_5.2_3.0', '车辆类型_7.6_7.0', '车辆类型_9.6_14.0',
    '线路编码_1', '线路编码_2', '线路编码_3', '线路编码_4', '线路编码_5', '线路编码_6', '线路编码_7', '线路编码_8', '线路编码_9', '线路编码_10',
    '线路编码_11', '线路编码_12', '线路编码_13', '线路编码_14', '线路编码_15', '线路编码_16', '线路编码_17', '线路编码_18', '线路编码_19', '线路编码_20',
    '线路编码_21', '线路编码_23', '线路编码_24', '线路编码_25', '线路编码_26', '线路编码_27', '线路编码_28', '线路编码_29', '线路编码_31', '线路编码_32',
    '线路编码_33', '线路编码_34', '线路编码_35', '线路编码_36', '线路编码_37', '线路编码_38', '线路编码_39', '线路编码_40', '线路编码_41', '线路编码_42',
    '线路编码_43', '线路编码_44', '线路编码_45', '线路编码_46', '线路编码_47', '线路编码_51', '线路编码_52', '线路编码_53', '线路编码_54', '线路编码_55',
    '线路编码_56', '线路编码_57', '线路编码_58', '线路编码_59', '线路编码_61', '线路编码_62', '线路编码_63', '线路编码_65', '线路编码_66', '线路编码_67',
    '线路编码_68', '线路编码_69', '线路编码_71', '线路编码_72', '线路编码_73', '线路编码_74', '线路编码_75', '线路编码_77', '线路编码_78', '线路编码_79',
    '线路编码_80', '线路编码_81', '线路编码_83', '线路编码_85', '线路编码_86', '线路编码_87', '线路编码_88', '线路编码_89', '线路编码_90', '线路编码_91',
    '线路编码_92', '线路编码_93', '线路编码_94', '线路编码_95', '线路编码_96',
    '起止省份终止省份始发网点目的网点_北京市_北京市_4_1', '起止省份终止省份始发网点目的网点_北京市_北京市_4_2',    '起止省份终止省份始发网点目的网点_北京市_北京市_4_3',
    '起止省份终止省份始发网点目的网点_广东省_广东省_18_17', '起止省份终止省份始发网点目的网点_广东省_广东省_19_10',  '起止省份终止省份始发网点目的网点_广东省_广东省_5_7',
    '起止省份终止省份始发网点目的网点_广东省_广东省_5_8', '起止省份终止省份始发网点目的网点_广东省_广东省_5_9', '起止省份终止省份始发网点目的网点_广东省_广东省_6_10',
    '起止省份终止省份始发网点目的网点_广东省_广东省_6_8', '起止省份终止省份始发网点目的网点_广东省_广东省_6_9', '起止省份终止省份始发网点目的网点_河南省_河南省_14_16',
    '起止省份终止省份始发网点目的网点_河南省_河南省_15_16', '起止省份终止省份始发网点目的网点_陕西省_新疆维吾尔自治区_11_20',
    '起止省份终止省份始发网点目的网点_陕西省_新疆维吾尔自治区_11_21', '起止省份终止省份始发网点目的网点_陕西省_新疆维吾尔自治区_12_20',
    '地区_1', '地区_2', '地区_3', '地区_4', '地区_5'
]

feather_mc_full_en_lst = [
    'Total Mileage',
    'Business Type', 'Demand Type 1', 'Demand Type 2',
    'Route Code',
    'Whether to Renew',
    'Origin Branch', 'Destination Branch', 'Transaction Success Duration', 'Transaction Counterparty',
    'Vehicle Length', 'Vehicle Tonnage', 'Target Display Strategy',
    'Packaging Type', 'Transport Grade',
    'Price Adjustment Type', 'Urgency of Price Adjustment',
    'Name of Origin Province', 'Name of Destination Province', 'Vehicle Type Classification',
    'Trading Entity', 'Area Type', 'Area', 'Urgency of Demand',
    'Minutes Available Before Planned Arrival',
    'Minutes Available Before Planned Departure', 'Driving Minutes Before Planned Arrival', 'Planned Unloading Minutes',
    'Transaction Operation Minutes', 'Actual Minutes Available Before Arrival',
    'Actual Minutes Available Before Departure', 'Actual Minutes Before Conclusion', 'Minutes for Price Adjustment Review'
]

order_feather_mc_lst = [
   '总里程', '计划到达前行驶分钟数', '计划卸货分钟数'
]

order_feather_mc_en_lst = [
   'Total Mileage', 'Driving Minutes Before Planned Arrival', 'Planned Unloading Minutes'
]

mc_translation_dict = {
    "速运": "FastTransportation",
    "重货": "HeavyCargo",
    "普通": "Ordinary",
    "区域发运": "RegionalShipping",
    "计划": "Plan",
    "临时": "Temporary",
    "非续签": "No",
    "已分拨续签": "Yes",
    "单边": "unilateral",
    "人工": "artificial",
    "周期流向": "CycleFlow",
    "周期往返": "CycleRoundTrip",
    "一级运输": "First-class",
    "二级运输": "Secondary",
    "三级运输": "Tertiary",
    "调高": "Adjust",
    "调低": "Lower",
    "未调整": "Unadjusted",
    "常规": "Conventional",
    "紧急": "Urgent",
    "非常紧急": "VeryUrgent",
    "北京市": "beijing",
    "广东省": "guangdong",
    "河南省": "henan",
    "陕西省": "shaanxi",
    "新疆维吾尔自治区": "xinjiang",
    "分拨区": "DistributionArea",
    "业务区": "ServiceArea",
    "常规订单": "Regular",
    "紧急订单": "Rush",
    "特急订单": "Urgent",
    "厢式运输车": "Van"
}

mc_key = ['线路指导价（不含税）']


# HackerEarth
feather_he_full_lst = [
   'Artist Reputation', 'Height', 'Width', 'Weight',
   'Price Of Sculpture', 'Base Shipping Price', 'Area', 'Combined_Price', 'Duration',
   'International', 'Express Shipment', 'Installation Included', 'Fragile',
   'Material',
   'Transport',
   'Month',
   'Year',
   'Week',
   'Customer Information',
   'Customer Location'
]

feather_he_onehot_full_lst = [
    'Artist Reputation', 'Height', 'Width', 'Weight',
    'Price Of Sculpture', 'Base Shipping Price', 'Area', 'Combined_Price', 'Duration',
    'International', 'Express Shipment', 'Installation Included',
    'Material_Brass', 'Material_Clay', 'Material_Aluminium', 'Material_Wood',
    'Material_Marble', 'Material_Bronze', 'Material_Stone',
    'Transport_Airways', 'Transport_Roadways', 'Transport_Waterways', 'Fragile',
    'Month_6', 'Month_3',
    'Month_5', 'Month_12', 'Month_8', 'Month_7', 'Month_10',
    'Month_9', 'Month_4', 'Month_2', 'Month_11', 'Month_1',
    'Year_2015', 'Year_2017', 'Year_2016', 'Year_2019',
    'Year_2018', 'Week_2', 'Week_6', 'Week_3', 'Week_4',
    'Week_0', 'Week_1', 'Week_5',
    'Customer Information', 'Customer Location_OH', 'Customer Location_WY',
    'Customer Location_WA', 'Customer Location_KY', 'Customer Location_PA',
    'Customer Location_AL', 'Customer Location_WV', 'Customer Location_CA',
    'Customer Location_ND', 'Customer Location_GA', 'Customer Location_DC',
    'Customer Location_TX', 'Customer Location_CO', 'Customer Location_AE',
    'Customer Location_OR', 'Customer Location_MI', 'Customer Location_NM',
    'Customer Location_AR', 'Customer Location_AP', 'Customer Location_VT',
    'Customer Location_IA', 'Customer Location_MN', 'Customer Location_NH',
    'Customer Location_SC', 'Customer Location_AA', 'Customer Location_OK',
    'Customer Location_HI', 'Customer Location_RI', 'Customer Location_LA',
    'Customer Location_DE', 'Customer Location_ID', 'Customer Location_CT',
    'Customer Location_MS', 'Customer Location_FL', 'Customer Location_VA',
    'Customer Location_MA', 'Customer Location_KS', 'Customer Location_ME',
    'Customer Location_NC', 'Customer Location_NV', 'Customer Location_MD',
    'Customer Location_SD', 'Customer Location_WI', 'Customer Location_MT',
    'Customer Location_IL', 'Customer Location_AZ', 'Customer Location_AK',
    'Customer Location_NY', 'Customer Location_NJ', 'Customer Location_TN',
    'Customer Location_NE', 'Customer Location_MO', 'Customer Location_IN',
    'Customer Location_UT'
]


feather_he_onehot_few4_lst = [
    'Artist Reputation', 'Height', 'Width', 'Weight',
    'Price Of Sculpture', 'Base Shipping Price', 'Area', 'Combined_Price', 'Duration',
    'International', 'Express Shipment', 'Installation Included',
    'Material_Brass', 'Material_Clay', 'Material_Aluminium', 'Material_Wood',
    'Material_Marble', 'Material_Bronze', 'Material_Stone',
    'Transport_Airways', 'Transport_Roadways', 'Transport_Waterways', 'Fragile',
    'Month_6', 'Month_3',
    'Month_5', 'Month_12', 'Month_8', 'Month_7', 'Month_10',
    'Month_9', 'Month_4', 'Month_2', 'Month_11', 'Month_1',
    'Year_2015', 'Year_2017', 'Year_2016', 'Year_2019',
    'Year_2018', 'Week_2', 'Week_6', 'Week_3', 'Week_4',
    'Week_0', 'Week_1', 'Week_5',
    'Customer Information', 'Customer Location_OH', 'Customer Location_WY',
    'Customer Location_WA', 'Customer Location_KY', 'Customer Location_PA',
    'Customer Location_AL', 'Customer Location_WV', 'Customer Location_CA',
    'Customer Location_ND', 'Customer Location_GA', 'Customer Location_DC',
    'Customer Location_TX', 'Customer Location_CO', 'Customer Location_AE',
    'Customer Location_OR', 'Customer Location_MI', 'Customer Location_NM',
    'Customer Location_AR', 'Customer Location_AP',
    'Customer Location_IA', 'Customer Location_MN', 'Customer Location_NH',
    'Customer Location_SC', 'Customer Location_AA', 'Customer Location_OK',
    'Customer Location_HI', 'Customer Location_RI', 'Customer Location_LA',
    'Customer Location_DE', 'Customer Location_ID', 'Customer Location_CT',
    'Customer Location_MS', 'Customer Location_FL', 'Customer Location_VA',
    'Customer Location_MA', 'Customer Location_KS', 'Customer Location_ME',
    'Customer Location_NC', 'Customer Location_NV', 'Customer Location_MD',
    'Customer Location_SD', 'Customer Location_WI', 'Customer Location_MT',
    'Customer Location_IL', 'Customer Location_AZ', 'Customer Location_AK',
    'Customer Location_NY', 'Customer Location_NJ', 'Customer Location_TN',
    'Customer Location_MO', 'Customer Location_IN',
    'Customer Location_UT'
]

feather_he_onehot_few2_lst = [
    'Artist Reputation', 'Height', 'Width', 'Weight',
    'Price Of Sculpture', 'Base Shipping Price', 'Area', 'Combined_Price', 'Duration',
    'International', 'Express Shipment', 'Installation Included',
    'Material_Brass', 'Material_Clay', 'Material_Aluminium', 'Material_Wood',
    'Material_Marble', 'Material_Bronze', 'Material_Stone',
    'Transport_Airways', 'Transport_Roadways', 'Transport_Waterways', 'Fragile',
    'Month_6', 'Month_3',
    'Month_5', 'Month_12', 'Month_8', 'Month_7', 'Month_10',
    'Month_9', 'Month_4', 'Month_2', 'Month_11', 'Month_1',
    'Year_2015', 'Year_2017', 'Year_2016', 'Year_2019',
    'Year_2018', 'Week_2', 'Week_6', 'Week_3', 'Week_4',
    'Week_0', 'Week_1', 'Week_5',
    'Customer Information', 'Customer Location_WY',
    'Customer Location_KY', 'Customer Location_PA',
    'Customer Location_AL', 'Customer Location_WV', 'Customer Location_CA',
    'Customer Location_ND', 'Customer Location_GA',
    'Customer Location_CO', 'Customer Location_AE',
    'Customer Location_MI', 'Customer Location_NM',
    'Customer Location_AR', 'Customer Location_AP',
    'Customer Location_IA', 'Customer Location_MN', 'Customer Location_NH',
    'Customer Location_AA', 'Customer Location_OK',
    'Customer Location_HI', 'Customer Location_RI', 'Customer Location_LA',
    'Customer Location_DE', 'Customer Location_ID', 'Customer Location_CT',
    'Customer Location_MS', 'Customer Location_FL',
    'Customer Location_MA', 'Customer Location_KS', 'Customer Location_ME',
    'Customer Location_NC', 'Customer Location_MD',
    'Customer Location_SD', 'Customer Location_MT',
    'Customer Location_IL', 'Customer Location_AZ', 'Customer Location_AK',
    'Customer Location_NY', 'Customer Location_NJ', 'Customer Location_TN',
    'Customer Location_MO', 'Customer Location_IN',
    'Customer Location_UT'
]

feather_he_onehot_few1_lst = [
    'Artist Reputation', 'Height', 'Width', 'Weight',
    'Price Of Sculpture', 'Base Shipping Price', 'Area', 'Combined_Price', 'Duration',
    'International', 'Express Shipment', 'Installation Included',
    'Material_Brass', 'Material_Clay', 'Material_Aluminium', 'Material_Wood',
    'Material_Marble', 'Material_Bronze', 'Material_Stone',
    'Transport_Airways', 'Transport_Roadways', 'Transport_Waterways', 'Fragile',
    'Month_6', 'Month_3',
    'Month_5', 'Month_12', 'Month_8', 'Month_7', 'Month_10',
    'Month_9', 'Month_4', 'Month_2', 'Month_11', 'Month_1',
    'Year_2015', 'Year_2017', 'Year_2016', 'Year_2019',
    'Year_2018', 'Week_2', 'Week_6', 'Week_3', 'Week_4',
    'Week_0', 'Week_1', 'Week_5',
    'Customer Information', 'Customer Location_WY',
    'Customer Location_KY', 'Customer Location_PA',
    'Customer Location_AL', 'Customer Location_CA',
    'Customer Location_ND',
    'Customer Location_CO', 'Customer Location_AE',
    'Customer Location_MI',
    'Customer Location_AP',
    'Customer Location_IA', 'Customer Location_NH',
    'Customer Location_AA',
    'Customer Location_HI', 'Customer Location_LA',
    'Customer Location_CT',
    'Customer Location_MS', 'Customer Location_FL',
    'Customer Location_MA', 'Customer Location_KS', 'Customer Location_ME',
    'Customer Location_NC', 'Customer Location_MD',
    'Customer Location_SD', 'Customer Location_MT',
    'Customer Location_AZ', 'Customer Location_AK',
    'Customer Location_NJ', 'Customer Location_TN',
    'Customer Location_MO', 'Customer Location_IN',
    'Customer Location_UT'
]

order_feather_he_lst = [
   'Artist Reputation', 'Weight', 'Price Of Sculpture'
]

order_feather_he_en_lst = [
   'Artist Reputation', 'Weight', 'Price Of Sculpture'
]

feather_he_full_en_lst = feather_he_full_lst

he_translation_dict = {}

he_key = ['Cost']


# Cross Entropy Config
datasets_types = ['MC', 'MCOneHot', 'HE', 'HEOneHot']  # 'MC', 'MCOneHot', 'HE', 'HEOneHot'
order_strategys = ['InitOrd', 'SeqeOrd', 'DistOrd']
input_sequences = ['NamedFeatSeq', 'ValueOnlySeq', 'ListTempSeq', 'JsonSeq']
cot_types = ['0']


order_strategy_settings = {
    'MCOneHot': ['InitOrd'],
    'default': ['InitOrd', 'SeqeOrd', 'DistOrd']
}

dataset_split_settings = {
    'default': ['82']
}

model_split_settings = {
    'default': ['82']
}

cot_settings = {
    'default': ['0']
}

split_ratio_lst = {
    '82': 0.2,
    '64': 0.4,
    '46': 0.6,
    '37': 0.7
}

dataset_scale_settings = {
    ('MC', 'InitOrd', 'NamedFeatSeq', '82', '0'): ['100', '10', '1', '0.5', '0.25'],
    ('HE', 'InitOrd', 'NamedFeatSeq', '82', '0'): ['100', '40', '4', '2', '1'],
    ('MCOneHot', 'InitOrd', 'NamedFeatSeq', '82', '0'): ['100', '10', '1', '0.5', '0.25'],
    ('HEOneHot', 'InitOrd', 'NamedFeatSeq', '82', '0'): ['100', '40', '4', '2', '1'],
    'default': ['100']
}

# Model names list
models = [
    "GLM4-9b-chat",
    "Qwen2.5-7B-Instruct",
    "llama-3-8b-instruct"
]

# Define epochs for each dataset type and model combination
# dataset, scale, split, cot, model
epoch_settings = {
    ('MC', '10', '82', '0', 'GLM4-9b-chat'): 8,
    ('MC', '10', '82', '0', 'Qwen2.5-7B-Instruct'): 20,
    ('MC', '10', '82', '0', 'llama-3-8b-instruct'): 15,

    ('MC', '1', '82', '0', 'GLM4-9b-chat'): 15,
    ('MC', '1', '82', '0', 'Qwen2.5-7B-Instruct'): -1,
    ('MC', '1', '82', '0', 'llama-3-8b-instruct'): -1,

    ('MC', '0.5', '82', '0', 'GLM4-9b-chat'): 15,
    ('MC', '0.5', '82', '0', 'Qwen2.5-7B-Instruct'): -1,
    ('MC', '0.5', '82', '0', 'llama-3-8b-instruct'): -1,

    ('MC', '0.25', '82', '0', 'GLM4-9b-chat'): 14,
    ('MC', '0.25', '82', '0', 'Qwen2.5-7B-Instruct'): -1,
    ('MC', '0.25', '82', '0', 'llama-3-8b-instruct'): -1,

    ('MC', '100', '82', '0', 'Qwen2-7B-Instruct'): 5,

    ('MC', '100', '82', '0', 'Qwen2.5-7B-Instruct'): 5,

    ('MC', '100', '82', '1', 'GLM4-9b-chat'): 3,
    ('MC', '100', '82', '1', 'Qwen2.5-7B-Instruct'): 3,
    ('MC', '100', '82', '1', 'llama-3-8b-instruct'): 3,

    ('HE', '100', '82', '1', 'GLM4-9b-chat'): 13,
    ('HE', '100', '82', '1', 'Qwen2.5-7B-Instruct'): 20,
    ('HE', '100', '82', '1', 'llama-3-8b-instruct'): 20,

    ('HE', '100', '82', '0', 'GLM4-9b-chat'): 15,

    ('HE', '40', '82', '0', 'GLM4-9b-chat'): 20,
    ('HE', '40', '82', '0', 'Qwen2.5-7B-Instruct'): 15,
    ('HE', '40', '82', '0', 'llama-3-8b-instruct'): 15,

    ('HE', '4', '82', '0', 'GLM4-9b-chat'): 14,
    ('HE', '4', '82', '0', 'Qwen2.5-7B-Instruct'): -1,
    ('HE', '4', '82', '0', 'llama-3-8b-instruct'): -1,

    ('HE', '2', '82', '0', 'GLM4-9b-chat'): 17,
    ('HE', '2', '82', '0', 'Qwen2.5-7B-Instruct'): -1,
    ('HE', '2', '82', '0', 'llama-3-8b-instruct'): -1,

    ('HE', '1', '82', '0', 'GLM4-9b-chat'): 16,
    ('HE', '1', '82', '0', 'Qwen2.5-7B-Instruct'): -1,
    ('HE', '1', '82', '0', 'llama-3-8b-instruct'): -1,

    ('HE', '100', '82', '0', 'Qwen2-7B-Instruct'): 15,

    ('HE', '100', '82', '0', 'Qwen2.5-7B-Instruct'): 15,

    ('HE', '100', '82', '0', 'llama-3-8b-instruct'): 15,

    # Add other combinations as needed
    # Default setting if combination not specified:
    'default': 5
}

fine_tuning_templates = {
    "GLM4-9b-chat": 'glm4',
    "Qwen2.5-7B-Instruct": 'qwen',
    "llama-3-8b-instruct": 'llama3'
}

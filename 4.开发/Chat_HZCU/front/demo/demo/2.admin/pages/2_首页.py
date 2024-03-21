# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/26 0:16

"""
from datetime import datetime, timedelta

import streamlit as st
import requests
import json
from streamlit_echarts import st_echarts
import numpy as np
import pandas as pd
from openai import OpenAI
import streamlit.components.v1 as components

# ip = "localhost"
ip = "106.12.19.123"
port = "8080"
proxies = {"http": None, "https": None}


# 浏览器标设置
st.set_page_config(
    page_title="管理员-首页",
    page_icon="👋",
    layout='wide',
    initial_sidebar_state="auto"
)

########################################################################################################################
# API封装
# 获取我想榜/吐槽榜Top记录
# @st.cache_resource
def api_find_Top(type, page_number, page_size):
    """
    :return: 我想榜/突出操记录/None
    """
    #  获取数据
    url_type = "wishes" if type == "wish" else "roasts"
    url = f"http://{ip}:{port}/users/chats/{url_type}?pageNumber={page_number}&pageSize={page_size}"
    response = requests.get(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("获取Top榜成功")
        return json_data["data"]
    else:
        print("获取Top榜失败")
        return None

# 查询最近7天对话人数
@st.cache_resource
def api_find_7days_people():
    """
    :return: 日期-人数/None
    """
    url = f"http://{ip}:{port}/admins/first-pages/users/7-day"
    response = requests.get(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("查询最近7天对话人数成功")
        return json_data['data']
    else:
        print("查询最近7天对话人数失败")
        return False

# 查询最近7天对话人数
@st.cache_resource
def api_find_7days_chat():
    """
    :return: 日期-人数/None
    """
    url = f"http://{ip}:{port}/admins/first-pages/chats/7-day"
    response = requests.get(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("查询最近7天对话次数成功")
        return json_data['data']
    else:
        print("查询最近7天对话次数失败")
        return False

# 填补一周内日期缺失   2024-03-11 2024-03-14    2024-03-11 2024-03-12 2024-03-13 2024-03-14
@st.cache_resource
def fill_missing(type, data):
    """
    :param data:
    :return: 登录次数列表，起始日期列表
    """
    df = pd.DataFrame(data)
    # 将login_date列转换为datetime类型，并设置为索引
    date = type+"_"+"date"
    count = type+"_"+"count"
    df[date] = pd.to_datetime(df[date])
    df.set_index(date, inplace=True)
    # 将DataFrame转换为每日频率的时间序列数据，缺失值用0填充
    df_resampled = df.resample('D').asfreq().fillna(0)
    # 如果需要显示login_count列（默认情况下，fillna后可能会新增一列）
    df_resampled[count] = df_resampled[count].fillna(0)
    return df_resampled[count].values, df_resampled.index


# 气球，雪花
st.balloons()
st.snow()

# 2. 主界面
# 2.1 上侧
col1, col2, col3 = st.columns(3)
# # 2.1.1 管理员信息
col11, col12 = col1.columns(2)
col11.image('data/avatar.png')
col12.subheader(st.session_state['admin']['nickname'])
col12.write('管理员')
col1.markdown('---')
col1.markdown('初始注册时间：' + str(st.session_state['admin']['registerTime']))
col1.markdown('本次登录时间：' + str(st.session_state['admin']['lastLoginTime']))
col1.markdown('---')
# 2.1.2 吐槽榜
with col2.container():
    col21, col22 = col2.columns([1,7])
    # 展示吐槽榜
    with col21:
        st.subheader("吐")
        st.subheader("槽")
        st.subheader("榜")
    # 展示图表
    with col22:
        # 获取吐槽榜数据
        type = "roast"
        page_number = 1
        page_size = 5
        roast_dict_list = api_find_Top(type, page_number, page_size)

        # 获取applauseNumber和content
        data = []
        for i in roast_dict_list:
            roast_dict = {"value": i["applauseNumber"]}
            roast_dict['name'] = i["content"]
            data.append(roast_dict)

        option = {
            "legend": {"top": "bottom"},
            "series": [
                {
                    "name": "面积模式",
                    "type": "pie",
                    "radius": [50, 100],
                    "center": ["50%", "30%"],
                    "roseType": "area",
                    "itemStyle": {"borderRadius": 8},
                    "data": data,
                }
            ],
        }
        st_echarts(
            options=option, height="330px",
        )

# 2.1.3 我想...
with col3.container():
    col31, col32 = st.columns([1,7])
    # 展示我想...
    with col31:
        st.subheader("我")
        st.subheader("想")
        st.subheader("...")
    # 展示图表
    with col32:
        # 获取我想榜数据
        type = "wish"
        page_number = 1
        page_size = 5
        wish_dict_list = api_find_Top(type, page_number, page_size)

        # 获取applauseNumber和content
        data = []
        for i in wish_dict_list:
            wish_dict = {"value": i["applauseNumber"]}
            wish_dict['name'] = i["content"]
            data.append(wish_dict)

        option = {
            "legend": {"top": "bottom"},
            "series": [
                {
                    "name": "面积模式",
                    "type": "pie",
                    "radius": [50, 100],
                    "center": ["50%", "30%"],
                    "roseType": "area",
                    "itemStyle": {"borderRadius": 8},
                    "data": data,
                }
            ],
        }
        st_echarts(
            options=option, height="330px",
        )
# 上下侧分界
# st.write('')
st.markdown('---')
# st.write('')

# 2.2 下侧
col_down_1, col_down_2 = st.columns([1, 2])
# 2.2.1 左侧：活跃问题
col_down_11, col_down_12 = col_down_1.columns([1, 9])
# 2.2.1.1 显示"活跃问题"
col_down_11.write('')
col_down_11.write('')
col_down_11.subheader('活')
col_down_11.subheader('跃')
col_down_11.subheader('问')
col_down_11.subheader('题')
# 2.2.1.2 显示活跃问题列表
data = [
    ['1', '期中考试是什么开始呢？', '950'],
    ['2', '本科毕业生什么时候开始离校？', '875'],
    ['3', '本科毕业论文（设计）答辩？', '743'],
    ['4', '文三在哪里呢？', '612'],
    ['5', '能不能进行课程推荐？', '489'],
    ['6', '可以推荐周边几家好吃的餐厅吗？', '356'],
    ['7', '可以推荐周边几个好玩的景点吗？', '223'],
    ['8', '生病了，可以推荐附近的医院吗？', '199'],
    ['9', '学校有哪些实验室呢？', '176'],
    ['10', '暑假留宿申请流程是怎么样的呢？', '142'],
]
columns = ['序号', '活跃问题', '活跃指数']
df = pd.DataFrame(data, columns=columns)
edited_df = col_down_12.data_editor(
    df,
    hide_index=True
)
# 2.2.2 右侧：图表及对话框
with col_down_2:
    col_down_21, col_down_22 = st.columns([1,10])
    with col_down_21:
        st.write('')
        st.write('')
        st.subheader("对")
        st.subheader("话")
        st.subheader("人")
        st.subheader("数")
    # 2.2.2.1 上侧：折线图
    with col_down_22:
        # 生成日期列表
        dates = [datetime.now() - timedelta(days=7-i) for i in range(7)]
        # 向日期列表中添加日期
        recent_7days = []
        for date in dates:
            recent_7days.append(str(date.strftime('%Y-%m-%d')))

        # 获取最近7天人数，最近7天对话次数
        day7_people = api_find_7days_people()
        day7_chat = api_find_7days_chat()
        graph_data = []
        for i in recent_7days:
            graph_unit = []
            if day7_people:
                for j in day7_people:
                    if i == str(j["login_date"]):
                        graph_unit.append(j["login_count"])
            if len(graph_unit) == 0:
                graph_unit.append(0)
            if day7_chat:
                for k in day7_chat:
                    if i == str(k["chat_date"]):
                        graph_unit.append(k["chat_count"])
            if len(graph_unit) == 1:
                graph_unit.append(0)

            graph_data.append(graph_unit)


        st.write('')
        st.write('')

        columns = ["本周对话人数", "本周对话次数"]
        chart_data = pd.DataFrame(graph_data, columns=columns, index=recent_7days)
        st.line_chart(chart_data)
        st.write('')







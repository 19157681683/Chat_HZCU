# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/26 0:16

"""
import streamlit as st
from streamlit_echarts import st_echarts
import numpy as np
import pandas as pd
from openai import OpenAI
import streamlit.components.v1 as components

# openapi_api_key 配置
openai_api_key = "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"

# 浏览器标设置
st.set_page_config(
    page_title="管理员-首页",
    page_icon="👋",
    layout='wide',
    initial_sidebar_state="auto"
)
# 气球，雪花
st.balloons()
st.snow()

# 2. 主界面
# 2.1 上侧
col1, col2, col3 = st.columns(3)
# # 2.1.1 管理员信息
col11, col12 = col1.columns(2)
col11.image('data/avatar.png')
col12.subheader('李林名')
col12.write('管理员')
col1.markdown('---')
col1.markdown('上次登录时间：2019-10-20')
col1.markdown('本次登录时间：2024-02-19')
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
        data = [
            {"value": 666, "name": "课程推荐错了吧?"},
            {"value": 576, "name": "学分评估错了吧？"},
            {"value": 123, "name": "胖叔叔这好店不推荐吗？"},
            {"value": 111, "name": "做的什么垃圾，没有用？"},
            {"value": 99, "name": "可以查看课程的评价吗？"}
        ]
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
        data = [
            {"value": 666, "name": "我想添加学校校历数据?"},
            {"value": 576, "name": "我想添加学校地图"},
            {"value": 123, "name": "添加电动车申请流程"},
            {"value": 112, "name": "我想添加报销流程"},
            {"value": 99, "name": "我想添加教师激励政策"}
        ]
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
col_down_1, col_down_2 = st.columns([1,2])
# 2.2.1 左侧：活跃问题
col_down_11, col_down_12 = col_down_1.columns([1,9])
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
        st.write('')
        st.write('')
        data = [
                [123, 4567],
                [234, 8900],
                [345, 1234],
                [456, 5678],
                [567, 9012],
                [678, 3456],
                [789, 7890]]
        columns = ["本周对话人数", "本周对话次数"]
        index = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
        chart_data = pd.DataFrame(data, columns=columns, index=index)
        st.line_chart(chart_data)
        st.write('')







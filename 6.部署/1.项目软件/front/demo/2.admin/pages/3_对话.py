# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/29 20:53

"""
import streamlit as st
from streamlit_echarts import st_echarts
import numpy as np
import pandas as pd
import time
from streamlit_lottie import st_lottie
import json
from zhipuai import ZhipuAI

# 智谱AI的API Key
zhipuai_api_key = "7545d65cf0e9b47f341f9cfa83d51f2c.msYqbjw8gUHbVf4R"

# 浏览器标设置
st.set_page_config(
    page_title="管理员-对话",
    page_icon="👋",
    layout='wide',
    initial_sidebar_state="auto"
)

# 设置输入框为底部
with open("front/dialog.css") as source_des:
    st.markdown(f"<style>{source_des.read()} </style>", unsafe_allow_html=True)

def show_day_dialog_by_pie():
    title = "这是本周每日对话次数的饼图"
    # 一周的每一天
    days = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]

    # 创建一个空列表来存储字典
    weekly_dict_list = []

    # 为每一天创建一个字典，并添加到列表中
    for day in days:
        # 生成随机整数
        value = np.random.randint(10000, 50000)
        # 创建字典并添加到列表中
        daily_dict = {"name": day}
        daily_dict["value"] = value
        weekly_dict_list.append(daily_dict)

    options = {
        "title": {"text": title, "left": "center"},
        "tooltip": {"trigger": "item"},
        "legend": {"orient": "vertical", "left": "left", },
        "series": [
            {
                "name": "访问来源",
                "type": "pie",
                "radius": "50%",
                "data": weekly_dict_list,
                "emphasis": {
                    "itemStyle": {
                        "shadowBlur": 10,
                        "shadowOffsetX": 0,
                        "shadowColor": "rgba(0, 0, 0, 0.5)",
                    }
                },
            }
        ],
    }
    st_echarts(
        options=options, height="600px",
    )

def show_time_login_by_line():
    label = ["每小时登录人数", "每小时对话次数"]
    time = np.arange(0, 25, 1).tolist()
    login_number = np.random.randint(1000, 3000, size=25).tolist()
    dialog_number = np.random.randint(2000, 20000, size=25).tolist()
    options = {
        "title": {"text": "堆叠区域图"},
        "tooltip": {
            "trigger": "axis",
            "axisPointer": {"type": "cross", "label": {"backgroundColor": "#6a7985"}},
        },
        "legend": {"data": label},
        "toolbox": {"feature": {"saveAsImage": {}}},
        "grid": {"left": "3%", "right": "4%", "bottom": "3%", "containLabel": True},
        "xAxis": [
            {
                "type": "category",
                "boundaryGap": False,
                "data": time,
            }
        ],
        "yAxis": [{"type": "value"}],
        "series": [
            {
                "name": "每小时登录人数",
                "type": "line",
                "stack": "总量",
                "areaStyle": {},
                "emphasis": {"focus": "series"},
                "data": login_number,
            },
            {
                "name": "每小时对话次数",
                "type": "line",
                "stack": "总量",
                "areaStyle": {},
                "emphasis": {"focus": "series"},
                "data": dialog_number,
            },
        ],
    }
    st_echarts(options=options, height="400px")

# 1. 左侧：管理员信息和活跃问题
# 2. 右侧：对话框
col1, col_t, col2, col3 = st.columns([1.5, 0.1, 2.5, 0.4])

with col1:
    # 上侧：管理员信息
    col11, col12 = col1.columns(2)
    with col11:
        with open("data/animation-dialog.json") as source:
            animation = json.load(source)

        st_lottie(animation, height=200, width=200)
        st.write(":rainbow[您好，我是您的私人智能报表助理，小kimi]")


    with col12:
        st.write("")
        st.write("")
        # st.write("")
        genre = st.radio(
            "聊天记录",
            ["1.用户请求帮助", "2.统计报表"],
            index=0,
            label_visibility='collapsed'
        )

        # 更多聊天记录
        with st.expander("更多聊天记录"):
            genre = st.radio(
                "...",
                ["1.用户请求帮助", "2.统计报表", "3.Java基础"],
                index=int(genre.split('.')[0])-1,
                label_visibility='collapsed'
            )
    col1.markdown('---')

    # 下侧：活跃问题
    col_down_1, col_down_2 = st.columns([1, 9])
    # 2.2.1.1 显示"活跃问题"
    # st.subheader("活跃问题")
    with col_down_1:
        st.write('')
        st.write('')
        col_down_1.subheader('活')
        col_down_1.subheader('跃')
        col_down_1.subheader('问')
        col_down_1.subheader('题')
    # 2.2.1.2 显示活跃问题列表
    with col_down_2:
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
        edited_df = st.data_editor(
            df,
            hide_index=True
        )

# 2.2.2.3 下侧：对话框
with col2:
    # 默认为1
    index = 1

    if genre:
        index = genre.split('.')[0]

    if int(index) ==1:
        # 2.1 标题
        # st.header("💬 Chat城院")
        st.caption("🚀 您可以询问一些关于本系统的报表问题")

        if "messages" not in st.session_state:
            st.session_state["messages"] = [{"role": "assistant", "content": "你好！有什么问题我可以帮忙解决吗？"}]

        with st.container(height=700, border=False):

            # 2.2 向用户发送”你好！有什么问题我可以帮忙解决吗？“
            for msg in st.session_state.messages:
                st.chat_message(msg["role"]).write(msg["content"])

            # 2.3 提示词
            if prompt := st.chat_input("请输入您的问题"):
                # 将用户输入信息输出到对话框
                client = ZhipuAI(api_key=zhipuai_api_key)
                st.session_state.messages.append({"role": "user", "content": prompt})
                st.chat_message('user').write(prompt)

                # 将chatgpt的输出信息保留到messages，并输出到对话框
                response = client.chat.completions.create(model="glm-4", messages=st.session_state.messages)
                msg = response.choices[0].message.content
                st.session_state.messages.append({"role": "assistant", "content": msg})
                st.chat_message('assistant').write(msg)


    elif int(index) == 2:
        # 2.1 标题
        # st.header("💬 Chat城院")
        st.caption("🚀 您可以询问一些关于本系统的报表问题")

        if "messages_2024_03_02" not in st.session_state:
            st.session_state.messages_2024_03_02 = [
                {'role': 'assistant', 'content': '你好！有什么问题我可以帮忙解决吗？'},
                {'role': 'user', 'content': '请使用饼图表示本周每日对话次数'},
                {'role': 'assistant', 'content': '好的，下面是使用Echarts饼图表示本周对话次数'},
                {'role': 'user', 'content': '请使用堆叠区域图表示昨天每小时登录人数和每小时对话次数'},
                {'role': 'assistant',
                 'content': "好的，下面是使用Echarts堆叠区域图表示昨天每小时登录人数和每小时对话次数"}]

        with st.container(height=700, border=False):
            # 2.2 重新刷新整个输入的对话信息
            msg = st.session_state.messages_2024_03_02
            with st.chat_message("assistant"):
                st.write(msg[0]["content"])
            with st.chat_message("user"):
                st.write(msg[1]["content"])

            time.sleep(0.1)
            with st.chat_message("assistant"):
                st.write(msg[2]["content"])
                st.write("")
                show_day_dialog_by_pie()

            time.sleep(0.1)
            with st.chat_message("user"):
                st.write(msg[3]["content"])
            with st.chat_message("assistant"):
                st.write(msg[4]["content"])
                st.write("")
                show_time_login_by_line()

            if st.session_state.get("messages_2024_03_02_more"):
                for msg in st.session_state.messages_2024_03_02_more:
                    st.chat_message(msg["role"]).write(msg["content"])

            # 2.3 提示词：用户输入时，上面代码执行，之后执行下面代码
            if prompt := st.chat_input("请输入您的问题"):
                # 将用户输入信息输出到对话区
                client = ZhipuAI(api_key=zhipuai_api_key)
                # 创建新的对话messages_2024_03_03_more, 放入session_state中
                if 'messages_2024_03_02_more' not in st.session_state:
                    st.session_state.messages_2024_03_02_more = [{"role": "user", "content": prompt}]
                else:
                    st.session_state.messages_2024_03_02_more.append({"role": "user", "content": prompt})
                st.chat_message('user').write(prompt)

                # 将chatgpt的输出信息保留到messages，并输出到对话区
                response = client.chat.completions.create(model="glm-4",
                                                          messages=st.session_state.messages_2024_03_02_more)
                msg = response.choices[0].message.content
                st.session_state.messages_2024_03_02_more.append({"role": "assistant", "content": msg})
                st.chat_message('assistant').write(msg)

    else:
        # 2.1 标题
        # st.header("💬 Chat城院")
        st.caption("🚀 您可以询问一些关于本系统的报表问题")

        with st.container(height=700, border=False):

            if "messages_2024_02_29" not in st.session_state:
                st.session_state.messages_2024_02_29 = [
                    {'role': 'assistant', 'content': '你好！有什么问题我可以帮忙解决吗？'},
                    {'role': 'user', 'content': 'Java是一门什么样的语言呢？'},
                    {'role': 'assistant',
                     'content': 'Java是一种通用、面向对象、跨平台的编程语言。它由Sun Microsystems公域，包括Web应用程序开发、移动应用程序开发、企业级应用程序开发等。'
                                'Java的跨平台特性意味着编写的Java程序可以在不同的操作系统上运行，只需安装相 应的Java虚拟机即可。Java拥有强大的生态系统和广泛的应用领域，因此被广泛应用于软件开发领域。'}]

            # 2.2 重新刷新整个输入的对话信息
            for msg in st.session_state.messages_2024_02_29:
                st.chat_message(msg["role"]).write(msg["content"])

            # 2.3 提示词：用户输入时，上面代码执行，之后执行下面代码
            if prompt := st.chat_input("请输入您的问题"):
                # 将用户输入信息输出到对话区
                client = ZhipuAI(api_key=zhipuai_api_key)
                st.session_state.messages_2024_02_29.append({"role": "user", "content": prompt})
                st.chat_message('user').write(prompt)

                # 将chatgpt的输出信息保留到messages，并输出到对话区
                response = client.chat.completions.create(model="glm-4",
                                                          messages=st.session_state.messages_2024_02_29)
                msg = response.choices[0].message.content
                st.session_state.messages_2024_02_29.append({"role": "assistant", "content": msg})
                st.chat_message('assistant').write(msg)


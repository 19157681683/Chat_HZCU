import json
import time

import numpy as np
import pandas as pd
import requests
import streamlit as st
from streamlit_echarts import st_echarts
from streamlit_lottie import st_lottie
from zhipuai import ZhipuAI

# 引入util包下的chat_model_response 方法
from model import chat_model_response

# 配置ip和端口
# ip = "localhost"
ip = "106.12.19.123"
port = 8080
proxies = {"http": None, "https": None}


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



# 调用根据管理员Id获取管理员的聊天信息
# @st.cache_resource
def api_find_admin_chat(admin_id, page_number, page_size):
    #  获取数据
    url = f"http://{ip}:{port}/admins/chats/chats?adminId={admin_id}&pageNumber={page_number}&pageSize={page_size}"
    response = requests.get(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("获取管理员记录成功")
        return json_data["data"]
    else:
        print("获取管理员记录失败")
        return None

# 封装添加聊天记录API
# @st.cache_resource
def api_add_chat(admin_id, content):
    """
    :param admin_id: 管理员ID
    :param content: 添加的聊天记录内容
    :return: 添加是否成功
    """
    #  post请求
    url = f"http://{ip}:{port}/admins/chats/chat"
    data = {
        'adminId': admin_id,
        'content': content,
    }
    response = requests.post(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("添加管理员聊天记录成功")
        return True
    else:
        print("添加管理员聊天记录失败")
        return False

@st.cache_resource
def api_update_chat_message(admin_chat_id, content):
    """
    更新对话记录
    :param admin_chat_id: 聊天记录ID
    :param content: 聊天记录
    :return: 新增是否成功
    """
    url = f"http://{ip}:{port}/admins/chats/chat"
    data = {
        "adminChatId": admin_chat_id,
        "content": content,
    }
    response = requests.put(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("更新管理员聊天记录成功")
        return True
    else:
        print("更新管理员聊天记录失败")
        return False




########################################################################################################################
def display_chat_chart(chat_message):
    msg = chat_message
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




#  根据聊天索引位和是否有报表生成，确定显示哪个聊天记录【其中图表的需要特殊的代码执行过程】
def display_chat_message(json_data, index):
    """
    :param json_data:
    :param index:
    :return:
    """
    message_time = json_data[index]['time']
    message_content_dict_list = eval(json_data[index]['content'])

    # 如果未在session_state中创建，则创建
    session_msg = "messages_" + message_time
    if session_msg not in st.session_state:
        st.session_state[session_msg] = message_content_dict_list

    # 1.2 聊天信息使用streamlit显示对话
    with st.container(height=700, border=False):
        # 获取索引对应的用户第1条问句
        first_query = st.session_state['admin_query_list'][index]

        # 如果第1条问含”图“，则使用图表展示
        if "图" in first_query:
            display_chat_chart(st.session_state[session_msg])
        else:
            # 2.2 重新刷新整个输入的对话信息
            for msg in st.session_state[session_msg]:
                st.chat_message(msg["role"]).write(msg["content"])

        # 2.3 提示词：用户输入时，上面代码执行，之后执行下面代码
        if prompt := st.chat_input("请输入您的问题"):
            # 将用户输入信息输出到对话区
            st.session_state[session_msg].append({"role": "user", "content": prompt})
            st.chat_message('user').write(prompt)

            # 调用模型厂商的api，将prompt输入到模型API的请求中，得到回答内容
            # client = ZhipuAI(api_key=zhipuai_api_key)
            # response = client.chat.completions.create(model="glm-4", messages=st.session_state[session_msg])
            # msg = response.choices[0].message.content

            # 调用模型厂商的api，将prompt输入到模型API的请求中，得到回答内容
            msg = chat_model_response('zhipuai', zhipuai_api_key, "glm-4", st.session_state[session_msg])

            # 将模型的输出信息保留到messages，并输出到对话框
            st.session_state[session_msg].append({"role": "assistant", "content": msg})
            st.chat_message('assistant').write(msg)

            # 更新用户聊天记录: 更新时content为字符串，而不是字典列表
            api_update_chat_message(json_data[index]['adminChatId'], str(st.session_state[session_msg]))


########################################################################################################################
# 前端展示
# 1. 左侧：管理员信息和活跃问题
# 2. 右侧：对话框
col1, col_t, col2, col3 = st.columns([1.5, 0.1, 2.5, 0.4])

# 左侧：聊天记录+活跃问题
with col1:
    # 上侧：聊天记录
    col11, col12 = col1.columns(2)
    # 显示动图
    with col11:
        with open("data/animation-dialog.json") as source:
            animation = json.load(source)

        st_lottie(animation, height=200, width=200)
        st.write(":rainbow[您好，我是您的私人智能报表助理，小kimi]")
    # 显示聊天记录
    with col12:
        # 添加聊天记录
        add_chat_button = st.button('➕添加对话', key='add_chat')
        if add_chat_button:
            content = "[\r\n  {'role': 'assistant', 'content': '你好！有什么问题我可以帮助解答吗？'}]"
            # 插入一条聊天记录
            api_add_chat(st.session_state['admin']['adminId'], content)
            st.rerun()

        # 更多聊天记录
        with st.expander("👇聊天记录"):
            # 获取Top聊天记录
            admin_id = 30
            page_number = 1
            page_size = 10
            admin_chat_json = api_find_admin_chat(admin_id, page_number, page_size)

            # 放入st.session_state中，减少中间对话的调用
            st.session_state['admin_chat_json'] = admin_chat_json

            # 将管理员第一句请求列表，作为管理员聊天记录展示
            admin_query_list = []
            for i in range(len(admin_chat_json)):
                if len(eval(admin_chat_json[i]["content"])) <= 1:
                    admin_query_unit = str(i + 1) + ".管理员请求帮助"
                else:
                    admin_query_unit = str(i + 1) + '.' + eval(admin_chat_json[i]["content"])[1]['content']
                admin_query_list.append(admin_query_unit)
                if 'admin_query_list' not in st.session_state:
                    st.session_state['admin_query_list'] = admin_query_list

            # 显示更多的管理员聊天记录
            with st.container(height=200, border=True):
                genre = st.radio(
                    "...",
                    admin_query_list,
                    index=0,
                    label_visibility='collapsed'
                )

        col1.markdown('---')

    # 下侧：活跃问题
    col_down_1, col_down_2 = st.columns([1, 9])
    # 显示"活跃问题"
    with col_down_1:
        st.write('')
        st.write('')
        col_down_1.subheader('活')
        col_down_1.subheader('跃')
        col_down_1.subheader('问')
        col_down_1.subheader('题')
    # 显示活跃问题列表
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

# 右侧：对话框
with col2:
    # 默认为1
    index = int(genre.split('.')[0])-1 if genre else 0
    # 显示第index个聊天记录
    display_chat_message(st.session_state['admin_chat_json'], index)


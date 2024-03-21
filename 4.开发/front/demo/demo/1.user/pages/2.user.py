import json
import time

import requests
from openai import OpenAI
import streamlit as st
import pandas as pd
from zhipuai import ZhipuAI
import streamlit.components.v1 as components
import os

# 引入util包下的chat_model_response 方法
from model import chat_model_response

# 引入rag包下的rag_to_response方法
# from rag import rag_to_response
# from rag import save_file

# 配置ip和端口
# ip = "localhost"
ip = "106.12.19.123"
port = 8080
proxies = {"http": None, "https": None}

# os.environ['HTTPS_PROXY'] = 'http://127.0.0.1:7890'
# os.environ['HTTP_PROXY'] = 'http://127.0.0.1:7890'



# 智谱AI的API Key
zhipuai_api_key = "7545d65cf0e9b47f341f9cfa83d51f2c.msYqbjw8gUHbVf4R"

# OpenAI的API Key
openai_api_key = "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"

# 阿里巴巴的API Key
qwen_api_key = "sk-229f1bbff5c24b1d9e08c3b90a728bb9"

# 零一万物的API Key
wanwu_api_key = "e18a0fd6d1454f71839db94e42497146"

# 定义模型和供应商信息的映射
model_mappings = {
    "智谱AI": {
        "1.智谱AI-GLM3-Turbo": {"vendor": "zhipuai", "model": "GLM-3-Turbo", "api_key": zhipuai_api_key},
        "2.智谱AI-GLM4": {"vendor": "zhipuai", "model": "GLM-4", "api_key": zhipuai_api_key},
    },
    "OpenAI": {
        "3.OpenAI-GPT3.5": {"vendor": "openai", "model": "gpt-3.5-turbo-0125", "api_key": openai_api_key},
        "4.OpenAI-GPT4": {"vendor": "openai", "model": "gpt-4-0125-preview", "api_key": openai_api_key},
    },
    "阿里巴巴": {
        "5.阿里巴巴-Qwen-Turbo": {"vendor": "alibaba", "model": "qwen-turbo", "api_key": qwen_api_key},
        "6.阿里巴巴-Qwen-Max": {"vendor": "alibaba", "model": "qwen-max-longcontext", "api_key": qwen_api_key},
    },
    "百度": {
        "7.百度-ERNIE3.5": {"vendor": "baidu", "model": "ERNIE-3.5-8K-1222", "api_key": None},
        # "8.百度-ERNIE4.0": {"vendor": "baidu", "model": "ERNIE-4.0-8K", "api_key": None},
    },
    "零一万物": {
        "8.零一万物-Yi-34b": {"vendor": "01.wanwu", "model": "yi-34b-chat-200k", "api_key": wanwu_api_key},
    }

}



# 浏览器标设置
st.set_page_config(
    page_title="用户-对话",
    page_icon="👋",
    layout='wide',
    initial_sidebar_state="collapsed"
)

@st.cache_data
def cheer_up():
    st.snow()
    st.balloons()

# # # 显示气球和雪花
if 'log_in' not in st.session_state:
    cheer_up()
    st.session_state.log_in = 1


# 设置输入框为底部
with open("front/user_designer.css") as source_des:
    st.markdown(f"<style>{source_des.read()} </style>", unsafe_allow_html=True)


########################################################################################################################
# API封装

# 获取我想榜/吐槽榜Top记录
@st.cache_resource
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

#  用户添加我想记录或者吐槽记录
@st.cache_resource
def api_add_wish_roast(type, input_content):
    """
    :param type: wish/roast: 我想/吐槽
    :param input_content: 输入文本
    :return: True/False：是否添加成功
    """
    #  post请求
    url = f"http://{ip}:{port}/users/chats/{type}"
    data = {
        'userId': st.session_state['user_id'],
        'content': input_content,
    }
    response = requests.post(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("添加记录成功")
        return True
    else:
        print("添加记录失败")
        return False

#   更新我想榜/吐槽榜点赞
@st.cache_resource
def api_update_applause(type, type_id, applause_number):
    """
    :param wish_id: 我想记录的id
    :param applause_number: 我想记录的点赞数
    :return: True: 更改点赞成功; False: 更改点赞失败
    """
    url = f"http://{ip}:{port}/users/chats/{type}"
    request_type_id = "wishId" if type == "wish" else "roastId"
    data = {
        request_type_id: type_id,
        "time": None,
        "content": None,
        "applauseNumber": applause_number
    }
    response = requests.put(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("更新点赞成功")
        return True
    else:
        print("更新点赞失败")
        return False

# 调用根据用户Id获取用户的聊天信息
# @st.cache_resource
def api_find_user_chat(user_id, page_number, page_size):
    #  获取数据
    url = f"http://{ip}:{port}/users/chats/chats?userId={user_id}&pageNumber={page_number}&pageSize={page_size}"
    response = requests.get(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("获取用户记录成功")
        return json_data["data"]
    else:
        print("获取用户记录失败")
        return None

# 封装添加聊天记录API
# @st.cache_resource
def api_add_chat(user_id, content):
    """
    :param user_id: 用户ID
    :param content: 添加的聊天记录内容
    :return: 添加是否成功
    """
    #  post请求
    url = f"http://{ip}:{port}/users/chats/chat"
    data = {
        'userId': user_id,
        'content': content,
    }
    response = requests.post(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("添加用户聊天记录成功")
        return True
    else:
        print("添加用户聊天记录失败")
        return False

@st.cache_resource
def api_update_chat_message(user_chat_id, content):
    """
    更新对话记录
    :param user_chat_id: 聊天记录ID
    :param content: 聊天记录
    :return: 新增是否成功
    """
    url = f"http://{ip}:{port}/users/chats/chat"
    data = {
        "userChatId": user_chat_id,
        "content": content,
    }
    response = requests.put(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("更新用户聊天记录成功")
        return True
    else:
        print("更新用户聊天记录失败")
        return False


########################################################################################################################
#  根据聊天索引位，确定显示哪个聊天记录
def display_chat_message(type, json_data, index):
    message_time = json_data[index]['time']
    message_content_dict_list = eval(json_data[index]['content'])

    # 如果未在session_state中创建，则创建
    session_msg = "messages_" + message_time
    if session_msg not in st.session_state:
        st.session_state[session_msg] = message_content_dict_list

    # 1.2 聊天信息使用streamlit显示对话
    with st.container(height=700, border=False):
        # 2.2 重新刷新整个输入的对话信息
        for msg in st.session_state[session_msg]:
            st.chat_message(msg["role"]).write(msg["content"])

        # 2.3 提示词：用户输入时，上面代码执行，之后执行下面代码
        if prompt := st.chat_input("请输入您的问题"):
            # 将用户输入信息输出到对话区
            st.session_state[session_msg].append({"role": "user", "content": prompt})
            st.chat_message('user').write(prompt)

            # 如果上传文件，则根据文件来回答，否则根据模型回答
            if type == "rag":
                # # 文档问答，显示正在解析文档
                # with st.status("**正在解析文档..**", expanded=True) as status:
                #     msg = rag_to_response(prompt, upload_file_name)
                #     status.update(label="解析成功，答案如下!", state="complete", expanded=False)
                print("")
            else:
                # 调用模型厂商的api，将prompt输入到模型API的请求中，得到回答内容
                msg = chat_model_response(vendor, api_key, model, st.session_state[session_msg])

            # 将模型的输出信息保留到messages，并输出到对话框
            st.session_state[session_msg].append({"role": "assistant", "content": msg})
            st.chat_message('assistant').write(msg)

            # 更新用户聊天记录: 更新时content为字符串，而不是字典列表
            api_update_chat_message(json_data[index]['userChatId'], str(st.session_state[session_msg]))


col1, col2, col3, col4 = st.columns([1, 2, 0.3, 1.03])
# 1. 左侧栏
with col1:
    col11, col12 = st.columns([80, 20])
    with col11:
        st.header(":rainbow[Chat_HZCU]")
        st.markdown("---")

        # 添加聊天记录
        add_chat_button = st.button('➕添加对话', key='add_chat')
        if add_chat_button:
            content = "[\r\n  {'role': 'assistant', 'content': '你好！有什么问题我可以帮助解答吗？'}]"
            # 插入一条聊天记录
            api_add_chat(st.session_state['user_id'], content)

        # 更多聊天记录
        with st.expander("👇聊天记录"):
            # 获取Top聊天记录
            user_id = 1
            page_number = 1
            page_size = 10
            user_chat_json = api_find_user_chat(user_id, page_number, page_size)

            # 放入st.session_state中，减少中间对话的调用
            st.session_state['user_chat_json'] = user_chat_json

            # 将用户第一句请求列表，作为用户聊天记录展示
            user_query_list = []
            for i in range(len(user_chat_json)):
                if len(eval(user_chat_json[i]["content"])) <= 1:
                    user_query_unit = str(i+1) + ".用户请求帮助"
                else:
                    user_query_unit = str(i+1) + '.' + eval(user_chat_json[i]["content"])[1]['content']
                user_query_list.append(user_query_unit)

            # 显示更多的用户聊天记录
            with st.container(height=200, border=True):
                genre = st.radio(
                    "...",
                    user_query_list,
                    index=0,
                    label_visibility='collapsed'
                )

        # 选择模型
        with st.expander("🦜语言模型"):
            company_model = st.radio(
                "模型",
                ["1.智谱AI-GLM3-Turbo", "2.智谱AI-GLM4", "3.OpenAI-GPT3.5", "4.OpenAI-GPT4", "5.阿里巴巴-Qwen-Turbo", "6.阿里巴巴-Qwen-Max", "7.百度-ERNIE3.5", "8.零一万物-Yi-34b"],
                # ["1.智谱AI-GLM3-Turbo", "2.智谱AI-GLM4", "3.OpenAI-GPT3.5", "4.OpenAI-GPT4", "5.阿里巴巴-Qwen-Turbo", "6.阿里巴巴-Qwen-Max", "7.零一万物-Yi-34b"],
                index=0,
                label_visibility='collapsed'
            )

            # 根据用户选择获取供应商、模型和API密钥
            selected_model_info = model_mappings.get(company_model.split('.')[1].split('-')[0], {}).get(company_model)
            vendor = selected_model_info["vendor"] if selected_model_info else None
            model = selected_model_info["model"] if selected_model_info else None
            api_key = selected_model_info["api_key"] if selected_model_info else None


            # 发送成功选择模型的信息
            company = company_model.split('.')[1].split('-')[0]
            model_mid = company_model.split('-')[1]
            model_short = model_mid + '-' + company_model.split('.')[1].split('-')[2] if len(company_model.split('.')[1].split('-')) > 2 else model_mid
            success_msg = "正在使用" + company + "的" + model_short
            st.success(success_msg, icon="✅")

        # # 上传pdf文件，到data文件夹下
        # upload_file_name = save_file()

    # st.link_button("🔙:orange[退出登录]", "http://" + str("localhost") + ":8501")
    st.link_button("🔙:orange[退出登录]", "http://" + str(ip) + ":8501")



# 3. 右侧栏
with col4:
    # 点赞回调函数,+1：传入参数：index:对应的按钮序号; type:我想/吐槽
    def thumb_up(type, index, json_data):
        # 更新点赞数
        type_id = "wishId" if type == "wish" else "roastId"
        wish_id = json_data[index][type_id]
        api_update_applause(type, wish_id, json_data[index]["applauseNumber"] + 1)
        # 更新wish_json，用于展示
        json_data[index]["applauseNumber"] = json_data[index]["applauseNumber"] + 1


    # 差评回调函数，-1：传入参数：index:对应的按钮序号; type:我想/吐槽
    def thumb_down(type, index, json_data):
        # 更新点赞数
        type_id = "wishId" if type == "wish" else "roastId"
        wish_id = json_data[index][type_id]
        api_update_applause(type, wish_id, json_data[index]["applauseNumber"] - 1)
        # 更新wish_json，用于展示
        json_data[index]["applauseNumber"] = json_data[index]["applauseNumber"] - 1


    # 对每行进行封装： index: 表示第几行; wish_data：表示第一列添加的字符串; type:我想/吐槽【点赞数一致】; type_more:表示我想/吐槽更多【按钮关键字命名】
    def row_of_json_list(type, type_more, index, dict_data, json_data):
        # 第一行
        col1, col2, col3, col4, col5 = st.columns([5, 1.2, 1, 1, 1])
        button1_key = 'thumb_up_' + type_more + str(index)
        button2_key = 'thumb_down_' + type_more + str(index)

        with col4:
            button = st.button('👍', key=button1_key)
            if button:
                thumb_up(type, index, json_data)

        with col5:
            button = st.button('👎', key=button2_key)
            if button:
                thumb_down(type, index, json_data)

        with col1:
            st.text(str(index + 1) + '.' + dict_data["content"])

        # 点赞数
        with col2:
            st.text(str(dict_data["applauseNumber"]))

        with col3:
            st.text('...')


    # 直接封装列表：indexs：表示行数，wish_datas:表示对应第一列添加的我想字符串; type_more:表示我想/吐槽更多【按钮关键字命名】
    def json_list(type, type_more, indexs, json_data):
        length = len(json_data) if len(json_data) <= indexs else indexs
        for i in range(length):
            row_of_json_list(type, type_more, i, json_data[i], json_data)


    # 封装我想/吐槽榜前端展示
    def wish_roast_front_display(type, page_number, page_size):
        # 获取Top数据
        wish_json = api_find_Top(type, page_number, page_size)
        # 显示数据
        markdown_title = "我想" if type == "wish" else "吐槽"
        st.markdown("##### " + markdown_title + "...")
        with st.container(border=True, height=220):
            type_more = type + "_more"
            # 前端展示我想榜/吐槽榜数据
            json_list(type, type_more, page_size, wish_json)

        # 用户添加我想/吐槽的数据框
        place_holder = "请输入您想添加的数据😁" if type == "wish" else "请输入您想吐槽的内容😱"
        input_content = st.text_input("🥳", placeholder=place_holder, label_visibility='hidden')
        if len(input_content) != 0:
            is_add = api_add_wish_roast(type, input_content)
            spinner_msg_success = "成功添加我想信息" if type == "wish" else "成功添加吐槽信息"
            spinner_msg_failed = "添加我想信息失败" if type == "wish" else "添加吐槽信息失败"
            if is_add:
                with st.spinner(spinner_msg_success):
                    time.sleep(1)
            else:
                with st.spinner(spinner_msg_failed):
                    time.sleep(1)

    ####################################################################################################################
    # 展示我想榜
    type = "wish"
    page_number = 1
    page_size = 20
    wish_roast_front_display(type, page_number, page_size)
    # 间隔
    st.markdown('---')
    ####################################################################################################################
    # 显示吐槽榜
    type = "roast"
    page_number = 1
    page_size = 20
    wish_roast_front_display(type, page_number, page_size)
    ####################################################################################################################



# 2. 中间对话
with col2:

    # 获取Top聊天记录, 从左侧用户聊天记录时请求的Top聊天记录中获取
    user_chat_json = st.session_state['user_chat_json']

    # 默认为1
    index = int(genre.split('.')[0])-1 if genre else 0
    # chat_type = "rag" if upload_file_name else "chat"
    chat_type = "chat"

    st.caption("🚀 基于大语言模型的智能校务系统")
    display_chat_message(chat_type, user_chat_json, index)






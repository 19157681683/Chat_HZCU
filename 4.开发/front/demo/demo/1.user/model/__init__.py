# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/13 10:56

"""
import dashscope
from openai import OpenAI
from zhipuai import ZhipuAI
from dashscope import Generation
from dashscope.api_entities.dashscope_response import Role
import qianfan
import os
import streamlit as st

# 使用安全认证AK/SK鉴权，通过环境变量方式初始化；替换下列示例中参数，安全认证Access Key替换your_iam_ak，Secret Key替换your_iam_sk
os.environ["QIANFAN_ACCESS_KEY"] = "c62feb2b844848a080d75e4b13fa72a1"
os.environ["QIANFAN_SECRET_KEY"] = "d2e3674d1c1b4d709a7beaa8a43a4c58"

# 零一万物的API_BASE
API_BASE = "https://api.lingyiwanwu.com/v1"

# 通义千问的问答格式：system, user, assistant.将第一个assistant替换成system
def messages_to_qwen(messages):
    messages_qwen = [{'role': 'system', 'content': 'You are a helpful assistant.'}]
    # 添加messages中的的第一个元素后面的所有元素
    messages_qwen.extend(messages[1:])
    return messages_qwen

# 百度文心的问答格式：user, assistant. 去掉第一个asistant
def messages_to_wenxin(messages):
    messages_wenxin = []
    # 添加messages中的的第一个元素后面的所有元素
    messages_wenxin.extend(messages[1:])
    return messages_wenxin

# 01万物-Yi34B的问答格式：user, assistant. 去掉第一个asistant
def messages_to_yi(messages):
    messages_yi = []
    # 添加messages中的的第一个元素后面的所有元素
    messages_yi.extend(messages[1:])
    return messages_yi


# 1. 获取不同模型的回答：chatgpt, 智谱AI
def chat_model_response(vendor, api_key, model, messages):
    """
        传入参数：
                厂商：openai/zhipuai
                密钥：openai_api_key/zhipuai_api_key
                模型：gpt-3.5-turbo/glm-4
                对话：messages
        返回参数：
                模型对话内容:response。choices[0].message.content
    """
    # print()
    # print(messages)


    if vendor == 'openai':
        with OpenAI(api_key=api_key) as client:
            response = client.chat.completions.create(model=model, messages=messages, temperature=0.5, max_tokens=1024)
            return response.choices[0].message.content
    elif vendor == "zhipuai":
        with ZhipuAI(api_key=api_key) as client:
            response = client.chat.completions.create(model=model, messages=messages)
            return response.choices[0].message.content
    elif vendor == "alibaba":
        dashscope.api_key = api_key
        messages = messages_to_qwen(messages)
        response = dashscope.Generation.call(model=model, messages=messages, result_format='message')
        return response.output.choices[0].message.content
    elif vendor == "baidu":
        messages = messages_to_wenxin(messages)
        resp = qianfan.ChatCompletion().do(messages=messages, model=model)
        return resp["body"]['result']
    elif vendor == "01.wanwu":
        with OpenAI(api_key=api_key, base_url=API_BASE) as client:
            messages = messages_to_yi(messages)
            response = client.chat.completions.create(model="yi-34b-chat-200k", messages=messages)
            return response.choices[0].message.content







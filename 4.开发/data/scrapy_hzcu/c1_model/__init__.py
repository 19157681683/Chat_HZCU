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


# 智谱AI的API Key
zhipuai_api_key = "7545d65cf0e9b47f341f9cfa83d51f2c.msYqbjw8gUHbVf4R"

# OpenAI的API Key
openai_api_key = "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"

# 阿里巴巴的API Key
qwen_api_key = "sk-229f1bbff5c24b1d9e08c3b90a728bb9"

# 零一万物的API Key
wanwu_api_key = "e18a0fd6d1454f71839db94e42497146"

# 月之暗面的API Key
moonshot_api_key = "sk-rE6srayrm4Bt8CzfXYwZ474qdI1vYMsXaWvgYbDcziNFIJkR"

# 定义模型和供应商信息的映射
model_mappings = {
    "智谱AI": {
        "1.智谱AI-GLM3-Turbo": {"vendor": "zhipuai", "1.model": "GLM-3-Turbo", "api_key": zhipuai_api_key},
        "2.智谱AI-GLM4": {"vendor": "zhipuai", "1.model": "GLM-4", "api_key": zhipuai_api_key},
    },
    "OpenAI": {
        "3.OpenAI-GPT3.5": {"vendor": "openai", "1.model": "gpt-3.5-turbo-0125", "api_key": openai_api_key},
        "4.OpenAI-GPT4": {"vendor": "openai", "1.model": "gpt-4-0125-preview", "api_key": openai_api_key},
    },
    "阿里巴巴": {
        "5.阿里巴巴-Qwen-Turbo": {"vendor": "alibaba", "1.model": "qwen-turbo", "api_key": qwen_api_key},
        "6.阿里巴巴-Qwen-Max": {"vendor": "alibaba", "1.model": "qwen-max-longcontext", "api_key": qwen_api_key},
    },
    "百度": {
        "7.百度-ERNIE3.5": {"vendor": "baidu", "1.model": "ERNIE-3.5-8K-1222", "api_key": None},
        # "8.百度-ERNIE4.0": {"vendor": "baidu", "1.model": "ERNIE-4.0-8K", "api_key": None},
    },
    "零一万物": {
        "8.零一万物-Yi-34b": {"vendor": "01.wanwu", "1.model": "yi-34b-chat-200k", "api_key": wanwu_api_key},
    },
    "月之暗面": {
        "9.月之暗面-Moonshot-v1": {"vendor": "moonshot", "1.model": "moonshot-v1-8k", "api_key": moonshot_api_key},
    }
}

# 使用安全认证AK/SK鉴权，通过环境变量方式初始化；替换下列示例中参数，安全认证Access Key替换your_iam_ak，Secret Key替换your_iam_sk
os.environ["QIANFAN_ACCESS_KEY"] = "c62feb2b844848a080d75e4b13fa72a1"
os.environ["QIANFAN_SECRET_KEY"] = "d2e3674d1c1b4d709a7beaa8a43a4c58"

# 零一万物的API_BASE
API_BASE = "https://api.lingyiwanwu.com/v1"

# 根据用户选择获取供应商、模型和API密钥
def get_vender_info(company_model):
    selected_model_info = model_mappings.get(company_model.split('.')[1].split('-')[0], {}).get(company_model)
    vendor = selected_model_info["vendor"] if selected_model_info else None
    model = selected_model_info["1.model"] if selected_model_info else None
    api_key = selected_model_info["api_key"] if selected_model_info else None
    return vendor, model, api_key

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

# 月之暗面的问答格式：user, assistant. 去掉第一个asistant
def messages_to_kimi(messages):
    messages_kimi = []
    # 添加messages中的的第一个元素后面的所有元素
    messages_kimi.extend(messages[1:])
    return messages_kimi


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
            response = client.chat.completions.create(model=model, messages=messages, temperature=0.01, max_tokens=1024)
            return response.choices[0].message.content
    elif vendor == "zhipuai":
        with ZhipuAI(api_key=api_key) as client:
            response = client.chat.completions.create(model=model, messages=messages, temperature=0.01)
            return response.choices[0].message.content
    elif vendor == "alibaba":
        dashscope.api_key = api_key
        # messages = messages_to_qwen(messages)
        response = dashscope.Generation.call(model=model, messages=messages, temperature=0.01,  result_format='message')
        return response.output.choices[0].message.content
    elif vendor == "baidu":
        messages = messages_to_wenxin(messages)
        resp = qianfan.ChatCompletion().do(messages=messages, model=model, temperature=0.01)
        return resp["body"]['result']
    elif vendor == "01.wanwu":
        with OpenAI(api_key=api_key, base_url=API_BASE) as client:
            messages = messages_to_yi(messages)
            response = client.chat.completions.create(model="yi-34b-chat-200k", messages=messages, temperature=0.01)
            return response.choices[0].message.content
    elif vendor == "moonshot":
        with OpenAI(api_key=api_key, base_url="https://api.moonshot.cn/v1") as client:
            messages = messages_to_kimi(messages)
            completion = client.chat.completions.create(model=model, messages=messages, temperature=0.01)
            return completion.choices[0].message








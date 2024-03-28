# encoding: UTF-8
"""
# 让模型提取每页的问答对，提交到服务器
@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024-03-26 18:53

"""

from c2_handle_data import *
from c3_api import *

def post_url_qa__from_url(url):
    """
    :param url: 输入url
    :return: 问答对的Json格式
    """
    ########################################################################################################################
    # 1. url到文本
    # 获得url对应的html
    print("获取url对应的html")
    html_content = html_from_url(url)

    # 将html转为文本
    print("将html转为文本")
    text_content_origin = text_from_html(html_content)

    print("模型处理：文本长度为：" + str(len(text_content_origin)))



    ########################################################################################################################
    # 模型类型：1.智谱AI-GLM3-Turbo，2.智谱AI-GLM4，3.OpenAI-GPT3.5，4.OpenAI-GPT4，5.阿里巴巴-Qwen-Turbo，6.阿里巴巴-Qwen-Max，7.百度-ERNIE3.5，8.零一万物-Yi-34b，9.月之暗面-Moonshot-v1
    # 2. 问答对提取
    print("1. 问答对提取")
    text_content = text_from_html(text_content_origin, ignore_links=True, ignore_images=True)
    website_main_content = remove_english_characters_preserve_punctuation(text_content)
    print(website_main_content)
    company_model_type = "6.阿里巴巴-Qwen-Max"
    qa_json_str = qa_from_model(company_model_type, website_main_content)
    print(qa_json_str)
    qa_json = json_from_model_response(qa_json_str)
    print(qa_json)



# 测试url
url = "http://www.hzcu.edu.cn/col/col10/index.html"
webiste_qa_json = post_url_qa__from_url(url)




    ########################################################################################################################
    # 3. 提交到服务器
    # print("  5. 提交到服务器")
    # # 3.1. 先提交其他网站链接：
    # for i in range(len(website_urls_json)):
    #     other_link_website = list(website_urls_json.values())[i]
    #     other_link_descriptions = list(website_urls_json.keys())[i]
    #     add_url_info(url, website_title, website_main_content, None, other_link_website, "website", other_link_descriptions)
    #
    # # 3.2. 再提交图片链接：
    # for i in range(len(image_urls_json)):
    #     other_link_image = list(image_urls_json.values())[i]
    #     other_link_descriptions = list(image_urls_json.keys())[i]
    #     add_url_info(url, website_title, website_main_content, None, other_link_image, "image", other_link_descriptions)
    #
    # return website_urls_json
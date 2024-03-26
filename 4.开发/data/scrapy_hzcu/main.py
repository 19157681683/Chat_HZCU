# encoding: UTF-8
"""
# 使用c2_handle_data.py中的函数处理数据，处理，再调用c3_api.py中的函数提交
@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024-03-26 18:53

"""
from c2_handle_data import *
from c3_api import *

########################################################################################################################
# 1. url到文本
# 测试url
url = "http://www.hzcu.edu.cn/col/col10/index.html"

# 获得url对应的html
print("获取url对应的html")
html_content = html_from_url(url)

# 将html转为文本
print("将html转为文本")
text_content_origin = text_from_html(html_content)

print("模型处理：文本长度为：" + str(len(text_content_origin)))



########################################################################################################################
# 模型类型：1.智谱AI-GLM3-Turbo，2.智谱AI-GLM4，3.OpenAI-GPT3.5，4.OpenAI-GPT4，5.阿里巴巴-Qwen-Turbo，6.阿里巴巴-Qwen-Max，7.百度-ERNIE3.5，8.零一万物-Yi-34b，9.月之暗面-Moonshot-v1
# 2. 提取主体内容/标题/网站链接/图片链接
# 2.1. 文本提取
# 2.1.1. 主体内容
text_content = text_from_html(text_content_origin, ignore_links=True, ignore_images=True)
website_main_content = remove_english_characters_preserve_punctuation(text_content)
# 2.1.2. 标题提取
company_model_type = "5.阿里巴巴-Qwen-Turbo"
website_title = title_from_model(company_model_type, website_main_content)
print("  1. 网站主题：" + website_title)
print("  2. 网站主要内容：" + website_main_content)


# 2.2. urls提取
company_model_type = "1.智谱AI-GLM3-Turbo"
website_urls_str = url_from_model(company_model_type, text_content)
website_urls_json = json_from_model_response(website_urls_str)
print("  3. 关联网站：")
print(website_urls_json)


# 2.3. 图片链接
company_model_type = "5.阿里巴巴-Qwen-Turbo"
text_content = text_from_html(text_content_origin, ignore_links=True, ignore_images=False)
image_urls_str = image_from_model(company_model_type, text_content)
image_urls_json = json_from_model_response(image_urls_str)
print("  4. 关联图片：")
print(image_urls_json)


# 2.4. 文件链接


# 2.5. 其他链接



########################################################################################################################
# 3. 提交到服务器
# 3.1. 先提交其他网站链接：
for i in range(len(website_urls_json)):
    other_link_website = list(website_urls_json.values())[i]
    other_link_descriptions = list(website_urls_json.keys())[i]
    add_url_info(url, website_title, website_main_content, None, other_link_website, "website", other_link_descriptions)

# 3.2. 再提交图片链接：
for i in range(len(image_urls_json)):
    other_link_image = list(image_urls_json.values())[i]
    other_link_descriptions = list(image_urls_json.keys())[i]
    add_url_info(url, website_title, website_main_content, None, other_link_image, "image", other_link_descriptions)








########################################################################################################################
# 4. 从服务器获取数据
# 4.1. 获取网站链接
type = "website"
page_number = 1
page_size = 10
website_urls = get_url_info(type, page_number, page_size)
print("5. 网站数据如下: ")
print(website_urls)

# 4.2. 获取图片
type = "image"
page_number = 1
page_size = 10
image_urls = get_url_info(type, page_number, page_size)
print("6. 图片数据如下: ")
print(image_urls)




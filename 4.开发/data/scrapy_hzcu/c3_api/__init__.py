import json
import requests


ip = "218.244.157.106"
port = "8080"

# 爬虫同学：提交页面/链接/文件
def add_url_info(website_url, website_title, website_main_content, website_other_content, other_link_url, other_link_type, other_link_description):
    """
    :param website_url: 网址【必填】
    :param website_title: 网站标题【必填】
    :param website_main_content: 主要内容【必填】
    :param website_other_content: 其他内容
    :param other_link_url: 链接地址
    :param other_link_type: 链接类型：其他网站/图片/文件/其他（组件，可以不填写）
    :param other_link_description: 链接描述
    :return: True/False：是否提交成功
    """
    # 拼凑url
    url = f"http://{ip}:{port}/url"
    # 拼凑提交数据
    data = {
        'websiteUrl': website_url,
        'websiteTitle': website_title,
        'websiteMainContent': website_main_content,
        'websiteOtherContent': website_other_content,
        'otherLinkUrl': other_link_url,
        'otherLinkType': other_link_type,
        'otherLinkDescription': other_link_description
    }
    response = requests.post(url, json=data)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("添加记录成功")
        return True
    else:
        print("添加记录失败")
        return False


# RAG/微调同学：获取页面数据/链接/图片链接/文件链接
def get_url_info(type, page_number, page_size):
    """
    :param type: url/image/file/other: 类型：网址/图片链接/文件链接/其他
    :param page_number: 页码
    :param page_size: 每页显示数量
    :return: 获取的数据
    """
    # 拼凑url
    url = f"http://{ip}:{port}/info?type={type}&pageNumber={page_number}&pageSize={page_size}"
    response = requests.get(url)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("获取网站数据成功")
        return json_data["data"]
    else:
        print("获取网站数据失败")
        return None





# # 1. 添加网站信息测试
# website_url = "https://www.baidu.com"
# website_title = "百度"
# website_main_content = ""
# website_other_content = ""
# other_link_url = ""
# other_link_type = ""
# other_link_description = ""
# result = add_url_info(website_url, website_title, website_main_content, website_other_content, other_link_url, other_link_type, other_link_description)
#
#
# # 2. 获取网站信息测试
# type = "website"
# page_number = 1
# page_size = 10
# result_data = get_url_info(type, page_number, page_size)
# print(result_data)




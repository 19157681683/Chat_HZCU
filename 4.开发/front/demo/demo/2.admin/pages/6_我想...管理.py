# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/26 12:35

"""
import time

import pandas as pd
from datetime import datetime
import streamlit.components.v1 as components
import json
import requests
import streamlit as st
from dateutil.parser import parse

# 浏览器标设置
st.set_page_config(
    page_title="管理员-我想榜管理",
    page_icon="👋",
    layout='wide'
)

# ip = "localhost"
ip = "106.12.19.123"
port = "8080"
proxies = {"http": None, "https": None}


########################################################################################################################
# 1.封装我想的增删查改的API
# 1.1 查询我想分页信息
# # @st.cache_resource
def api_find_wishes(page_number, page_size):
    #  获取数据
    url = f"http://{ip}:{port}/admins/wishes-managements/wishes?pageNumber={page_number}&pageSize={page_size}"
    response = requests.get(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("获取我想分页信息成功")
        return json_data["data"]
    else:
        print("获取我想分页信息失败")
        return None

# 1.2 添加我想
@st.cache_resource
def api_add_wish(user_id, content):
    url = f"http://{ip}:{port}/admins/wishes-managements/wish"
    data = {
         "userId": user_id,
         "content": content
}
    response = requests.post(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("添加我想记录成功")
        return True
    else:
        print("添加我想记录失败")
        return False

# 1.3 更改我想信息
@st.cache_resource
def api_update_wish(wish_id, content, time, applause_number):
    url = f"http://{ip}:{port}/admins/wishes-managements/wish"
    data = {
         "wishId": wish_id,
         "content": content,
         "time": time,
         "applauseNumber": applause_number
}
    response = requests.put(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("更新我想信息成功")
        return True
    else:
        print("更新我想信息失败")
        return False

# 1.4 删除我想
@st.cache_resource
def api_delete_wish(wish_id):
    url = f"http://{ip}:{port}/admins/wishes-managements/wish?wishId={wish_id}"
    response = requests.delete(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("删除我想记录成功")
        return True
    else:
        print("删除我想记录失败")
        return False


########################################################################################################################
@st.cache_resource
def str_date_to_format(date_time):
    """
    将字符串格式的时间转换为 datetime 格式
    :param date_time:
    :return:
    """
    dt = parse(date_time)
    str_formatted = dt.strftime("%Y-%m-%d %H:%M:%S")
    date_time = datetime.strptime(str_formatted, "%Y-%m-%d %H:%M:%S")
    return date_time



# 添加我想
def add_wish(df):
    editor_df = st.data_editor(
        df,
        column_config={
            "我想留言": st.column_config.TextColumn(
               width=None,

            ),
           "我想时间": st.column_config.DateColumn(
                width=None,
                min_value=datetime(2020, 1, 1),
                max_value=datetime(2025, 1, 1),
                format="YYYY-MM-DD HH:MM:SS",
                step=60,
            ),
            "点赞数": st.column_config.NumberColumn(
                width="small",
            ),
            "确定添加": st.column_config.CheckboxColumn(
                width=None
            )
        },
        width=2000,
        height=50,
        hide_index=True,
        key="editor_1"
    )
    return editor_df

# 管理我想
def manage_wish(df):
    editor_df = st.data_editor(
        df,
        column_config={
            "序号": st.column_config.NumberColumn(
                width=None,
            ),
            "我想留言": st.column_config.TextColumn(
               width=None,

           ),
           "我想时间": st.column_config.DateColumn(
                width=None,
                min_value=datetime(2020, 1, 1),
                max_value=datetime(2025, 1, 1),
                format="YYYY-MM-DD HH:MM:SS",
                step=60,
            ),
            "点赞数": st.column_config.NumberColumn(
                width="small",
            ),
            "相关评论": st.column_config.TextColumn(
                width=None
            ),
            "更多评论": st.column_config.TextColumn(
                width=None
            ),
            "确定编辑": st.column_config.CheckboxColumn(
                width=None
            ),
            "删除": st.column_config.CheckboxColumn(
                width=None
            )
        },
        width=2000,
        height=400,
        hide_index=True,
        key="editor_2"
    )
    return editor_df

def add_wish_vo():
    """
    添加我想的整体封装
    :return:
    """
    vo_data = [['留个言', None, 666, False]]
    columns = ['我想留言', '我想时间', '点赞数', '确定添加']
    df = pd.DataFrame(vo_data, columns=columns)
    editor_df = add_wish(df)
    update_index = editor_df[editor_df['确定添加']].index.tolist()

    if len(update_index) > 0:
        wish_updated = editor_df.loc[update_index[0]].to_dict()
        is_success = api_add_wish(1, wish_updated['我想留言'])
        if is_success:
            # st.success("我想添加成功!")
            st.toast(":red[我想添加成功!]")
        else:
            st.toast(":red[我想添加失败!]")
            # st.error("我想添加失败!")

# 初始化 session_state 中的 DataFrame
if 'edited_df_old' not in st.session_state:
    st.session_state['edited_df_old'] = pd.DataFrame()

if 'edited_df_new' not in st.session_state:
    st.session_state['edited_df_new'] = pd.DataFrame()



# 2. 主界面
# 2.1 灰色横杠
# 创建一个带有灰色背景的空格
st.markdown("<div style='background-color: #f0f0f0; height: 50px;'></div>", unsafe_allow_html=True)
# 2.2 新增我想
st.write('')
st.markdown("##### 新增我想 ...")
add_wish_vo()
st.write('')

# 2.3 管理我想
st.markdown("##### 管理我想 ...")
# 获取分页我想信息
page_number = 1
page_size = 10
wish_dict_list = api_find_wishes(page_number, page_size)
if wish_dict_list not in st.session_state:
    st.session_state['wish_dict_list'] = wish_dict_list

# 拼凑前端数据
vo_data = []
for index in range(len(wish_dict_list)):
    vo_unit = []
    vo_unit.append(index + 1)
    vo_unit.append(wish_dict_list[index]["content"])
    vo_unit.append(str_date_to_format(wish_dict_list[index]["time"]))
    vo_unit.append(wish_dict_list[index]["applauseNumber"])
    vo_unit.append(None)
    vo_unit.append(None)
    vo_unit.append(False)
    vo_unit.append(False)
    vo_data.append(vo_unit)

# 展示我想列表数据
# with st.container(height=400, border=True):
columns = ['序号', '我想留言', '我想时间', '点赞数', '相关评论', '更多评论', '确定编辑', '删除']
df = pd.DataFrame(vo_data, columns=columns)
st.session_state['edited_df_new'] = manage_wish(df)
editor_df = st.session_state['edited_df_new']

# 点击确认编辑的按钮，确定其所在行，获取数据，更新我想信息
update_index = editor_df[editor_df['确定编辑']].index.tolist()
if len(update_index) > 0:
    wish_id = st.session_state['wish_dict_list'][update_index[0]]['wishId']
    wish_updated = editor_df.loc[update_index[0]].to_dict()
    api_update_wish(wish_id, wish_updated['我想留言'], str(wish_updated['我想时间']), wish_updated['点赞数'])
    st.toast(':red[我想信息更新成功!]')
    time.sleep(0.5)
    st.rerun()

# 点击删除的按钮，获取数据，删除我想信息
delete_index = editor_df[editor_df['删除']].index.tolist()
if len(delete_index) > 0:
    wish_id = st.session_state['wish_dict_list'][delete_index[0]]['wishId']
    api_delete_wish(wish_id)
    st.toast(':red[我想信息删除成功!]')
    time.sleep(0.5)
    st.rerun()

# 修改sidebar的登录为消失
js_btn0 = '''
           var li= window.parent.document.querySelector('.st-emotion-cache-j7qwjs');
           console.log(li)
            li.setAttribute('style', 'display:none !important;');
          '''
result = components.html(f'''<script>{js_btn0}</script>''', width=100, height=100)
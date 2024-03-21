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
    page_title="管理员-用户管理",
    page_icon="👋",
    layout='wide'
)

# ip = "localhost"
ip = "106.12.19.123"
port = "8080"
proxies = {"http": None, "https": None}


########################################################################################################################
# 1.封装用户的增删查改的API
# 1.1 查询用户分页信息
# @st.cache_resource
def api_find_users(page_number, page_size):
    #  获取数据
    url = f"http://{ip}:{port}/admins/users-managements/users?pageNumber={page_number}&pageSize={page_size}"
    response = requests.get(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("获取用户分页信息成功")
        return json_data["data"]
    else:
        print("获取用户分页信息失败")
        return None

# 1.2 添加用户
@st.cache_resource
def api_add_user(phone_number, password):
    url = f"http://{ip}:{port}/admins/users-managements/user"
    data = {
        'phoneNumber': phone_number,
        'password': password,
    }
    response = requests.post(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("添加用户记录成功")
        return True
    else:
        print("添加用户记录失败")
        return False

# 1.3 更改用户信息
@st.cache_resource
def api_update_user(user_id, phone_number, password, register_time, last_login_time):
    url = f"http://{ip}:{port}/admins/users-managements/user"
    data = {
        "userId": user_id,
        "phoneNumber": phone_number,
        "password": password,
        "registerTime": register_time,
        "lastLoginTime": last_login_time
    }
    response = requests.put(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("更新用户信息成功")
        return True
    else:
        print("更新用户信息失败")
        return False

# 1.4 删除用户
@st.cache_resource
def api_delete_user(user_id):
    url = f"http://{ip}:{port}/admins/users-managements/user?userId={user_id}"
    response = requests.delete(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "成功" in json_data["message"]:
        print("删除用户记录成功")
        return True
    else:
        print("获取用户记录失败")
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


# 添加用户
# @st.cache_resource
def add_user(df):
    editor_df = st.data_editor(
        df,
        column_config={
           "手机号": st.column_config.TextColumn(
               width=None,

           ),
           "密码": st.column_config.TextColumn(
                width=None
            ),
           "注册时间": st.column_config.DateColumn(
                width=None,
                min_value=datetime(2020, 1, 1),
                max_value=datetime(2025, 1, 1),
                format="YYYY-MM-DD HH:MM:SS",
                step=60,
            ),
            "上次登录时间": st.column_config.DateColumn(
                width=None,
                min_value=datetime(2020, 1, 1),
                max_value=datetime(2025, 1, 1),
                format="YYYY-MM-DD HH:MM:SS",
                step=60,
            ),
            "确定": st.column_config.CheckboxColumn(
                width=None
            ),

        },
        width=2000,
        height=50,
        hide_index=True,
        key="editor_add_user"
    )
    return editor_df

# 管理用户
# @st.cache_resource
def manage_user(df):
    editor_df = st.data_editor(
        df,
        column_config={
            "序号": st.column_config.NumberColumn(
                width=None,
            ),
           "手机号": st.column_config.TextColumn(
               width=None,

           ),
           "密码": st.column_config.TextColumn(
                width=None
            ),
           "注册时间": st.column_config.DateColumn(
                width=None,
                min_value=datetime(2020, 1, 1),
                max_value=datetime(2025, 1, 1),
                format="YYYY-MM-DD HH:MM:SS",
                step=60,
            ),
            "上次登录时间": st.column_config.DateColumn(
                width=None,
                min_value=datetime(2020, 1, 1),
                max_value=datetime(2025, 1, 1),
                format="YYYY-MM-DD HH:MM:SS",
                step=60,
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
        key="editor_manage_user"
    )
    return editor_df

def add_user_vo():
    """
    添加用户的整体封装
    :return:
    """
    vo_data = [['19157682999', '123456', None, None, False]]
    columns = ['手机号', '密码', '注册时间', '上次登录时间', '确定添加']
    df = pd.DataFrame(vo_data, columns=columns)
    editor_df = add_user(df)
    update_index = editor_df[editor_df['确定添加']].index.tolist()

    if len(update_index) > 0:
        user_updated = editor_df.loc[update_index[0]].to_dict()
        is_success = api_add_user(user_updated['手机号'], user_updated['密码'])
        if is_success:
            # st.success("用户添加成功!")
            st.toast(":red[用户添加成功!]")
        else:
            st.toast(":red[用户添加失败!]")
            # st.error("用户添加失败!")

# 初始化 session_state 中的 DataFrame
if 'edited_df_old' not in st.session_state:
    st.session_state['edited_df_old'] = pd.DataFrame()

if 'edited_df_new' not in st.session_state:
    st.session_state['edited_df_new'] = pd.DataFrame()



# 2. 主界面
# 2.1 灰色横杠
# 创建一个带有灰色背景的空格
st.markdown("<div style='background-color: #f0f0f0; height: 50px;'></div>", unsafe_allow_html=True)
# 2.2 新增用户
st.write('')
st.markdown("##### 新增用户 ...")
add_user_vo()
st.write('')

# 2.3 管理用户
st.markdown("##### 管理用户 ...")
# 获取分页用户信息
page_number = 1
page_size = 10
user_dict_list = api_find_users(page_number, page_size)
if user_dict_list not in st.session_state:
    st.session_state['user_dict_list'] = user_dict_list

# 拼凑前端数据
vo_data = []
for index in range(len(user_dict_list)):
    vo_unit = []
    vo_unit.append(index + 1)
    vo_unit.append(user_dict_list[index]["phoneNumber"])
    vo_unit.append(user_dict_list[index]["password"])
    vo_unit.append(str_date_to_format(user_dict_list[index]["registerTime"]))
    vo_unit.append(str_date_to_format(user_dict_list[index]["lastLoginTime"]))
    vo_unit.append(False)
    vo_unit.append(False)
    vo_data.append(vo_unit)

# 展示用户列表数据
# with st.container(height=400, border=True):
columns = ['序号', '手机号', '密码', '注册时间', '上次登录时间', '确定编辑', '删除']
df = pd.DataFrame(vo_data, columns=columns)
st.session_state['edited_df_new'] = manage_user(df)
editor_df = st.session_state['edited_df_new']

# 点击确认编辑的按钮，确定其所在行，获取数据，更新用户信息
update_index = editor_df[editor_df['确定编辑']].index.tolist()
if len(update_index) > 0:
    user_id = st.session_state['user_dict_list'][update_index[0]]['userId']
    user_updated = editor_df.loc[update_index[0]].to_dict()
    api_update_user(user_id, user_updated['手机号'], user_updated['密码'], str(user_updated['注册时间']), str(user_updated['上次登录时间']))
    st.toast(':red[用户信息更新成功!]')
    time.sleep(0.5)
    st.rerun()

# 点击删除的按钮，获取数据，删除用户信息
delete_index = editor_df[editor_df['删除']].index.tolist()
if len(delete_index) > 0:
    user_id = st.session_state['user_dict_list'][delete_index[0]]['userId']
    api_delete_user(user_id)
    st.toast(':red[用户信息删除成功!]')
    time.sleep(0.5)
    st.rerun()

# 修改sidebar的登录为消失
js_btn0 = '''
           var li= window.parent.document.querySelector('.st-emotion-cache-j7qwjs');
           console.log(li)
            li.setAttribute('style', 'display:none !important;');
          '''
result = components.html(f'''<script>{js_btn0}</script>''', width=100, height=100)
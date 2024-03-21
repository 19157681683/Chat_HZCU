# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/26 12:54

"""
import json

import streamlit as st
import streamlit.components.v1 as components
import time
import requests

# 配置ip和端口
# ip = "localhost"
ip = "106.12.19.123"
port = "8080"
proxies = {"http": None, "https": None}

# 浏览器标设置
st.set_page_config(
    page_title="管理员登录",
    page_icon="👋",
    layout='wide',
    initial_sidebar_state="collapsed"
)

@st.cache_resource
def api_login(phone_number, verification_code, password):
    """
    用户登录
    :param phone_number:
    :param verification_code:
    :param password:
    :return: 成功返回用户ID，失败返回None
    """
    url = f"http://{ip}:{port}/admins/logins/admins?phoneNumber={phone_number}&verificationCode={verification_code}&password={password}"
    response = requests.get(url, proxies=proxies)
    json_data = json.loads(response.text)
    if "失败" in json_data["message"]:
        print("登录失败")
        return 0, json_data['data']
    else:
        print("登录失败")
        return 1, json_data['data']


@st.cache_resource
def api_register(phone_number, verification_code, password):
    """
    注册
    :param phone_number:
    :param verification_code:
    :param password:
    :return:
    """
    #  post请求
    url = f"http://{ip}:{port}/admins/logins/admins"
    data = {
        'phoneNumber': phone_number,
        'verificationCode': verification_code,
        'password': password
    }
    response = requests.post(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "失败" in json_data["message"]:
        print("注册失败")
        return 0, json_data['data']
    else:
        print("注册成功")
        return 1, json_data['data']

@st.cache_resource
def api_reset_password(phone_number, verification_code, password):
    """
    :param phone_number:
    :param verification_code:
    :param password:
    :return:
    """
    #  post请求
    url = f"http://{ip}:{port}/admins/logins/admins"
    # 要发送的数据
    data = {
        'phoneNumber': phone_number,
        'verificationCode': verification_code,
        'password': password
    }
    response = requests.put(url, json=data, proxies=proxies)
    json_data = json.loads(response.text)
    if "失败" in json_data["message"]:
        print("重置密码失败")
        return 0, json_data['data']
    else:
        print("重置密码成功")
        return 1, json_data['data']

# 设置样式
with open("front/login_designer.css") as source_des:
    st.markdown(f"<style>{source_des.read()} </style>", unsafe_allow_html=True)

col1, col2, col3, col4 = st.columns([7, 1, 3, 1])
# # 1. 宣传视频
with col1:
    st.video("data/hzcu_15s.mp4")

    # 禁止滚动
    js_btn2 = '''

         var body=window.parent.document.querySelector('body');
         console.log(body);
          body.setAttribute('style', 'overflow-Y:hidden !important;height:100% !important;');
           var html=window.parent.document.querySelector('html');
            console.log(html);
          html.setAttribute('style', 'overflow-Y:hidden !important;height:100% !important;');
         '''
    # scroll.setAttribute('style', ' overflow-Y:hidden');
    result = components.html(f'''<script>{js_btn2}</script>''', width=100, height=100)

    # 设置视频大小
    js_btn0 = '''
       var video= window.parent.document.querySelector('.stVideo');
        video.setAttribute('style', ' width: 2135px !important; margin: -1000px -100px -1000px -79px !important;');
      '''
    result = components.html(f'''<script>{js_btn0}</script>''', width=100, height=100)

    # 视频循环播放
    js_btn1 = '''

    var video= window.parent.document.querySelector('.stVideo');
    console.log(video);
    video.muted=true;
    video.loop=true;
    video.controls=false
    video.play()'''
    result = components.html(f'''<script>{js_btn1}</script>''', width=100, height=100)

# st.write
# 2. 留空
with col2:
    st.write()

# 3. 登录/注册/忘记密码
with col3:
    col21, col22 = st.columns([1, 5])
    st.write("")
    st.write("")
    st.write("")
    st.write("")
    st.write("")
    st.write("")
    st.write("")
    st.write("")
    st.write("")
    st.markdown("<h3 style='text-align: center;'>Chat_HZCU </h3>", unsafe_allow_html=True)
    tab1, tab2, tab3 = st.tabs(["登录", "注册", "忘记密码"])

    # 登录
    with tab1:
        # 手机号
        phone_number = st.text_input("账号", placeholder="请输入您的手机号", max_chars=11, key='phone_number1')
        # 验证码
        col_ver_1, col_ver_2 = st.columns(2)
        verification_code = col_ver_1.text_input("验证码", placeholder="请输入您的验证码", max_chars=4, key="ver_code")
        col_ver_2.write('')
        col_ver_2.write('')
        col_ver_2.image('data/img.png')
        # 密码
        password = st.text_input("密码", placeholder="请输入您的密码", max_chars=10, type="password", key='password1')
        # 管理员/游客登录
        col11, col22 = st.columns([1, 1])
        with col11:
            # 登录按钮
            login_button = st.button("管理登录", key='button_1')
            if login_button:
                is_success, login_info = api_login(phone_number, verification_code, password)
                if is_success == 0:
                    st.error("登录失败, " + login_info)
                else:
                    st.success("登录成功")
                    # 保存admin
                    if 'admin' not in st.session_state:
                        st.session_state['admin'] = login_info
                    st.switch_page("pages/2_首页.py")

        with col22:
            # 游客登录
            guest_login = st.button("游客登录", key='guest_login')
            if guest_login:
                is_success, login_info = api_login(19157681683, 5530, 123456)
                if is_success == 0:
                    st.error("登录失败, " + login_info)
                else:
                    st.success("登录成功")
                    # 保存admin
                    if 'admin' not in st.session_state:
                        st.session_state['admin'] = login_info
                    st.switch_page("pages/2_首页.py")

    # 注册
    with tab2:
        # 手机号
        phone_number = st.text_input("账号", placeholder="请输入您的手机号", max_chars=11, key='phone_number2')
        # 验证码
        col_ver_1, col_ver_2 = st.columns(2)
        verification_code = col_ver_1.text_input("验证码", placeholder="请输入您的验证码", max_chars=4, key="ver_code2")
        col_ver_2.write('')
        col_ver_2.write('')
        col_ver_2.image('data/img.png')
        # 密码
        password = st.text_input("密码", placeholder="请输入您的密码", max_chars=10, type="password", key='password2')
        password = st.text_input("密码", placeholder="请输入您的密码", max_chars=10, type="password", key='password3')
        # 注册按钮
        register_button = st.button("注册", key='button3')
        if register_button:
            is_success, register_info = api_register(phone_number, verification_code, password)
            if is_success == 0:
                st.error("注册失败, " + register_info)
            else:
                st.success("注册成功, 手机号已经注册了")

    # 忘记密码
    with tab3:
        # 手机号
        phone_number = st.text_input("账号", placeholder="请输入您的手机号", max_chars=11, key='phone_number3')
        # 验证码
        col_ver_1, col_ver_2 = st.columns(2)
        verification_code = col_ver_1.text_input("验证码", placeholder="请输入您的验证码", max_chars=4, key="ver_code3")
        col_ver_2.write('')
        col_ver_2.write('')
        col_ver_2.image('data/img.png')
        # 确认密码
        password = st.text_input("密码", placeholder="请输入您的密码", max_chars=10, type="password", key='password4')
        password = st.text_input("密码", placeholder="请输入您的密码", max_chars=10, type="password", key='password5')
        # 确认修改密码按钮
        reset_password_button = st.button("确认", key='button4')
        if reset_password_button:
            is_success, reset_password_info = api_reset_password(phone_number, verification_code, password)
            if is_success == 0:
                st.error("重置密码失败, " + reset_password_info )
            else:
                st.success("重置密码成功")

# 4. 留空
with col4:
    st.container(height=780, border=False)





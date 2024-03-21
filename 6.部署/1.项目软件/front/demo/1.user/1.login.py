# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/26 12:54

"""

import streamlit as st
import streamlit.components.v1 as components
import time

# 配置ip
ip = "localhost"

# 浏览器标设置
st.set_page_config(
    page_title="用户登录",
    page_icon="👋",
    layout='wide',
    initial_sidebar_state="collapsed"
)

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
        phone_number = st.text_input("手机号码", key='phone_number1')
        # 验证码
        col_ver_1, col_ver_2 = st.columns(2)
        verification_code = col_ver_1.text_input("验证码", key="ver_code")
        col_ver_2.write('')
        col_ver_2.write('')
        col_ver_2.image('data/img.png')
        # 密码
        password = st.text_input("密码", key='password1')
        # 登陆按钮
        login_button = st.button("登录", key='button_1')
        if login_button:
            st.switch_page("pages/2.user.py")

    # 注册
    with tab2:
        # st.markdown("<h1 style='text-align: center;'>注册 </h1>", unsafe_allow_html=True)
        phone_number = st.text_input("手机号码", key='phone_number2')
        # 验证码
        col_ver_1, col_ver_2 = st.columns(2)
        verification_code = col_ver_1.text_input("验证码", key="ver_code2")
        col_ver_2.write('')
        col_ver_2.write('')
        col_ver_2.image('data/img.png')
        password = st.text_input("密码", key='password2')
        confirm_password = st.text_input("确认密码", key='password3')
        # 注册按钮
        log_button = st.button("注册", key='button3')

    # 忘记密码
    with tab3:
        # st.markdown("<h1 style='text-align: center;'>忘记密码 </h1>", unsafe_allow_html=True)
        phone_number = st.text_input("手机号码", key='phone_number3')
        # 验证码
        col_ver_1, col_ver_2 = st.columns(2)
        verification_code = col_ver_1.text_input("验证码", key="ver_code3")
        col_ver_2.write('')
        col_ver_2.write('')
        col_ver_2.image('data/img.png')
        # 确认密码
        password = st.text_input("新密码", key='password4')
        password = st.text_input("确认密码", key='password5')
        # 确认修改密码按钮
        log_button = st.button("确认", key='button4')

# 4. 留空
with col4:
    st.container(height=780, border=False)
    st.link_button("管理员登录", "http://" + str(ip) + ":8502/")





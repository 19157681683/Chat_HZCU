# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/26 12:35

"""
import streamlit as st
import pandas as pd
from datetime import datetime
import streamlit.components.v1 as components

# 浏览器标设置
st.set_page_config(
    page_title="管理员-用户管理",
    page_icon="👋",
    layout='wide'
)
# 初始化 session_state 中的 DataFrame
if 'edited_df' not in st.session_state:
    st.session_state.edited_df = pd.DataFrame()

# 2. 主界面
# 2.1 灰色横杠
# 创建一个带有灰色背景的空格
st.markdown("<div style='background-color: #f0f0f0; height: 50px;'></div>", unsafe_allow_html=True)
# 2.2 新增用户
st.write('')
st.button("+新增用户")
# 2.3 管理用户
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
            "密码": st.column_config.TextColumn(
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
        key="editor"
    )
    return editor_df

data = [
    ['1', '19157681683', datetime(2024, 1, 1, 16, 16, 42), datetime(2024, 1, 1, 16, 16, 42), '123456', False, False],
    ['2', '19157681687', datetime(2022, 10, 22, 18, 14, 38), datetime(2024, 1, 1, 16, 14, 38), '123456', False, False],
    ['3', '19157681699', datetime(2022, 10, 2, 16, 2, 0), datetime(2024, 1, 1, 16, 2, 0), '123456', False, False],
    ['4', '19157681711', datetime(2022, 10, 20, 18, 10, 41), datetime(2024, 1, 1, 16, 10, 41), '123456', False, False],
    ['5', '19157681900', datetime(2022, 10, 10, 12, 51, 20), datetime(2024, 1, 1, 12, 51, 20), '123456', False, False],
    ['6', '19157681700', datetime(2022, 10, 24, 10, 51, 20), datetime(2024, 1, 1, 16, 51, 20), '123456', False, False],
]
columns = ['序号', '手机号', '注册时间', '上次登录时间', '密码', '确定编辑', '删除']
df = pd.DataFrame(data, columns=columns)
st.session_state.edited_df = manage_user(df)


# 修改sidebar的登录为消失
js_btn0 = '''
           var li= window.parent.document.querySelector('.st-emotion-cache-j7qwjs');
           console.log(li)
            li.setAttribute('style', 'display:none !important;');
          '''
result = components.html(f'''<script>{js_btn0}</script>''', width=100, height=100)
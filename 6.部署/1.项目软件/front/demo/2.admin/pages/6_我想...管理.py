# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/26 12:37

"""
import streamlit as st
import pandas as pd
from datetime import datetime
import streamlit.components.v1 as components

# 浏览器标设置
st.set_page_config(
    page_title="管理员-我想管理",
    page_icon="👋",
    layout='wide'
)
# 初始化 session_state 中的 DataFrame
if 'edited_df' not in st.session_state:
    st.session_state.edited_df = pd.DataFrame()
# # 1. 左侧侧栏
# with st.sidebar:
#     st.image("./data/logo.png")
#     st.markdown('---')
#     st.write('首页')
#     st.write('用户管理')
#     st.write('吐槽榜管理')
#     st.write('我想...管理')
#     st.write('差评对话管理')

# 2. 主界面
# 2.1 灰色横杠
# 创建一个带有灰色背景的空格
st.markdown("<div style='background-color: #f0f0f0; height: 50px;'></div>", unsafe_allow_html=True)
# 2.2 新增吐槽
st.write('')
st.button("+新增我想...")
# 2.3 管理吐槽
def manage_user(df):
    editor_df = st.data_editor(
        df,
        column_config={
            "序号": st.column_config.NumberColumn(
                width=None,
            ),
            "我想...留言": st.column_config.TextColumn(
               width=None,

           ),
           "申请时间": st.column_config.DateColumn(
                width=None,
                min_value=datetime(2020, 1, 1),
                max_value=datetime(2025, 1, 1),
                format="YYYY-MM-DD HH:MM:SS",
                step=60,
            ),
            "点赞数": st.column_config.NumberColumn(
                width=None,
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
        key="editor"
    )
    return editor_df

data = [
    ['1', '我想添加学校校历数据', datetime(2022, 10, 30, 16, 16, 42), '666', '强烈希望', '...', False, False],
    ['2', '我想添加学校地图', datetime(2022, 10, 22, 18, 14, 38), '576', '对的，最好也能标注学校打印店的位置', '...',  False, False],
    ['3', '请添加电动车申请流程', datetime(2022, 10, 2, 16, 2, 0), '123', '最好附带申请电动车的标准', '...',  False, False],
    ['4', '我想添加报销流程', datetime(2022, 10, 20, 18, 10, 41), '112', '最好添加各个职位老师的报销标准等等的', '...',  False, False],
    ['5', '我想添加老师激励政策', datetime(2022, 10, 10, 12, 51, 20), '99',  '最好附带原文链接', '...', False, False],
    ['6', '能否给我推荐我需要的素质分活动', datetime(2022, 10, 24, 10, 51, 20), '88',  '可以按照课程冲突，线上/线下，素质分进行筛选', '...', False, False],
]
columns = ['序号', '我想...留言', '申请时间', '点赞数', '相关评论', '更多评论', '确定编辑', '删除']
df = pd.DataFrame(data, columns=columns)
st.session_state.edited_df = manage_user(df)

# 如果变化了，则显示1
if (st.session_state.edited_df.values != st.session_state.values).all():
    js_btn0 = '''
              var li= window.parent.document.querySelector('.st-emotion-cache-j7qwjs');
              console.log(li)
               li.setAttribute('style', 'display:none !important;');
             '''
    result = components.html(f'''<script>{js_btn0}</script>''', width=100, height=100)
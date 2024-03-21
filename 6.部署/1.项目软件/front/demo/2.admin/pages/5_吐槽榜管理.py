# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/2/26 12:36

"""
import streamlit as st
import pandas as pd
from datetime import datetime
import streamlit.components.v1 as components

# 浏览器标设置
st.set_page_config(
    page_title="管理员-吐槽榜管理",
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
st.button("+新增吐槽")
# 2.3 管理吐槽
def manage_user(df):
    editor_df = st.data_editor(
        df,
        column_config={
            "序号": st.column_config.NumberColumn(
                width=None,
            ),
            "吐槽留言": st.column_config.TextColumn(
               width=None,

           ),
           "吐槽时间": st.column_config.DateColumn(
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
        key="editor"
    )
    return editor_df

data = [
    ['1', '课程推荐错误了吧？', datetime(2022, 10, 30, 16, 16, 42), '666', '对的，我是计算机专业2022级，课程推荐与白皮书不符', '...', False, False],
    ['2', '学分评估错了吧？', datetime(2022, 10, 22, 18, 14, 38), '576', '创新创业课的学分计算错了吧？', '...',  False, False],
    ['3', '胖叔叔这好店不推荐吗？', datetime(2022, 10, 2, 16, 2, 0), '123', '就是就是，胖叔叔的煸煸鸡最好吃了', '...',  False, False],
    ['4', '做的什么垃圾，没有用', datetime(2022, 10, 20, 18, 10, 41), '123', '就是，就是', '...',  False, False],
    ['5', '可以查看课程的评价吗', datetime(2022, 10, 10, 12, 51, 20), '123',  '好像不能查看吧，学校有规定的', '...', False, False],
    ['6', '校历查询出错了', datetime(2022, 10, 24, 10, 51, 20), '112',  '是的，清明节连续假期只有一天', '...', False, False],
]
columns = ['序号', '吐槽留言', '吐槽时间', '点赞数', '相关评论', '更多评论', '确定编辑', '删除']
df = pd.DataFrame(data, columns=columns)
st.session_state.edited_df = manage_user(df)

# 如果变化了，则显示1
if (st.session_state.edited_df.values != st.session_state.values).all():
    print("111")
    js_btn0 = '''
              var li= window.parent.document.querySelector('.st-emotion-cache-j7qwjs');
              console.log(li)
               li.setAttribute('style', 'display:none !important;');
             '''
    result = components.html(f'''<script>{js_btn0}</script>''', width=100, height=100)
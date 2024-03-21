from openai import OpenAI
import streamlit as st
import pandas as pd
from zhipuai import ZhipuAI
import streamlit.components.v1 as components

# 配置ip
ip = "localhost"

# 智谱AI的API Key
zhipuai_api_key = "7545d65cf0e9b47f341f9cfa83d51f2c.msYqbjw8gUHbVf4R"

# 浏览器标设置
st.set_page_config(
    page_title="用户-对话",
    page_icon="👋",
    layout='wide',
    initial_sidebar_state="collapsed"
)

@st.cache_data
def cheer_up():
    st.snow()
    st.balloons()

# # # 显示气球和雪花
if 'log_in' not in st.session_state:
    cheer_up()
    st.session_state.log_in = 1



# 设置输入框为底部
with open("front/user_designer.css") as source_des:
    st.markdown(f"<style>{source_des.read()} </style>", unsafe_allow_html=True)


col1, col2, col3, col4 = st.columns([1, 2, 0.3, 1])
# 1. 左侧栏
with col1:
    col11, col12 = st.columns([60, 40])
    with col11:
        st.header(":rainbow[Chat_HZCU]")
        st.markdown("---")
        st.markdown("##### 历史聊天记录")
        genre = st.radio(
            "聊天记录",
            ["1.用户请求帮助", "2.世界探险计划"],
            index=0,
            label_visibility='collapsed'
        )

        # 更多聊天记录
        with st.expander("更多聊天记录"):
            genre = st.radio(
                "...",
                ["1.用户请求帮助", "2.世界探险计划", "3.Java基础"],
                index=int(genre.split('.')[0])-1,
                label_visibility='collapsed'
            )

    # st.container(height=455, border=False)
    st.link_button("🔙:orange[退出登录]", "http://" + str(ip) + ":8501")



# 3. 右侧栏
with col4:
    # 点赞回调函数,+1：传入参数：index:对应的按钮序号; type:我想/吐槽
    def thumb_up(index, type):
        st.session_state.pause_data[type][index] += 1

    # 差评回调函数，-1：传入参数：index:对应的按钮序号; type:我想/吐槽
    def thumb_down(index, type):
        st.session_state.pause_data[type][index] -= 1

    # 对每行进行封装： index: 表示第几行; wish_data：表示第一列添加的字符串; type:我想/吐槽
    def row_of_wish_list(index, wish_data, type):
        # 第一行
        col1, col2, col3, col4, col5 = st.columns([5, 1.2, 1, 1, 1])
        button1_key = 'thumb_up_' + type + str(index)
        button2_key = 'thumb_down_' + type + str(index)

        with col4:
            button = st.button('👍', key=button1_key)
            if button:
                thumb_up(index - 1, type)

        with col5:
            button = st.button('👎', key=button2_key)
            if button:
                thumb_down(index - 1, type)

        with col1:
            st.write(str(index) +'.' + wish_data[0])

        with col2:
            st.write(st.session_state.pause_data[type][index - 1])

        with col3:
            st.write('...')

    # 直接封装列表：indexs：表示行数，wish_datas:表示对应第一列添加的我想字符串
    def wish_list(indexs, wish_datas, type):
        for i in range(indexs):
            row_of_wish_list(i + 1, wish_datas[i], type)


    # 3.1. 我想...
    # 3.1.1. 显示数据
    st.markdown("##### 我想...")
    st.write('')

    # 点赞数,放入st.session_state:
    pause_data = dict(wish=[666, 576, 123])
    if 'pause_data' not in st.session_state:
        st.session_state.pause_data = pause_data

    # 创建3行数据
    indexs = 3
    wish_datas = [
        ['我想添加学校校历数据'],
        ['我想添加学校地图'],
        ['添加电动车申请流程'],
    ]
    type = 'wish'

    ## 3.1.2 我想榜
    wish_list(indexs, wish_datas, type)

    # 3.1.3. 查看更多
    with st.expander("查看更多我想..."):
        # 添加我想-点赞数-更多
        if st.session_state.pause_data.get('wish_more') == None:
            pause_data = [777, 666, 555, 444, 333]
            st.session_state.pause_data['wish_more'] = pause_data

        # 创建5行数据
        indexs = 5
        wish_datas_more = [
            ['我想添加学校校历数据'],
            ['我想添加学校地图'],
            ['添加电动车申请流程'],
            ['我想添加报销流程'],
            ['我想添加教师的激励政策'],
        ]
        type = 'wish_more'

        ## 显示我想榜
        wish_list(indexs, wish_datas_more, type)

    # 3.1.3.4. 用户添加想要的数据框
    wish_input = st.text_input("🥳", placeholder="请输入您想添加的数据😁", label_visibility='hidden')
    st.write(wish_input)

    # 间隔
    st.markdown('---')

    # 3.2. 吐槽榜
    # 3.2.1. 显示数据
    st.markdown("##### 吐槽榜")
    st.write('')

    # 吐槽-点赞数,放入st.session_state:
    if st.session_state.pause_data.get('bad_remark') == None:
        pause_data = [777, 666, 555]
        st.session_state.pause_data['bad_remark'] = pause_data

    # 创建3行数据
    indexs = 3
    wish_datas = [
        ['课程推荐错了吧?'],
        ['学分评估错了吧?'],
        ['胖叔叔这好店不推荐嘛?'],
    ]
    type = 'bad_remark'

    # 3.2.2.显示吐槽榜
    wish_list(indexs, wish_datas, type)

    # 3.2.3. 查看更多
    with st.expander("查看更多吐槽..."):
        # 吐槽-点赞数-更多
        if st.session_state.pause_data.get('bad_marker_more') == None:
            pause_data = [777, 666, 555, 444, 333]
            st.session_state.pause_data['bad_marker_more'] = pause_data
        # 创建5行数据
        indexs = 5
        wish_datas_more =[
            ['课程推荐错了吧?'],
            ['学分评估错了吧?'],
            ['胖叔叔这好店不推荐嘛?'],
            ['做的什么垃圾，没有用?'],
            ['可以查看课程的评价吗?']]
        type = 'bad_marker_more'

        ## 显示我想榜
        wish_list(indexs, wish_datas_more, type)

    # 3.1.3.4. 用户添加吐槽的数据框
    wish_input = st.text_input("🤮", placeholder="请输入您想吐槽的内容😱", label_visibility='hidden')
    st.write(wish_input)



# # 2. 中间对话
with col2:
    # 默认为1
    index = 1

    if genre:
        index = genre.split('.')[0]

    if int(index) == 1:
        # 2.1 标题
        st.caption("🚀 基于大语言模型的智能校务系统")

        if "messages" not in st.session_state:
            st.session_state["messages"] = [{"role": "assistant", "content": "你好！有什么问题我可以帮忙解决吗？"}]

        with st.container(height=700, border=False):

            # 2.2 向用户发送”你好！有什么问题我可以帮忙解决吗？“
            for msg in st.session_state.messages:
                st.chat_message(msg["role"]).write(msg["content"])

            # 2.3 提示词
            if prompt := st.chat_input("请输入您的问题"):
                # 将用户输入信息输出到对话框
                client = ZhipuAI(api_key=zhipuai_api_key)
                st.session_state.messages.append({"role": "user", "content": prompt})
                st.chat_message('user').write(prompt)

                # 将chatgpt的输出信息保留到messages，并输出到对话框
                response = client.chat.completions.create(model="glm-4", messages=st.session_state.messages)
                msg = response.choices[0].message.content
                st.session_state.messages.append({"role": "assistant", "content": msg})
                st.chat_message('assistant').write(msg)


    elif int(index) == 2:
        # 2.1 标题
        st.caption("🚀 基于大语言模型的智能校务系统")

        if "messages_2024_03_01" not in st.session_state:
            st.session_state.messages_2024_03_01 = [{'role': 'assistant', 'content': '你好！有什么问题我可以帮忙解决吗？'},
                                                       {'role': 'user', 'content': '世界那么大，我想去看看'},
                                                       {'role': 'assistant', 'content': '那真是个美好的想法！旅行可以让人见识不同的文化 ，风景和人情。不知道你有哪些地方感兴趣去探索呢？我可以帮你提供一些旅行建议或者计划方面的帮助。'},
                                                       {'role': 'user', 'content': '中国有哪些地方值得去旅游呢'},
                                                       {'role': 'assistant', 'content': '中国是一个拥有悠久历史和丰富文化的国家，有许多值得一游的地方。这里有一些你可以考虑的旅游目的地：\n'
                                                                                        '1. 北京：探索中国的古都，观故宫、天安门广场、长城等著名景点。\n'
                                                                                        '2. 上海：现代化的大都市，有华灯初上的外滩、田子坊等独具魅力的地方方\n'
                                                                                        '3. 西安：古老城市，有秦始皇兵马俑、大雁塔等历史遗迹。\n'
                                                                                        '4. 成都：享受美食之都的美食和悠闲生活节奏，可以近距离接触可爱的大熊猫。\n'
                                                                                        '5. 云南：被誉为“人间天堂”的地方，有丽江古城、香格里拉等优美的自然风光。\n'
                                                                                        '这些是中国众多值得一游的目的地之一，你可以选择根据自己的兴趣和时间作出更详细的旅行计划。如果你需要更多的详细信息或者建议，欢迎向我提问。'}]

        with st.container(height=700, border=False):
            # 2.2 重新刷新整个输入的对话信息
            for msg in st.session_state.messages_2024_03_01:
                st.chat_message(msg["role"]).write(msg["content"])

            # 2.3 提示词：用户输入时，上面代码执行，之后执行下面代码
            if prompt := st.chat_input("请输入您的问题"):
                # 将用户输入信息输出到对话区
                client = ZhipuAI(api_key=zhipuai_api_key)
                st.session_state.messages_2024_03_01.append({"role": "user", "content": prompt})
                st.chat_message('user').write(prompt)

                # 将chatgpt的输出信息保留到messages，并输出到对话区
                response = client.chat.completions.create(model="glm-4", messages=st.session_state.messages_2024_03_01)
                msg = response.choices[0].message.content
                st.session_state.messages_2024_03_01.append({"role": "assistant", "content": msg})
                st.chat_message('assistant').write(msg)


    else:
        # 2.1 标题
        st.caption("🚀 基于大语言模型的智能校务系统")

        if "messages_2024_02_29" not in st.session_state:
            st.session_state.messages_2024_02_29 = [
                {'role': 'assistant', 'content': '你好！有什么问题我可以帮忙解决吗？'},
                {'role': 'user', 'content': 'Java是一门什么样的语言呢？'},
                {'role': 'assistant','content': 'Java是一种通用、面向对象、跨平台的编程语言。它由Sun Microsystems公域，包括Web应用程序开发、移动应用程序开发、企业级应用程序开发等。'
                                                'Java的跨平台特性意味着编写的Java程序可以在不同的操作系统上运行，只需安装相 应的Java虚拟机即可。Java拥有强大的生态系统和广泛的应用领域，因此被广泛应用于软件开发领域。'}]

        with st.container(height=700, border=False):
            # 2.2 重新刷新整个输入的对话信息
            for msg in st.session_state.messages_2024_02_29:
                st.chat_message(msg["role"]).write(msg["content"])

            # 2.3 提示词：用户输入时，上面代码执行，之后执行下面代码
            if prompt := st.chat_input("请输入您的问题"):
                # 将用户输入信息输出到对话区
                client = ZhipuAI(api_key=zhipuai_api_key)
                st.session_state.messages_2024_02_29.append({"role": "user", "content": prompt})
                st.chat_message('user').write(prompt)

                # 将chatgpt的输出信息保留到messages，并输出到对话区
                response = client.chat.completions.create(model="glm-4",
                                                          messages=st.session_state.messages_2024_02_29)
                msg = response.choices[0].message.content
                st.session_state.messages_2024_02_29.append({"role": "assistant", "content": msg})
                st.chat_message('assistant').write(msg)









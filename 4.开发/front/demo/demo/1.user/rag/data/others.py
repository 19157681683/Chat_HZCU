# encoding: UTF-8
"""

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/13 22:32

"""
# 1. 设置OpenAI的密钥
# 如果你需要通过代理端口访问，你需要如下配置
import os
import streamlit as st
from PyPDF2 import PdfReader
from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.text_splitter import CharacterTextSplitter
from langchain_community.vectorstores import FAISS
from langchain.chains.question_answering import load_qa_chain
from langchain_community.llms import OpenAI
from langchain.chains import RetrievalQA

os.environ['HTTPS_PROXY'] = 'http://127.0.0.1:7890'
os.environ['HTTP_PROXY'] = 'http://127.0.0.1:7890'
os.environ["OPENAI_API_KEY"] = "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"

# 1. 保存文件
def save_file():
    # 确保 'data' 文件夹存在
    data_folder = "data"
    if not os.path.exists(data_folder):
        os.makedirs(data_folder)

    # 创建一个上传文件的小部件
    uploaded_file = st.file_uploader("上传文件", type=["jpg", "png", "pdf", "txt"])
    uploaded_file_name = uploaded_file.name if uploaded_file is not None else None

    if uploaded_file is not None:
        # 将上传的文件保存到 'data' 文件夹中
        file_path = os.path.join(data_folder, uploaded_file.name)
        with open(file_path, "wb") as buffer:
            buffer.write(uploaded_file.getbuffer())

        st.success("上传文件成功!")
    return uploaded_file_name

# 2. RAG回答
def rag_to_response(query, filename):
    """
    :param rag: 文本名称
    :return:
    """

    st.write("1. 正在加载文档...")
    # 1. L：Loader：文档加载
    # 1.2 提取pdf每页文档，并进行拼接
    doc_reader = PdfReader('data/' + filename)
    raw_text = ''
    for i, page in enumerate(doc_reader.pages):
        text = page.extract_text()
        if text:
            raw_text += text

    # 2. D：Document Split：文档切分
    # 2.1 文档拆分，每1000个字符为一个块
    st.write(f"2. 该文档长度：{len(raw_text)}个字符, 正在切分文档...")
    text_splitter = CharacterTextSplitter(
        separator="\n",
        chunk_size=100,
        chunk_overlap=20,
        length_function=len,
    )
    texts = text_splitter.split_text(raw_text)

    # 3. E：Embedding：采取向量化模型
    embeddings = OpenAIEmbeddings()

    # 4. V：Vector：向量数据库
    st.write("3. 正在将文档向量化, 存储到向量数据库...")
    docsearch = FAISS.from_texts(texts, embeddings)

    # 5. 问题检索
    st.write("4. 正在检索问题答案, 并作出回答...")
    retriever = docsearch.as_retriever(search_type="similarity", search_kwargs={"k": 4})
    # 创建回答问题的链：包含原文档
    rqa = RetrievalQA.from_chain_type(llm=OpenAI(model="gpt-3.5-turbo-instruct"),
                                      chain_type="stuff",
                                      retriever=retriever,
                                      return_source_documents=True)         # 返回原文档
    # print()
    # print(rqa(query))
    st.write(rqa(query)['source_documents'])
    return rqa(query)['result']
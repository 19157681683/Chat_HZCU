# encoding: UTF-8

"""
@author: 李秀奇
@email: lixiuqixiaoke@qq.com
@create_time: 2024/4/5 14:32


"""
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Milvus

embeddings = HuggingFaceEmbeddings(model_name="/home/ke/person/models/bge-large-zh-v1.5")
Milvus = Milvus(embedding_function=embeddings)


def get_milvus() -> Milvus:
    return Milvus

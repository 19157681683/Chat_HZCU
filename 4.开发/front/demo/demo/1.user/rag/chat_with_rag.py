# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/3/29 17：51

@description = 与RAG模型交互
"""
from typing import Optional

from langchain_community.chat_models.ollama import ChatOllama
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores.milvus import Milvus
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import PromptTemplate
from langchain_core.runnables import RunnablePassthrough
from ctr_in_vector_db import CtrINVectorDB
from model import ChatWithRAGModel, CtrINVectorDBModel


class ChatWithRAG:
    def __init__(self, model: ChatWithRAGModel):
        self.host = model.CtrINVectorDBModelConfig.host
        self.port = model.CtrINVectorDBModelConfig.port
        self.llm = ChatOllama(model=model.chat_model_path)
        self.embeddings = HuggingFaceEmbeddings(model_name=model.CtrINVectorDBModelConfig.embedding_model_path)
        self.vector_db_config = model.CtrINVectorDBModelConfig
        self.milvus_store = CtrINVectorDB(self.vector_db_config)
        self.retriever = self.milvus_store.vector_db.as_retriever(
            search_type=model.search_type,
            search_kwargs={
                "k": model.k_nearest
            }
        )

        """
        # 未测试
        search_kwargs的其他参数：
                "score_threshold": 0.5,  # 调整最小相关性阈值
        "fetch_k": 30,  # 调整要传递给MMR算法的文档数量
        "lambda_mult": 0.7,  # 调整MMR返回的结果的多样性；1表示最小多样性，0表示最大多样性
        "filter": {"metadata_field": "value"}  # 通过文档元数据进行过滤 
        """

    def chat_with_rag(self, query):
        template = """Use the following pieces of context to answer the question at the end.
        If you don't know the answer, just say that you don't know, don't try to make up an answer.
        Use three sentences maximum and keep the answer as concise as possible.
        Always say "thanks for asking!" at the end of the answer.

        {context}

        Question: {question}

        Helpful And  Chinese Answer :"""
        custom_rag_prompt = PromptTemplate.from_template(template)

        def format_docs(docs):
            return "\n\n".join(doc.page_content for doc in docs)

        rag_chain = (
                {"context": self.retriever | format_docs, "question": RunnablePassthrough()}
                | custom_rag_prompt
                | self.llm
                | StrOutputParser()
        )

        response = rag_chain.invoke(query)
        return response


if __name__ == '__main__':
    chat_model_name = "openchat:7b-v3.5-0106"
    embedding_model_name = "/home/ke/person/models/bge-large-zh-v1.5"
    pdf_path = "/home/ke/pythonProject/Chat_HZCU/4.开发/front/demo/demo/1.user/rag/data/浙大城市学院财务报销办事指南.pdf"
    config1 = CtrINVectorDBModel(embedding_model_path=embedding_model_name)
    config2 = ChatWithRAGModel(chat_model_path=chat_model_name,
                               CtrINVectorDBModelConfig=config1)
    model = ChatWithRAG(config2)
    response = model.chat_with_rag("外出行车费如何报销？")
    print(response)

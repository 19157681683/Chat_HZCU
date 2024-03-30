# encoding: UTF-8

"""
@author: 李秀奇
@email: lixiuqixiaoke@qq.com
@create_time: 2024/3/29 17:51

@description: 与RAG模型交互
"""
import typing

from langchain_community.chat_message_histories.in_memory import ChatMessageHistory
from langchain_community.chat_models.ollama import ChatOllama
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_core.chat_history import BaseChatMessageHistory
from langchain_core.messages import HumanMessage
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import PromptTemplate, ChatPromptTemplate, MessagesPlaceholder
from langchain_core.runnables import RunnablePassthrough
from langchain_core.runnables.history import RunnableWithMessageHistory

from ctr_vector_db import VectorDatabase
from model import VectorDatabaseConfig, ChatModelSettings, SearchParameters, ChatWithRAGModelConfiguration

from langchain.chains import create_history_aware_retriever
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain.chains import create_retrieval_chain
from langchain.chains.combine_documents import create_stuff_documents_chain


class ChatModel:
    def __init__(self, model_config: ChatModelSettings):
        self.llm = ChatOllama(model=model_config.chat_model_path)


class VectorModel:
    def __init__(self, vector_db_config: VectorDatabaseConfig, search_type: SearchParameters):
        self.embeddings = HuggingFaceEmbeddings(model_name=vector_db_config.embedding_model_path)
        self.milvus_store = VectorDatabase(vector_db_config)
        self.retriever = self.milvus_store.vector_db.as_retriever(
            search_type=search_type.search_type,
            search_kwargs={
                "k": search_type.k_nearest,
            },
        )

        """
        search_kwargs 可以包含如下额外参数：

        "score_threshold": 0.5,  # 调整最小相关性阈值
        "fetch_k": 30,  # 调整要传递给MMR算法的文档数量
        "lambda_mult": 0.7,  # 调整MMR返回结果的多样性；1表示最小多样性，0表示最大多样性
        "filter": {"metadata_field": "value"},  # 通过文档元数据进行过滤
        """


class ChatWithRAG:
    def __init__(
            self,
            chat_model: ChatModel,
            vector_model: VectorModel,
            chat_with_rag_config: ChatWithRAGModelConfiguration,
    ):
        self.config = chat_with_rag_config
        self.chat_model = chat_model
        self.vector_model = vector_model
        self.message_store = {}

    def _get_host_and_port(self) -> typing.Tuple[str, str]:
        return self.config.vector_db_config.host, self.config.vector_db_config.port

    def _build_single_query_rag_chain(self, query: str) -> dict:
        context_template = """请使用以下上下文来回答最后的问题。
        如果你不知道答案，请说“我不知道”，不要尝试编造答案。
        最多使用三句话，并尽量简洁地回答。

        {context}

        问题：{question}

        有帮助的中文答案："""

        formatter = lambda docs: "\n\n".join(doc.page_content for doc in docs)
        custom_rag_prompt = PromptTemplate.from_template(context_template)

        rag_chain = (
                {"context": self.vector_model.retriever | formatter, "question": RunnablePassthrough()}
                | custom_rag_prompt
                | self.chat_model.llm
                | StrOutputParser()
        )

        response = rag_chain.invoke(query)
        return response

    def _create_history_aware_retriever(self) -> object:
        contextualize_q_system_prompt = """根据聊天历史和最新的用户问题，
                用户可能引用了聊天历史中的上下文，构造了一个无需查看聊天历史也能理解的问题。
                请勿直接作答，仅在必要时重构问题，否则原样返回。"""

        contextualize_q_prompt = ChatPromptTemplate.from_messages(
            [
                ("system", contextualize_q_system_prompt),
                MessagesPlaceholder("chat_history"),
                ("human", "{input}"),
            ]
        )

        return create_history_aware_retriever(self.chat_model.llm, self.vector_model.retriever, contextualize_q_prompt)

    def _get_or_create_session_history(self, session_id: str) -> BaseChatMessageHistory:
        if session_id not in self.message_store:
            self.message_store[session_id] = ChatMessageHistory()
        return self.message_store[session_id]

    def process_conversational_rag(self, query: str, session_id: str) -> str:
        history_aware_retriever = self._create_history_aware_retriever()

        qa_system_prompt = """你是一个问答任务的助手。
           请使用以下检索到的上下文来回答问题。
           如果你不知道答案，请说“我不知道”。
           最多使用三句话，并尽量简洁地回答。

           {context}"""

        qa_prompt = ChatPromptTemplate.from_messages(
            [
                ("system", qa_system_prompt),
                MessagesPlaceholder("chat_history"),
                ("human", "{input}"),
            ]
        )

        question_answer_chain = create_stuff_documents_chain(self.chat_model.llm, qa_prompt)
        retrieval_chain = create_retrieval_chain(history_aware_retriever, question_answer_chain)

        conversational_rag_chain = RunnableWithMessageHistory(
            retrieval_chain,
            self._get_or_create_session_history,
            input_messages_key="input",
            history_messages_key="chat_history",
            output_messages_key="answer",
        )

        response = conversational_rag_chain.invoke({"input": query}, {"configurable": {"session_id": session_id}})
        return response["answer"]


class ChatWithRAGFactory:
    def __init__(
            self,
            chat_model_name: str,
            embedding_model_name: str,
            search_method: str,
            nearest_neighbors_count: int,
    ):
        chat_model_config = ChatModelSettings(model_path=chat_model_name)
        chat_model = ChatModel(model_config=chat_model_config)

        vector_db_config = VectorDatabaseConfig(embedding_model_path=embedding_model_name)
        search_type = SearchParameters(search_method=search_method, nearest_neighbors_count=nearest_neighbors_count)
        vector_model = VectorModel(vector_db_config, search_type)
        rag_config = ChatWithRAGModelConfiguration(search_config=search_type, vector_db_config=vector_db_config)

        self.chat_with_rag = ChatWithRAG(chat_model, vector_model, rag_config)

    def create_chat_with_rag(self) -> ChatWithRAG:
        return self.chat_with_rag


if __name__ == "__main__":
    chat_with_rag_factory = ChatWithRAGFactory(
        chat_model_name="openchat:7b-v3.5-0106",
        embedding_model_name="/home/ke/person/models/bge-large-zh-v1.5",
        search_method="similarity",
        nearest_neighbors_count=5,
    )
    chat_with_rag = chat_with_rag_factory.create_chat_with_rag()

    # response1 = chat_with_rag._build_single_query_rag_chain("探亲旅费报销规定是什么？")

    # print(response1)
    response2 = chat_with_rag.process_conversational_rag("探亲旅费报销规定是什么？", "xiaoke_test1")
    print("____________________________")

    print(response2)
    response3 = chat_with_rag.process_conversational_rag("具体一些！", "xiaoke_test1")

    print("____________________________")
    print(response3)

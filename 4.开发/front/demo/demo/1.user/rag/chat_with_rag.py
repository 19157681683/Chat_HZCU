# encoding: UTF-8

"""
@author: 李秀奇
@email: lixiuqixiaoke@qq.com
@create_time: 2024/3/29 17:51

@description: 与RAG模型交互
"""
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
        self.host = chat_with_rag_config.vector_db_config.host
        self.port = chat_with_rag_config.vector_db_config.port
        self.llm = chat_model.llm
        self.embeddings = vector_model.embeddings
        self.vector_db_config = chat_with_rag_config.vector_db_config
        self.retriever = vector_model.retriever
        self.store = {}

    def single_chat_with_rag(self, query: str) -> dict:
        context_template = """请使用以下上下文来回答最后的问题。
        如果你不知道答案，请说“我不知道”，不要尝试编造答案。
        最多使用三句话，并尽量简洁地回答。

        {context}

        问题：{question}

        有帮助的中文答案："""

        custom_rag_prompt = PromptTemplate.from_template(context_template)
        formatter = lambda docs: "\n\n".join(doc.page_content for doc in docs)

        rag_chain = (
                {"context": self.retriever | formatter, "question": RunnablePassthrough()}
                | custom_rag_prompt
                | self.llm
                | StrOutputParser()
        )

        response = rag_chain.invoke(query)
        return response

    def _create_history_aware_retriever(self):
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

        history_aware_retriever = create_history_aware_retriever(
            self.llm, self.retriever, contextualize_q_prompt
        )
        return history_aware_retriever

    def get_session_history(self, session_id: str) -> BaseChatMessageHistory:
        if session_id not in self.store:
            self.store[session_id] = ChatMessageHistory()
        return self.store[session_id]

    def have_history_rag(self, query: str):
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

        question_answer_chain = create_stuff_documents_chain(self.llm, qa_prompt)
        rag_chain = create_retrieval_chain(history_aware_retriever, question_answer_chain)

        conversational_rag_chain = RunnableWithMessageHistory(
            rag_chain,
            self.get_session_history,
            input_messages_key="input",
            history_messages_key="chat_history",
            output_messages_key="answer",
        )
        response = conversational_rag_chain.invoke(
            {"input": query},
            config={
                "configurable": {"session_id": "xiaoke_test1"}
            },  # constructs a key "abc123" in `store`.
        )["answer"]
        return response


class CreateChatWithRAG:
    def __init__(self, chat_model: ChatModel, vector_model: VectorModel,
                 chat_with_rag_config: ChatWithRAGModelConfiguration):
        self.chat_model = chat_model
        self.vector_model = vector_model
        self.chat_with_rag_config = chat_with_rag_config

    def create_chat_with_rag(self) -> ChatWithRAG:
        return ChatWithRAG(
            chat_model=self.chat_model,
            vector_model=self.vector_model,
            chat_with_rag_config=self.chat_with_rag_config,
        )


if __name__ == '__main__':
    chat_model_name = "openchat:7b-v3.5-0106"
    chat_model_config = ChatModelSettings(model_path=chat_model_name)
    chat_model = ChatModel(model_config=chat_model_config)

    embedding_model_name = "/home/ke/person/models/bge-large-zh-v1.5"
    vector_db_config = VectorDatabaseConfig(embedding_model_path=embedding_model_name)
    search_type = SearchParameters(search_method="similarity", nearest_neighbors_count=5)
    vector_model = VectorModel(vector_db_config, search_type)
    rag_config = ChatWithRAGModelConfiguration(search_config=search_type, vector_db_config=vector_db_config)

    # 创建并使用 ChatWithRAG 对象
    chat_with_rag_creator = CreateChatWithRAG(chat_model=chat_model, vector_model=vector_model,
                                              chat_with_rag_config=rag_config)
    chat_with_rag = chat_with_rag_creator.create_chat_with_rag()

    # response1 = chat_with_rag.single_chat_with_rag("探亲旅费报销规定是什么？")

    # print(response1)
    response2 = chat_with_rag.have_history_rag("探亲旅费报销规定是什么？")
    print("____________________________")

    print(response2)
    response3 = chat_with_rag.have_history_rag("具体一些！")

    print("____________________________")
    print(response3)

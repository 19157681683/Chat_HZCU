from pprint import pprint

from langchain.chains.combine_documents import create_stuff_documents_chain
from langchain.chains.history_aware_retriever import create_history_aware_retriever
from langchain.chains.retrieval import create_retrieval_chain
from langchain_community.chat_message_histories.in_memory import ChatMessageHistory
from langchain_core.chat_history import BaseChatMessageHistory
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import PromptTemplate, MessagesPlaceholder, ChatPromptTemplate
from langchain_core.runnables import RunnablePassthrough
from langchain_core.runnables.history import RunnableWithMessageHistory


class ChatWithRAG:
    def __init__(
            self,
            chat_model,
            vector_model,
    ):
        self.chat_model = chat_model
        self.retriever = vector_model.as_retriever()
        self.message_store = {}

    def _get_or_create_session_history(self, session_id: str) -> BaseChatMessageHistory:
        if session_id not in self.message_store:
            self.message_store[session_id] = ChatMessageHistory()
        return self.message_store[session_id]

    def _build_single_query_rag_chain(self, query: str) -> str:
        context_template = """请使用以下上下文来回答最后的问题。
        如果你不知道答案，请说“我不知道”，不要尝试编造答案。
        最多使用三句话，并尽量简洁地回答。

        {context}

        问题：{question}

        有帮助的中文答案："""

        formatter = lambda docs: "\n\n".join(doc.page_content for doc in docs)
        custom_rag_prompt = PromptTemplate.from_template(context_template)

        rag_chain = (
                {"context": self.retriever | formatter, "question": RunnablePassthrough()}
                | custom_rag_prompt
                | self.chat_model
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

        return create_history_aware_retriever(self.chat_model, self.retriever, contextualize_q_prompt)

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

        question_answer_chain = create_stuff_documents_chain(self.chat_model, qa_prompt)
        retrieval_chain = create_retrieval_chain(history_aware_retriever, question_answer_chain)

        conversational_rag_chain = RunnableWithMessageHistory(
            retrieval_chain,
            self._get_or_create_session_history,
            input_messages_key="input",
            history_messages_key="chat_history",
            output_messages_key="answer",
        )

        response = conversational_rag_chain.invoke({"input": query}, {"configurable": {"session_id": session_id}})
        pprint(response)
        return response["answer"]
from langchain_community.chat_models.ollama import ChatOllama
from langchain_community.document_loaders import TextLoader
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Milvus
from langchain_core.messages import HumanMessage
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import PromptTemplate
from langchain_core.runnables import RunnablePassthrough
from langchain_openai import OpenAIEmbeddings
from langchain_text_splitters import CharacterTextSplitter
from langchain_community.document_loaders import PyMuPDFLoader
from pdf_split import PDFSplitAgent

embeddings = HuggingFaceEmbeddings(model_name="/home/ke/person/models/bce-embedding-base_v1")


class RAGChat:
    def __init__(self, file_path, embedding_model_path="BAAI/bge-large-zh-v1.5", host="127.0.0.1", port="19530"):
        self.llm = ChatOllama(model="cas/minicpm-3b-openhermes-2.5-v2:latest")
        self.file_path = file_path
        self.embeddings = HuggingFaceEmbeddings(model_name=embedding_model_path)
        self.docs = [document for document in self._document_split()]
        self.vector_db = Milvus.from_documents(
            self.docs,
            self.embeddings,
            connection_args={"host": host, "port": port},
        )
        self.milvus_store = Milvus(

            embedding_function=self.embeddings,
            collection_name="LangChainCollection",
            auto_id=True
        ).as_retriever()
        self.retriever = self.vector_db.as_retriever()

    def _similarity_search(self, query):
        docs = self.vector_db.similarity_search(query)
        return docs

    def _document_split(self):
        pdf = PDFSplitAgent(pdf_path=self.file_path)
        for document in pdf.split_agent_pdf():
            yield document

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
                {"context": self.milvus_store | format_docs, "question": RunnablePassthrough()}
                | custom_rag_prompt
                | self.llm
                | StrOutputParser()
        )
        print(self.retriever | format_docs)

        response = rag_chain.invoke(query)
        return response


chat_model_name = "openchat:7b-v3.5-0106"
embedding_model_name = "/home/ke/person/models/bge-large-zh-v1.5"
pdf_path = "/home/ke/pythonProject/Chat_HZCU/4.开发/front/demo/demo/1.user/rag/data/浙大城市学院财务报销办事指南.pdf"
model = RAGChat(file_path=pdf_path, embedding_model_path=embedding_model_name)
response = model.chat_with_rag("外出行车费如何报销？")
print(response)

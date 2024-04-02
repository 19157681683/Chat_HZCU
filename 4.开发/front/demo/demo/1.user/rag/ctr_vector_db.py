# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/3/29 17：51

@description = 用于将文档转换为向量存储到milvus中
"""

from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Milvus

from pdf_split import PDFSplitAgent

from model import MilvusConfig


class VectorDatabase:
    def __init__(self, model: MilvusConfig):
        self.model = model
        self.file_path = model.file_path
        self.embeddings = HuggingFaceEmbeddings(model_name=model.embedding_model_path)
        self.docs = [document for document in self._document_split()]
        self.vector_db = Milvus(
            embedding_function=self.embeddings,
            collection_name=model.collection_name,
            collection_description=model.collection_description,
            collection_properties=model.collection_properties,
            connection_args={"host": model.host, "port": model.port},
            consistency_level=model.consistency_level,
            index_params=model.index_params,
            search_params=model.search_params,
            drop_old=model.drop_old,
            auto_id=model.auto_id,
            primary_field=model.primary_field,
            text_field=model.text_field,
            vector_field=model.vector_field,
            metadata_field=model.metadata_field,
            partition_key_field=model.partition_key_field,
            partition_names=model.partition_names,
            replica_number=model.replica_number,
            timeout=model.timeout
        )
        self._start_loading()

    def _document_split(self):
        if self.file_path is None:
            return
        if self.model.file_path.endswith(".pdf"):
            doc = PDFSplitAgent(pdf_path=self.model.file_path)
        else:
            raise ValueError("The file type is not supported")
        for document in doc.split_agent_pdf():
            yield document

    def _start_loading(self):
        if self.model.file_path is not None:
            self.vector_db.from_documents(
                self.docs,
                self.embeddings,
            )

    def delete_filed(self, id, expr):
        # 通过id或者布尔表达式删除字段，暂时未测试
        self.vector_db.delete(id, expr)

    def upsert(self, id, doc):
        # 更新数据，暂时未测试
        self.vector_db.upsert(id, doc)

    def similarity_search(self, query):
        docs = self.vector_db.similarity_search(query)
        return docs


if __name__ == '__main__':
    em_model_path = "/home/ke/person/models/bge-large-zh-v1.5"
    file_path = "./data/浙大城市学院财务报销办事指南.pdf"
    config = MilvusConfig(
        # file_path=file_path,
        embedding_model_path=em_model_path,
        collection_name="LangChainCollection",
    )
    ctr = VectorDatabase(config)

    v = ctr.vector_db.similarity_search("财务报销办事指南")
    for i in v:
        print(i)
    print(v)

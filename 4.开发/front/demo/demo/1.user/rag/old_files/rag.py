# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/3/29 17：51

"""

from fastapi import FastAPI, Depends
from openai import BaseModel
from pydantic import Field

from model import VectorDatabaseConfig, ChatModelSettings, SearchParameters, ChatWithRAGModelConfiguration
from chat_with_rag import CreateChatWithRAG, VectorModel, ChatModel

app = FastAPI()


class ComprehensiveChatWithRAGConfig(BaseModel):
    chat_model: ChatModelSettings = Field(default=ChatModelSettings(), description="聊天模型配置")
    vector_model: VectorDatabaseConfig = Field(default=VectorDatabaseConfig(), description="向量模型配置")
    chat_with_rag_full_config: ChatWithRAGModelConfiguration = Field(default=ChatWithRAGModelConfiguration(),
                                                                     description="完整的ChatWithRAG模型配置")


# use example :
_chat_model_name = "qwen:7b-chat-v1.5-q4_K_M"
_chat_model_config = ChatModelSettings(model_path=_chat_model_name)
_chat_model = ChatModel(model_config=_chat_model_config)
_embedding_model_name = "/home/ke/person/models/bge-large-zh-v1.5"
_vector_db_config = VectorDatabaseConfig(model_path=_embedding_model_name)
_search_type = SearchParameters(search_method="similarity", nearest_neighbors_count=5)
_vector_model = VectorModel(vector_db_config=_vector_db_config, search_type=_search_type)
_rag_config = ChatWithRAGModelConfiguration(chat_model=_chat_model, vector_model=_vector_model)

# 创建并使用 ChatWithRAG 对象
chat_with_rag = CreateChatWithRAG(chat_model=_chat_model, vector_model=_vector_model,
                                  chat_with_rag_config=_rag_config).create_chat_with_rag()


def get_model():
    return chat_with_rag


@app.post("/chat_with_rag")
async def chat_with_rag(question: str, config: ChatWithRAGModelConfiguration = Depends(get_model)):
    response = config.single_chat_with_rag(question)
    return response


@app.post("/have_history_rag")
async def hava_chat_with_rag(question: str, config: ChatWithRAGModelConfiguration = Depends(get_model)):
    response = config.have_history_rag(question)
    return response

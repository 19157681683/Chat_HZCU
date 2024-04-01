# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/3/29 17：51

@description = 用于定义RAG模型的输入参数
"""
from pydantic import BaseModel, Field
from typing import Optional, Dict, List, Any

from pydantic import BaseModel




class ChatModelSettings(BaseModel):
    chat_model_path: str = Field(default="cas/minicpm-3b-openhermes-2.5-v2:latest", description="聊天模型路径")


class SearchParameters(BaseModel):
    search_type: str = Field(default="similarity", description="搜索类型")
    k_nearest: int = Field(default=5, description="最近邻数量")


class ChatWithRAGModelConfiguration(BaseModel):
    search_config: SearchParameters = Field(default=SearchParameters(), description="搜索参数配置")
    vector_db_config: VectorDatabaseConfig = Field(default=VectorDatabaseConfig(), description="向量数据库模型配置")

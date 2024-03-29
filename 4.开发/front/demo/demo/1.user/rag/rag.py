# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/3/29 17：51

"""
from ctr_in_vector_db import CtrINVectorDB
from chat_with_rag import ChatWithRAG
from fastapi import FastAPI, File, UploadFile
from typing import List
from pydantic import BaseModel

app = FastAPI()

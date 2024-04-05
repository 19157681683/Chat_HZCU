# encoding: UTF-8

"""
@author: 李秀奇
@email: lixiuqixiaoke@qq.com
@create_time: 2024/4/5 14:32


"""
from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware
from routers import get_milvus
from routers import memory_retrieval_router

app = FastAPI()

app.include_router(
    memory_retrieval_router,
    dependencies=[Depends(get_milvus)]
)


@app.get("/")
def read_root():
    return {"Hello": "World"}


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware

from routers import memory_retrieval_router
from routers.memory_retrieval_module import get_milvus
from routers.models import MilvusConfig

app = FastAPI()

app.include_router(memory_retrieval_router)


@app.get("/")
def read_root():
    return {"Hello": "World"}


# 允许所有域
origins = ["https://chatglm.cn", "http://localhost", "http://localhost:8080", ]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

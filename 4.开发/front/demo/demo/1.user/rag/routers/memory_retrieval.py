# encoding: UTF-8

"""
@author: 李秀奇
@email: lixiuqixiaoke@qq.com
@create_time: 2024/4/5 14:32


"""
import time

from fastapi import APIRouter, UploadFile, Depends, HTTPException
from langchain_community.vectorstores.milvus import Milvus
from starlette import status

from .chat_retrieval_module import model_factory
from .memory_retrieval_module import save_and_split_pdf
from .serve_module import ChatWithRAG
from .dep import get_milvus

memory_retrieval_router = APIRouter()


@memory_retrieval_router.post("/files_to_vector_store")
async def files_to_vector_store(pdf_file: UploadFile, milvus: Milvus = Depends(get_milvus)):
    try:
        documents = await save_and_split_pdf(pdf_file)
        milvus.from_documents(embedding=milvus.embedding_func, documents=documents)
        return {"filename": pdf_file.filename, "status": "success"}
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=str(e))


@memory_retrieval_router.post("/chat_with_rag")
async def chat_with_rag(question: str, milvus: Milvus = Depends(get_milvus),
                        chat_model: str = Depends(model_factory)):
    if not question:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Question cannot be empty")
    try:
        start_time = time.time()
        chat = ChatWithRAG(chat_model=chat_model, vector_model=milvus)
        response = chat.process_conversational_rag(query=question, session_id="1")
        end_time = time.time()
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=str(e))

    return {"response": response, "time": end_time - start_time}

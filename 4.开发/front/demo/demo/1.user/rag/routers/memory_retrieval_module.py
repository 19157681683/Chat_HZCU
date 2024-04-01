import os
from typing import List
import aiofiles
from fastapi import UploadFile
from langchain_core.documents import Document
from .pdf_split_module import PDFSplitAgent
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Milvus


def get_milvus() -> Milvus:
    return Milvus(
        embedding_function=HuggingFaceEmbeddings(model_name="/home/ke/person/models/bge-large-zh-v1.5"),
    )


async def save_and_split_pdf(file: UploadFile) -> List[Document]:
    # 确保上传文件的目录存在
    upload_directory = os.path.join(".", "data", "other")
    os.makedirs(upload_directory, exist_ok=True)

    saved_path = os.path.join(upload_directory, file.filename)

    async with aiofiles.open(saved_path, 'wb') as f:
        content = await file.read()
        await f.write(content)
    documents = [doc async for doc in PDFSplitAgent(pdf_path=saved_path).split_agent_pdf()]
    return documents

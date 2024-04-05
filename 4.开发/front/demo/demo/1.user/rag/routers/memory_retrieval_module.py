# encoding: UTF-8

"""
@author: 李秀奇
@email: lixiuqixiaoke@qq.com
@create_time: 2024/4/5 14:32


"""
import os
from typing import List
import aiofiles
from fastapi import UploadFile
from langchain_core.documents import Document
from .pdf_split_module import PDFSplitAgent
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Milvus



async def save_and_split_pdf(file: UploadFile) -> List[Document]:
    upload_directory = os.path.join(".", "data", "other")
    os.makedirs(upload_directory, exist_ok=True)

    saved_path = os.path.join(upload_directory, file.filename)

    async with aiofiles.open(saved_path, 'wb') as f:
        content = await file.read()
        await f.write(content)
    documents = [doc async for doc in PDFSplitAgent(pdf_path=saved_path).split_agent_pdf()]
    return documents

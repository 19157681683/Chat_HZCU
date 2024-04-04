# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/4/4 17：51
"""
import asyncio
from typing import Dict, Any, Union, Optional
from typing import List

from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse
from pydantic import BaseModel

from chat_model_module import QwenChat
from models import ChatConfig


class Message(BaseModel):
    role: str
    content: str


app = FastAPI()

chat_model = QwenChat(
    model_name_or_path="/home/ke/person/models/ollama/llm/llama.cpp/models/Qwen1.5-MoE-A2.7B-Chat",
    quantize=True,
)
queue = asyncio.Queue(maxsize=1)


@app.post("/stream_chat")
async def stream_chat(messages: List[Message], config: Optional[ChatConfig] = None):
    if config is None:
        config = ChatConfig()
    config = config.dict()
    response_generator = chat_model.create([message.dict() for message in messages], config, stream=True)
    return StreamingResponse(response_generator)


@app.post("/chat")
async def chat(messages: List[Message], config: Optional[ChatConfig] = None):
    if config is None:
        config = ChatConfig()
    config = config.dict()
    response = chat_model.create([message.dict() for message in messages], config, stream=False)
    return response


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# if __name__ == "__main__":
#     import uvicorn
#     uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)

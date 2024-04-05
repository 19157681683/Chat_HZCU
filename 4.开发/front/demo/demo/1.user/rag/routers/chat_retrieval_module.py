# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/4/4 17：51
"""
import json
from typing import List, AsyncIterator
from typing import Optional, Any, Iterator

from langchain_community.adapters.openai import convert_message_to_dict
from langchain_community.chat_models.ollama import ChatOllama
from langchain_core.callbacks import CallbackManagerForLLMRun, AsyncCallbackManagerForLLMRun
from langchain_core.language_models import BaseChatModel
from langchain_core.messages import BaseMessage, AIMessageChunk, AIMessage
from langchain_core.outputs import ChatGenerationChunk, ChatGeneration
from langchain_core.outputs import ChatResult
from langchain_core.runnables import run_in_executor
from requests import request


def get_ollama():
    return ChatOllama(model="cas/minicpm-3b-openhermes-2.5-v2:latest")


def get_baichuan():
    return BaichuanChat()


def model_factory(model_name: str = "Baichuan"):
    if model_name == "Baichuan":
        return get_baichuan()
    elif model_name == "Ollama":
        return get_ollama()
    else:
        raise ValueError(f"Unknown model name: {model_name}")


class BaichuanChat(BaseChatModel):

    @property
    def _llm_type(self) -> str:
        return "Baichuan"

    def _gen(self, messages: list) -> str:
        url = "http://127.0.0.1:8000/chat"
        response = request("POST", url, json={"messages": messages})
        content = response.content.decode('utf-8')
        return content

    def _gen_stream(self, messages: list) -> Iterator[str]:
        url = "http://127.0.0.1:8000/stream_chat"
        response = request("POST", url, json={"messages": messages}, stream=True)
        for chunk in response.iter_content(chunk_size=1024):
            if chunk:
                yield chunk.decode('utf-8')

    def _generate(self, messages: List[BaseMessage], stop: Optional[List[str]] = None,
                  run_manager: Optional[CallbackManagerForLLMRun] = None, **kwargs: Any) -> ChatResult:
        messages = [convert_message_to_dict(m) for m in messages]
        response = self._gen(messages)
        message = AIMessage(content=response)
        generation = ChatGeneration(message=message)
        return ChatResult(generations=[generation])

    def _stream(
            self,
            messages: List[BaseMessage],
            stop: Optional[List[str]] = None,
            run_manager: Optional[CallbackManagerForLLMRun] = None,
            **kwargs: Any,
    ) -> Iterator[ChatGenerationChunk]:
        messages = [convert_message_to_dict(m) for m in messages]
        tokens = self._gen_stream(messages)

        for token in tokens:
            chunk = ChatGenerationChunk(message=AIMessageChunk(content=token))

            if run_manager:
                run_manager.on_llm_new_token(token, chunk=chunk)

            yield chunk

    async def _astream(
            self,
            messages: List[BaseMessage],
            stop: Optional[List[str]] = None,
            run_manager: Optional[AsyncCallbackManagerForLLMRun] = None,
            **kwargs: Any,
    ) -> AsyncIterator[ChatGenerationChunk]:
        result = await run_in_executor(
            None,
            self._stream,
            messages,
            stop=stop,
            run_manager=run_manager.get_sync() if run_manager else None,
            **kwargs,
        )
        for chunk in result:
            yield chunk


if __name__ == '__main__':
    chat_model = BaichuanChat()
    response = chat_model.invoke("你好呀")

    print(response)
    stream_response = chat_model.stream("你好呀")
    for chunk in stream_response:
        print(chunk)

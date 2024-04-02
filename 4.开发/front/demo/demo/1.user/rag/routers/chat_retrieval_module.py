from typing import List, Optional, Any, Iterator, Literal

from langchain_community.chat_models.ollama import ChatOllama
from langchain_core.callbacks import CallbackManagerForLLMRun
from langchain_core.language_models import BaseChatModel
from langchain_core.messages import BaseMessage
from langchain_core.outputs import ChatResult, ChatGenerationChunk, ChatGeneration


def get_ollama():
    return ChatOllama(model="openchat:7b-v3.5-0106")


class BaichuanChat(BaseChatModel):
    @property
    def _llm_type(self) -> str:
        return "baichuan"

    def _generate(self, messages: List[BaseMessage], stop: Optional[List[str]] = None,
                  run_manager: Optional[CallbackManagerForLLMRun] = None, **kwargs: Any) -> ChatResult:
        pass

    # from typing import List, Optional
    #
    # from langchain_core.outputs.chat_generation import ChatGeneration
    # from langchain_core.pydantic_v1 import BaseModel
    #
    # class ChatResult(BaseModel):
    #     """Class that contains all results for a single chat model call."""
    #
    #     generations: List[ChatGeneration]
    #     """List of the chat generations. This is a List because an input can have multiple
    #         candidate generations.
    #     """
    #     llm_output: Optional[dict] = None
    #     """For arbitrary LLM provider specific output."""

    def _stream(
            self,
            messages: List[BaseMessage],
            stop: Optional[List[str]] = None,
            run_manager: Optional[CallbackManagerForLLMRun] = None,
            **kwargs: Any,
    ) -> Iterator[ChatGenerationChunk]:
        pass

# class ChatGenerationChunk(ChatGeneration):
#     """ChatGeneration chunk, which can be concatenated with other
#       ChatGeneration chunks.
#
#     Attributes:
#         message: The message chunk output by the chat model.
#     """
#
#     message: BaseMessageChunk
#     # Override type to be ChatGeneration, ignore mypy error as this is intentional
#     type: Literal["ChatGenerationChunk"] = "ChatGenerationChunk"  # type: ignore[assignment] # noqa: E501
#     """Type is used exclusively for serialization purposes."""
#
#     @classmethod
#     def get_lc_namespace(cls) -> List[str]:
#         """Get the namespace of the langchain object."""
#         return ["langchain", "schema", "output"]
#
#     def __add__(self, other: ChatGenerationChunk) -> ChatGenerationChunk:
#         if isinstance(other, ChatGenerationChunk):
#             generation_info = merge_dicts(
#                 self.generation_info or {},
#                 other.generation_info or {},
#             )
#             return ChatGenerationChunk(
#                 message=self.message + other.message,
#                 generation_info=generation_info or None,
#             )
#         else:
#             raise TypeError(
#                 f"unsupported operand type(s) for +: '{type(self)}' and '{type(other)}'"
#             )

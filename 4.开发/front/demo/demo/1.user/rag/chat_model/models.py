# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/4/4 17：51
"""
from pydantic import BaseModel, Field


class ChatConfig(BaseModel):
    temperature: float = Field(0.7, description="温度")
    top_p: float = Field(0.8, description="top_p")
    top_k: int = Field(1, description="top_k")
    max_new_tokens: int = Field(8192, description="最大长度")
    do_sample: bool = Field(True, description="是否采样")
    repetition_penalty: float = Field(1.1, description="重复惩罚")
    num_return_sequences: int = Field(1, description="返回序列数量")
    use_cache: bool = Field(True, description="是否使用缓存")

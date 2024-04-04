# encoding: UTF-8
"""

@author = 李秀奇
@email = lixiuqixiaoke@qq.com
@create_time = 2024/4/4 17：51
"""
import copy
import warnings
from threading import Thread
from typing import List, Optional
from models import ChatConfig
import torch
from langchain_community.chat_models.ollama import ChatOllama
from transformers import (
    BitsAndBytesConfig,
    AutoModelForCausalLM,
    AutoTokenizer,
    TextIteratorStreamer,
)


class QwenChat:
    def __init__(self, model_name_or_path: str, quantize: bool = False):
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        self.model = self.initialize_model(model_name_or_path, quantize)
        self.tokenizer = AutoTokenizer.from_pretrained(model_name_or_path, trust_remote_code=True)

    def initialize_model(self, model_name_or_path: str, quantize: bool) -> AutoModelForCausalLM:
        if quantize:
            quantization_config = BitsAndBytesConfig(
                load_in_4bit=quantize, bnb_4bit_compute_dtype=torch.float32
            )
            model = AutoModelForCausalLM.from_pretrained(
                model_name_or_path,
                torch_dtype=torch.float32,
                device_map=self.device.type,
                trust_remote_code=True,
                quantization_config=quantization_config,
            ).eval()
        else:
            model = AutoModelForCausalLM.from_pretrained(
                model_name_or_path,
                torch_dtype=torch.float16,
                device_map=self.device.type,
                trust_remote_code=True,
            ).eval()
        return model

    def prepare_model_inputs(self, messages: List[dict]) -> torch.Tensor:
        text = self.tokenizer.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)
        model_inputs = self.tokenizer([text], return_tensors="pt").to(self.device)
        return model_inputs

    def _generate_response(self, messages: List[dict], generation_kwargs: Optional[dict] = None):
        model_inputs = self.prepare_model_inputs(messages)
        generated_ids = self.model.generate(model_inputs.input_ids, **generation_kwargs)
        generated_ids = [output_ids[len(input_ids):] for input_ids, output_ids in
                         zip(model_inputs.input_ids, generated_ids)]
        decoded_responses = self.tokenizer.batch_decode(generated_ids, skip_special_tokens=True)
        return decoded_responses[0].strip("<|im_end|>")

    def _generate_response_stream(self, messages: List[dict], generation_kwargs: Optional[dict] = None):
        model_inputs = self.prepare_model_inputs(messages)
        streamer = TextIteratorStreamer(self.tokenizer, skip_prompt=True, skip_special_tokens=True)

        generation_kwargs = dict(input_ids=model_inputs.input_ids, streamer=streamer, **generation_kwargs)
        thread = Thread(target=self.model.generate, kwargs=generation_kwargs)
        thread.start()
        for new_text in streamer:
            yield new_text.strip("<|im_end|>")
        thread.join()

    def create(self, messages: List[dict], generation_config: ChatConfig, stream: bool = False):
        # if not any(message.get('role') == 'system' for message in messages):
        #     messages.insert(0, {"role": "system", "content": "你是一个无害的人工智能助手"})
        # print(messages)
        # print(dict(generation_config))
        try:
            if stream:
                _response_ = self._generate_response_stream(messages, dict(generation_config))
                return _response_
            else:
                _response_ = self._generate_response(messages, dict(generation_config))
                print(messages)
                print(_response_)
                return _response_
        except Exception as e:
            print(e)
            return ""
        finally:
            torch.cuda.empty_cache()


if __name__ == "__main__":
    generator = QwenChat(
        model_name_or_path="/home/ke/person/models/ollama/llm/llama.cpp/models/Baichuan2-7B-Chat",
        quantize=True,
    )
    prompt = "你好呀！"
    system_message = "你是一个无害的机器人。"
    messages = [{"role": "system", "content": system_message}, {"role": "user", "content": prompt}]
    config = ChatConfig(
        temperature=0.7,
        top_p=0.8,
        max_new_tokens=2048,
        do_sample=True,
        repetition_penalty=1.1,
        num_return_sequences=1,
    )
    response = generator.create(messages, config)
    print(response)
    print("___________________")

    stream_response = generator.create(messages, config, stream=True)
    for stream_response in stream_response:
        print(stream_response, end="")

本目录下主要负责RAG开发部分，具体内容包含文档分割，本地模型推理，向量数据库存储、检索。
在开始之前请注意安装好Milvus向量数据库以及Ollama的配置，Milvus默认的开启的端口是127.0.0.1:19530，Ollama需要配置好，否则不能启动。

具体安装步骤请参照milvus官方安装步骤：https://milvus.io/docs/install_standalone-docker.md

目前已经基于fastapi搭建了基本的RAG流程，启动后可以在对应启动的端口发送请求，可以获得测试结果，基于本人本地环境也做了一些基本的测试，测试结果在data目录下的test_data内。

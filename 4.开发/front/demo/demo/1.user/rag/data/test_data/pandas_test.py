import pandas as pd
import requests
import time

count = 0


def test(question):
    global count
    count += 1
    print(f"Test {count}: {question}")
    url = "http://127.0.0.1:8001/chat_with_rag"
    params = {"question": question, "model_name": "Ollama"}
    headers = {"accept": "application/json"}
    response = requests.post(url, params=params, headers=headers)
    print(response.json()["response"])
    print("* " * 50)
    time.sleep(1)
    return response.json()["response"]


def process_file(file_path):
    data = pd.read_excel(file_path)

    data["RAG答案"] = data["RAG答案"].astype(str)

    for index in range(len(data)):
        question = data["问题"][index]
        data.at[index, "RAG答案"] = test(question)

    data.to_excel(file_path, index=False)
    print(f"Processed {file_path}")
    print("* " * 50)
    print(data)


file_paths = ["./报销测试集-粗粒度.xlsx", "./报销测试集-细粒度.xlsx"]
for file_path in file_paths:
    process_file(file_path)

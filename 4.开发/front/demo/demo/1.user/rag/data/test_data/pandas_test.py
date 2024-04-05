import pandas as pd

# 假设这是test函数的实现，您需要替换为实际的函数体
def test(question):

    return "这是测试答案"

data = pd.read_excel("./报销测试集-粗粒度.xlsx")

for index in range(len(data)):
    question = data["问题"][index]
    data.at[index, "RAG答案"] = test(question)

data.to_excel("./报销测试集-粗粒度.xlsx", index=False)

data.to_excel("./新的报销测试集-粗粒度.xlsx", index=False)

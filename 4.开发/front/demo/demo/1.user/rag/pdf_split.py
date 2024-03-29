from typing import Tuple, Generator, Dict, Any
from langchain.docstore.document import Document
from langchain_text_splitters import CharacterTextSplitter
from langchain_community.document_loaders import PyMuPDFLoader


def data_load(pdf_path):
    loader = PyMuPDFLoader(pdf_path)
    documents = loader.load()
    return documents


class TextSplit:
    def __init__(self, data: Document):
        self.data = data
        self.page_content = data.page_content
        self.metadata = data.metadata

    def __len__(self):
        return len(self.page_content)

    def start_split_text(self, chunk_size: int, chunk_overlap: int) -> Generator[str, None, None]:
        if len(self.page_content) > chunk_size:
            documents = CharacterTextSplitter(
                separator="\n",
                is_separator_regex=True,
                chunk_size=chunk_size,
                chunk_overlap=chunk_overlap,
                length_function=len,
                keep_separator=True,
            ).create_documents([self.page_content], [self.metadata])
            for doc in documents:
                if chunk_size > chunk_overlap > 20 and chunk_size > 240:
                    chunk_size = len(doc.page_content) // 2 if len(doc.page_content) // 2 > 800 else 540
                    chunk_overlap = len(doc.page_content) // 6 if len(doc.page_content) // 6 > 200 else 100
                else:
                    chunk_size = max(chunk_size + 100, 300)
                    chunk_overlap = max(chunk_overlap + 40, 60)
                yield from TextSplit(doc).start_split_text(chunk_size, chunk_overlap)


        else:
            yield self.data


class PDFSplitAgent:
    def __init__(self, pdf_path: str, chunk_size: int = 960, chunk_overlap: int = 100):
        self.pdf_path = pdf_path
        self.chunk_size = chunk_size
        self.chunk_overlap = chunk_overlap
        self.documents = data_load(self.pdf_path)

    def split_agent_pdf(self):
        for document in self.documents:
            small_document = TextSplit(document)
            for tiny_document in small_document.start_split_text(self.chunk_size, self.chunk_overlap):
                yield tiny_document


if __name__ == '__main__':
    P = PDFSplitAgent(
        pdf_path="/home/ke/pythonProject/Chat_HZCU/4.开发/front/demo/demo/1.user/rag/data/浙大城市学院财务报销办事指南.pdf")
    for i in P.split_agent_pdf():
        print(i.page_content)

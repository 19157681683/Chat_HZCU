from typing import Optional, List, Dict, Any

from pydantic import BaseModel, Field


class MilvusConfig(BaseModel):
    embedding_model_path: str = Field("/home/ke/person/models/bge-large-zh-v1.5", description="嵌入模型路径")
    host: str = Field("127.0.0.1", description="主机地址")
    port: str = Field("19530", description="端口号")
    collection_name: Optional[str] = Field("LangChainCollection", description="Milvus集合名称")
    file_path: Optional[str] = Field(None, description="文件路径")
    collection_description: Optional[str] = Field(None, description="集合描述")
    collection_properties: Optional[Dict[str, Any]] = Field(None, description="集合属性")
    consistency_level: str = Field("Session", description="一致性级别")
    index_params: Optional[Dict] = Field(None, description="索引参数")
    search_params: Optional[Dict] = Field(None, description="搜索参数")
    drop_old: Optional[bool] = Field(False, description="是否删除当前集合")
    auto_id: bool = Field(True, description="是否启用主键自动ID")
    primary_field: str = Field("pk", description="主键字段名称")
    text_field: str = Field("text", description="文本字段名称")
    vector_field: str = Field("vector", description="向量字段名称")
    metadata_field: Optional[str] = Field(None, description="元数据字段名称")
    partition_key_field: Optional[str] = Field(None, description="分区键字段名称")
    partition_names: Optional[List[str]] = Field(None, description="分区名称列表")
    replica_number: int = Field(1, description="副本数量")
    timeout: Optional[float] = Field(10, description="超时时间")



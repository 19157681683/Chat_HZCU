package com.springboot.c4_domain.result;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/8 12:42
 * @Description:
 */
@ApiModel("API返回的数据结构 基本信息")
@Data
//@NoArgsConstructor
@AllArgsConstructor
public class CommonResults<T>{

    @ApiModelProperty(name="status",value = "【中文】:状态码\n【意思】:表示网页服务器超文本传输协议响应状态的3位数字代码\n【范围】:(1xx:信息)(2xx:成功)(3xx:重定向)(4xx:客户端请求错误)(5xx:服务器错误)\n",example = "200",position = 1)
    private Integer status;

    @ApiModelProperty(name="message",value = "【中文】:信息\n【意思】:对应状态码的业务说明\n【范围】:\n",example = "2022ACM实验室新生训练营",position = 2)
    private String message;

    @ApiModelProperty(name="data",value = "【中文】:数据\n【意思】:API对应需要的数据\n【范围】:\n",example = "",position = 3)
    private T data;

    public CommonResults() {
    }

    public CommonResults(Integer status,String message){
        this(status,message,null);
    }
}



package com.springboot.c4_domain.dto;

import lombok.Data;
import org.springframework.stereotype.Repository;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 4:21
 * @Description:
 */

@Data
@Repository
public class AdminChatDTO {

    private int adminId;

    private String content;
}



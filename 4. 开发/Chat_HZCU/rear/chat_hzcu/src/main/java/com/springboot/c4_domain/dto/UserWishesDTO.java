package com.springboot.c4_domain.dto;

import lombok.Data;
import org.springframework.stereotype.Repository;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/9 21:06
 * @Description:
 */

@Data
@Repository
public class UserWishesDTO {

    private Integer userId;

    private String content;
}



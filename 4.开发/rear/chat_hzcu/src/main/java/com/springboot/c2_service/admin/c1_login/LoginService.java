package com.springboot.c2_service.admin.c1_login;
/*

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/10 1:40

*/

import com.springboot.c4_domain.result.CommonResults;

public interface LoginService {

    // 1. 登录
    public CommonResults login(String phoneNumber, String verificationCode, String password);

    // 2. 注册
    public CommonResults register(String phoneNumber, String verificationCode, String password);

    // 3. 忘记密码
    public CommonResults reset_password(String phoneNumber, String verificationCode, String password);
}

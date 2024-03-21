package com.springboot.c2_service.admin.c4_management_users;
/*

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/10 4:34

*/

import com.springboot.c4_domain.entity.User;
import com.springboot.c4_domain.result.CommonResults;

public interface ManagementUserService {

    // 1. 查询用户（分页）
    public CommonResults findUsers(int pageNumber, int pageSize);

    // 2. 新增用户
    public CommonResults addUser(String phoneNumber, String password);

    // 3. 更改用户信息
    public CommonResults updateUser(User user);

    // 4. 删除用户
    public CommonResults deleteUser(int userId);
}

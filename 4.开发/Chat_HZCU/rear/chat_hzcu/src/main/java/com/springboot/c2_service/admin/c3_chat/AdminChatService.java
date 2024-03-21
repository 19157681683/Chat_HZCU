package com.springboot.c2_service.admin.c3_chat;
/*

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/10 3:46

*/

import com.springboot.c4_domain.result.CommonResults;

public interface AdminChatService {

    // 1. 查管理员的聊天记录（时间倒序/分页）
    public CommonResults findAdminChats(int adminId, int pageNumber, int pageSize);

    // 2. 查单条聊天记录（聊天记录ID）
    public CommonResults findAdminChat(int adminChatId);

    // 3. 增加聊天记录
    public CommonResults addAdminChat(int adminId, String content);

    // 4. 更改聊天记录
    public CommonResults updateAdminChat(int adminChatId, String content);
}

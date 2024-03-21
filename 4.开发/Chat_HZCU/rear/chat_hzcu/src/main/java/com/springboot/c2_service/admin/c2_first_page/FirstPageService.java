package com.springboot.c2_service.admin.c2_first_page;
/*

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/10 2:15

*/

import com.springboot.c4_domain.result.CommonResults;

public interface FirstPageService {

    // 1. 查找7天每天登录人数
    public CommonResults find7DayLoginPeople();

    // 2. 查找管理员信息
    public CommonResults findCurrentAdmin(int adminId);

    // 3. 查找用户聊天记录Top10活跃问题
    public CommonResults findTop10Chat();

    // 4. 查询最近7天每天用户聊天总次数
    public CommonResults find7DayChatNumbers();

    // 5. 查询吐槽榜（点赞数倒序/分页）
    public CommonResults findRoasts();

    // 6. 查询我想榜（点赞数倒序/分页）
    public CommonResults findWishes();
}

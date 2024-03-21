package com.springboot.c2_service.user.chat;
/*

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/8 16:20

*/

import com.springboot.c4_domain.entity.Roast;
import com.springboot.c4_domain.entity.Wish;
import com.springboot.c4_domain.result.CommonResults;


public interface UserChatService {

    // 1. 聊天记录
    // 1.1 查用户聊天记录（时间倒序/分页）
    public CommonResults findUserChats(int userId, int pageNumber, int pageSize);
    // 1.2 查聊天记录（聊天记录ID）
    public CommonResults findUserChat(int userChatId);
    // 1.3 添加聊天记录
    public CommonResults addUserChat(int userId, String content);
    // 1.4 更改聊天记录
    public CommonResults updateUserChat(int userChatId, String content);


    // 2. 吐槽榜
    // 2.1 查吐槽（点赞数倒序/分页）
    public CommonResults findRoasts(int pageNumber, int pageSize);
    // 2.2 添加吐槽
    public CommonResults addRoast(int userId, String content);
    // 2.3 修改吐槽
    public CommonResults updateRoast(Roast roast);

    // 3. 我想榜
    // 3.1 查找我想（点赞数倒序/分页）
    public CommonResults findWishes(int pageNumber, int pageSize);
    // 3.2 添加我想
    public CommonResults addWish(int userId, String content);
    // 3.3 修改我想
    public CommonResults updateWish(Wish wish);

    // 4. 吐槽榜-评论
    // 4.1 查吐槽评论（时间倒序/分页）
    public CommonResults findRoastsComments(int roastId, int pageNumber, int pageSize);
    // 4.2 添加吐槽榜-评论
    public CommonResults addRoastComment(int userId, int roastId, String content);

    // 5. 我想榜-评论
    // 5.1 查我想榜评论（时间倒序/分页）
    public CommonResults findWishesComments(int wishId, int pageNumber, int pageSize);
    // 5.2 添加我想榜-评论
    public CommonResults addWishComment(int userId, int wish_id, String content);
}

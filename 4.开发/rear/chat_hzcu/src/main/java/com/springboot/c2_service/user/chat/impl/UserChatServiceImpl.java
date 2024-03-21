package com.springboot.c2_service.user.chat.impl;


import com.springboot.c2_service.user.chat.UserChatService;
import com.springboot.c3_dao.*;
import com.springboot.c4_domain.entity.*;
import com.springboot.c4_domain.result.CommonResults;
import com.springboot.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/8 16:20
 * @Description:
 */

@Service
public class UserChatServiceImpl implements UserChatService {

    @Autowired
    private UserChatMapper userChatMapper;

    @Autowired
    private UserChatRelationMapper userChatRelationMapper;

    @Autowired
    private RoastMapper roastMapper;

    @Autowired
    private UserRoastMapper userRoastMapper;

    @Autowired
    private WishMapper wishMapper;

    @Autowired
    private UserWishMapper userWishMapper;

    @Autowired
    private RoastCommentMapper roastCommentMapper;

    @Autowired
    private UserRoastCommentMapper userRoastCommentMapper;

    @Autowired
    private WishCommentMapper wishCommentMapper;

    @Autowired
    private UserWishCommentMapper userWishCommentMapper;


    @Override
    public CommonResults findUserChats(int userId, int pageNumber, int pageSize) {
        List<UserChat> userChatList = new LinkedList<>();
        UserChatRelationExample userChatRelationExample = new UserChatRelationExample();
        userChatRelationExample.createCriteria().andUserIdEqualTo(userId);
        // 按照时间倒序
        userChatRelationExample.setOrderByClause("user_chat_relation_id DESC");
        // 在用户-聊天记录表中，根据用户ID获取聊天记录ID
        List<UserChatRelation> userChatRelations = userChatRelationMapper.selectByExample(userChatRelationExample);
        // 在聊天记录表中，根据聊天记录ID获取聊天记录
        if(userChatRelations!=null){
            for (int i = 0; i < userChatRelations.size(); i++) {
                UserChatRelation userChatRelation = userChatRelations.get(i);
                UserChat userChat = userChatMapper.selectByPrimaryKey(userChatRelation.getUserChatId());
                userChatList.add(userChat);
            }
        }
        // 获取对应的分页记录
        userChatList = PageUtil.getPageData(userChatList, pageNumber, pageSize);
        return new CommonResults(200, "查询成功", userChatList);
    }
    @Override
    public CommonResults findUserChat(int userChatId) {
        UserChat userChat = userChatMapper.selectByPrimaryKey(userChatId);
        return new CommonResults(200,"查询成功",userChat);
    }
    @Override
    public CommonResults addUserChat(int userId, String content) {
        // 在用户的聊天记录表中，插入新聊天记录，获取自增的ID。失败返回 “聊天记录表插入失败”
        UserChat userChat = new UserChat();
        userChat.setContent(content);
        userChat.setTime(new Date());
        int rows = userChatMapper.insert(userChat);         //insert()返回自增的ID，insertSelective()返回影响的行数
        Integer userChatId = userChat.getUserChatId();
        if(rows == 0){
            return new CommonResults(200, "添加失败","插入聊天记录失败");
        } else{
            // 在用户-聊天记录表中，插入含聊天记录ID，用户ID的记录。失败返回 “用户-聊天记录表插入失败”，成功返回“用户-聊天记录添加成功”
            UserChatRelation userChatRelation = new UserChatRelation(userId, userChatId);
            rows = userChatRelationMapper.insertSelective(userChatRelation);

            if(rows == 0){
                return new CommonResults(200,"添加失败","插入用户-聊天记录失败");
            }else {
                return new CommonResults(200,"添加成功","插入用户-聊天记录成功");
            }
        }
    }
    @Override
    public CommonResults updateUserChat(int userChatId, String content) {
        //1. SQL：根据聊天ID，获取聊天记录。失败返回 “聊天记录不存在”
        UserChat userChat = userChatMapper.selectByPrimaryKey(userChatId);
        if(userChat == null){
            return new CommonResults(200,"更新失败","聊天记录不存在");
        }
        else{
            //2. SQL：在用户的聊天记录表中，向聊天记录添加新内容，更新聊天记录。失败返回 “用户的聊天记录更新失败“，成功返回 ”用户的聊天记录更新成功“
            userChat.setContent(content);
            int rows = userChatMapper.updateByPrimaryKeySelective(userChat);
            if(rows == 0){
                return new CommonResults(200,"更新失败","用户的聊天记录更新失败");
            }else{
                return new CommonResults(200,"更新成功","用户的聊天记录更新成功");
            }
        }
    }



    @Override
    public CommonResults findRoasts(int pageNumber, int pageSize) {
        //SQL：点赞数倒序，分页
        RoastExample roastExample = new RoastExample();
        roastExample.createCriteria().andIsDeletedEqualTo(0);
        roastExample.setOrderByClause("applause_number DESC");
        List<Roast> roastsList = roastMapper.selectByExampleWithBLOBs(roastExample);
        if(roastsList == null || roastsList.isEmpty()){
            return new CommonResults(200,"查询失败","");
        }else{
            roastsList = PageUtil.getPageData(roastsList, pageNumber, pageSize);
            return new CommonResults(200,"查询成功",roastsList);
        }
    }
    @Override
    public CommonResults addRoast(int userId, String content) {
        //1. SQL：在吐槽表中，添加吐槽内容的记录，获取吐槽ID。失败返回 “添加吐槽内容失败”
        Roast roast = new Roast(new Date(),0,content);
        int rows = roastMapper.insert(roast);
        if(rows == 0 ){
            return new CommonResults<>(200, "添加失败", "添加吐槽内容失败");
        }else {
            //2. SQL：在用户-吐槽表中，添加吐槽ID和用户ID的记录。失败返回 “添加用户-吐槽记录失败”，成功返回 “添加用户-吐槽记录成功”
            UserRoast userRoast = new UserRoast(userId, roast.getRoastId());
            rows = userRoastMapper.insert(userRoast);
            if(rows == 0){
                return new CommonResults(200 ,"添加失败","添加用户-吐槽记录失败");
            }else{
                return new CommonResults(200 ,"添加成功","添加用户-吐槽记录成功");
            }
        }
    }
    @Override
    public CommonResults updateRoast(Roast roast) {
        //SQL：在吐槽表中更新记录。失败，返回 “更新吐槽表记录失败”；成功返回 “更新吐槽表记录成功”
        int rows = roastMapper.updateByPrimaryKeySelective(roast);
        if(rows == 0){
            return new CommonResults(200,"更新失败", "更新吐槽表记录失败");
        }else{
            return new CommonResults(200,"更新成功","更新吐槽表记录成功");
        }
    }



    @Override
    public CommonResults findWishes(int pageNumber, int pageSize) {
        //SQL：点赞数倒序，分页
        WishExample wishExample = new WishExample();
        wishExample.createCriteria().andIsDeletedEqualTo(0);
        wishExample.setOrderByClause("applause_number DESC");
        List<Wish> wishList = wishMapper.selectByExampleWithBLOBs(wishExample);
        if(wishList == null){
            return new CommonResults(200, "查询失败","查询我想失败");
        }else{
            wishList = PageUtil.getPageData(wishList, pageNumber, pageSize);
            return new CommonResults(200,"查询成功",wishList);
        }
    }
    @Override
    public CommonResults addWish(int userId, String content) {
        //1. SQL：在我想表中，添加我想内容的记录，获取我想ID。失败返回 “添加我想内容失败”
        Wish wish = new Wish(new Date(),0,content);
        wish.setContent(content);
        int rows = wishMapper.insert(wish);
        if(rows == 0 ){
            return new CommonResults<>(200, "添加失败", "添加我想内容失败");
        }else {
            //2. SQL：在用户-我想表中，添加我想ID和用户ID的记录。失败返回 “添加用户-我想记录失败”，成功返回 “添加用户-我想记录成功”
            UserWish userWish = new UserWish(userId, wish.getWishId());
            rows = userWishMapper.insert(userWish);
            if(rows == 0){
                return new CommonResults(200 ,"添加失败","添加用户-我想记录失败");
            }else{
                return new CommonResults(200 ,"添加成功","添加用户-我想记录成功");
            }
        }
    }
    @Override
    public CommonResults updateWish(Wish wish) {
        //SQL：在我想表中更新记录。失败，返回 “更新我想表记录失败”；成功返回 “更新我想表记录成功”
        int rows = wishMapper.updateByPrimaryKeySelective(wish);
        if(rows == 0){
            return new CommonResults(200,"更新失败", "更新我想表记录失败");
        }else{
            return new CommonResults(200,"更新成功","更新我想表记录成功");
        }
    }



    @Override
    public CommonResults findRoastsComments(int roastId, int pageNumber, int pageSize) {
        //时间倒序
        UserRoastCommentExample userRoastCommentExample = new UserRoastCommentExample();
        userRoastCommentExample.createCriteria().andRoastIdEqualTo(roastId);
        userRoastCommentExample.setOrderByClause("user_roast_comment_id DESC");
        //1.SQL：在吐槽-评论表中，根据吐槽ID获取评论ID列表。
        List<UserRoastComment> userRoastCommentsList = userRoastCommentMapper.selectByExample(userRoastCommentExample);
        if(userRoastCommentsList == null || userRoastCommentsList.isEmpty()){
            return new CommonResults(200,"查询失败","吐槽不存在");
        }
        //2.SQL：吐槽的评论表中根据评论ID列表，获取吐槽的评论列表
        List<RoastComment> roastCommentList = new LinkedList<>();
        for (int i = 0; i < userRoastCommentsList.size(); i++) {
            UserRoastComment userRoastComment = userRoastCommentsList.get(i);
            RoastComment roastComment = roastCommentMapper.selectByPrimaryKey(userRoastComment.getCommentId());
            roastCommentList.add(roastComment);
        }
        // 分页
        roastCommentList = PageUtil.getPageData(roastCommentList, pageNumber, pageSize);
        if(roastCommentList == null || roastCommentList.isEmpty()){
            return new CommonResults(200, "查询失败","吐槽评论不存在");
        }else{
            return new CommonResults(200,"查询成功",roastCommentList);
        }
    }
    @Override
    public CommonResults addRoastComment(int userId, int roastId, String content) {
        //1. SQL：在吐槽的评论表中，添加用户的吐槽评论记录，返回吐槽评论ID。失败返回 “新增吐槽榜-评论表记录失败”
        RoastComment roastComment = new RoastComment(new Date(), content);
        int rows = roastCommentMapper.insert(roastComment);
        if(rows == 0){
            return new CommonResults(200, "添加失败","新增吐槽榜-评论表记录失败");
        }
        //2. SQL：在用户-吐槽-评论表汇总，添加用户ID/吐槽ID/吐槽评论ID的记录。失败返回 “新增用户-吐槽榜-评论表记录失败”,成功返回 “新增用户-吐槽榜-评论表记录成功”
        UserRoastComment userRoastComment = new UserRoastComment(userId, roastId, roastComment.getRoastCommentId());
        rows = userRoastCommentMapper.insert(userRoastComment);
        if(rows == 0){
            return new CommonResults(200, "添加失败","新增用户-吐槽榜-评论表记录失败");
        }else{
            return new CommonResults(200,"添加成功","新增用户-吐槽榜-评论表记录成功");
        }
    }



    @Override
    public CommonResults findWishesComments(int wishId, int pageNumber, int pageSize) {
        //时间倒序
        UserWishCommentExample userWishCommentExample = new UserWishCommentExample();
        userWishCommentExample.createCriteria().andWishIdEqualTo(wishId);
        userWishCommentExample.setOrderByClause("user_wish_comment_id DESC");
        //1.SQL：在我想-我想表中，根据我想ID获取我想ID列表。
        List<UserWishComment> userWishCommentsList = userWishCommentMapper.selectByExample(userWishCommentExample);
        if(userWishCommentsList == null || userWishCommentsList.isEmpty()){
            return new CommonResults(200,"查询失败","我想不存在");
        }
        //2.SQL：我想的我想表中根据我想ID列表，获取我想的我想列表
        List<WishComment> wishCommentList = new LinkedList<>();
        for (int i = 0; i < userWishCommentsList.size(); i++) {
            UserWishComment userWishComment = userWishCommentsList.get(i);
            WishComment wishComment = wishCommentMapper.selectByPrimaryKey(userWishComment.getCommentId());
            wishCommentList.add(wishComment);
        }
        // 分页
        wishCommentList = PageUtil.getPageData(wishCommentList, pageNumber, pageSize);
        if(wishCommentList == null || wishCommentList.isEmpty()){
            return new CommonResults(200, "查询失败","我想我想不存在");
        }else{
            return new CommonResults(200,"查询成功",wishCommentList);
        }
    }
    @Override
    public CommonResults addWishComment(int userId, int wishId, String content) {
        //1. SQL：在我想的评论表中，添加用户的我想评论记录，返回我想评论ID。失败返回 “新增我想榜-评论表记录失败”
        WishComment wishComment = new WishComment(new Date(), content);
        int rows = wishCommentMapper.insert(wishComment);
        if(rows == 0){
            return new CommonResults(200, "添加失败","新增我想榜-评论表记录失败");
        }
        //2. SQL：在用户-我想-评论表汇总，添加用户ID/我想ID/我想评论ID的记录。失败返回 “新增用户-我想榜-评论表记录失败”,成功返回 “新增用户-我想榜-评论表记录成功”
        UserWishComment userWishComment = new UserWishComment(userId, wishId, wishComment.getWishCommentId());
        rows = userWishCommentMapper.insert(userWishComment);
        if(rows == 0){
            return new CommonResults(200, "添加失败","新增用户-我想榜-评论表记录失败");
        }else{
            return new CommonResults(200,"添加成功","新增用户-我想榜-评论表记录成功");
        }
    }
}



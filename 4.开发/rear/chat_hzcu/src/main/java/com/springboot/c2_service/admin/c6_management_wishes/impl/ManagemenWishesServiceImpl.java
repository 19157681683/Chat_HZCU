package com.springboot.c2_service.admin.c6_management_wishes.impl;

import com.springboot.c2_service.admin.c6_management_wishes.ManagementWishesService;
import com.springboot.c3_dao.UserWishCommentMapper;
import com.springboot.c3_dao.UserWishMapper;
import com.springboot.c3_dao.WishCommentMapper;
import com.springboot.c3_dao.WishMapper;
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
 * @create_time = 2024/3/10 5:52
 * @Description:
 */

@Service
public class ManagemenWishesServiceImpl implements ManagementWishesService {

    @Autowired
    private WishMapper wishMapper;

    @Autowired
    private UserWishMapper userWishMapper;

    @Autowired
    private WishCommentMapper wishCommentMapper;

    @Autowired
    private UserWishCommentMapper userWishCommentMapper;

    @Override
    public CommonResults findWishes(int pageNumber, int pageSize) {
        //SQL：点赞数倒序，分页
        WishExample wishExample = new WishExample();
        wishExample.createCriteria().andIsDeletedEqualTo(0);
        wishExample.setOrderByClause("applause_number DESC");
        List<Wish> wishsList = wishMapper.selectByExampleWithBLOBs(wishExample);
        if(wishsList == null || wishsList.isEmpty()){
            return new CommonResults(200,"查询失败","");
        }else{
            wishsList = PageUtil.getPageData(wishsList, pageNumber, pageSize);
            return new CommonResults(200,"查询成功",wishsList);
        }
    }


    @Override
    public CommonResults addWish(int userId, String content) {
        //1. SQL：在我想表中，添加我想内容的记录，获取我想ID。失败返回 “添加我想内容失败”
        Wish wish = new Wish(new Date(),0,content);
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
    public CommonResults deleteWish(int wishId) {
        Wish wish = wishMapper.selectByPrimaryKey(wishId);
        if(wish == null){
            return new CommonResults(200, "删除失败","找不到对应的我想记录");
        }else{
            wish.setIsDeleted(1);
            int rows = wishMapper.updateByPrimaryKeySelective(wish);
            if(rows == 0){
                return new CommonResults(200, "删除失败","删除对应的我想记录失败");
            }else{
                return new CommonResults(200, "删除成功","删除对应的我想记录成功");
            }
        }
    }

    @Override
    public CommonResults findWishComments(int wishId, int pageNumber, int pageSize) {
        //时间倒序
        UserWishCommentExample userWishCommentExample = new UserWishCommentExample();
        userWishCommentExample.createCriteria().andWishIdEqualTo(wishId);
        userWishCommentExample.setOrderByClause("user_wish_comment_id DESC");
        //1.SQL：在我想-评论表中，根据我想ID获取评论ID列表。
        List<UserWishComment> userWishCommentsList = userWishCommentMapper.selectByExample(userWishCommentExample);
        if(userWishCommentsList == null || userWishCommentsList.isEmpty()){
            return new CommonResults(200,"查询失败","我想不存在");
        }
        //2.SQL：我想的评论表中根据评论ID列表，获取我想的评论列表
        List<WishComment> wishCommentList = new LinkedList<>();
        for (int i = 0; i < userWishCommentsList.size(); i++) {
            UserWishComment userWishComment = userWishCommentsList.get(i);
            WishComment wishComment = wishCommentMapper.selectByPrimaryKey(userWishComment.getCommentId());
            wishCommentList.add(wishComment);
        }
        // 分页
        wishCommentList = PageUtil.getPageData(wishCommentList, pageNumber, pageSize);
        if(wishCommentList == null || wishCommentList.isEmpty()){
            return new CommonResults(200, "查询失败","我想评论不存在");
        }else{
            return new CommonResults(200,"查询成功",wishCommentList);
        }
    }

}



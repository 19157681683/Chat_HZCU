package com.springboot.c2_service.admin.c5_management_roasts.impl;

import com.springboot.c2_service.admin.c5_management_roasts.ManagementRoastsService;
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
 * @create_time = 2024/3/10 5:24
 * @Description:
 */
@Service
public class ManagementRoastsServiceImpl implements ManagementRoastsService {

    @Autowired
    private RoastMapper roastMapper;

    @Autowired
    private UserRoastMapper userRoastMapper;

    @Autowired
    private RoastCommentMapper roastCommentMapper;

    @Autowired
    private UserRoastCommentMapper userRoastCommentMapper;

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
    public CommonResults deleteRoast(int roastId) {
        Roast roast = roastMapper.selectByPrimaryKey(roastId);
        if(roast == null){
            return new CommonResults(200, "删除失败","吐槽记录不存在");
        }else{
            roast.setIsDeleted(1);
            int rows = roastMapper.updateByPrimaryKeySelective(roast);
            if(rows == 0){
                return new CommonResults(200 , "删除失败","删除吐槽记录失败");
            }else {
                return new CommonResults(200, "删除成功", "删除吐槽记录成功");
            }
        }
    }

    @Override
    public CommonResults findRoastComments(int roastId, int pageNumber, int pageSize) {
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
}



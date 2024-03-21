package com.springboot.c2_service.admin.c4_management_users.impl;

import com.springboot.c2_service.admin.c4_management_users.ManagementUserService;
import com.springboot.c3_dao.UserMapper;
import com.springboot.c4_domain.entity.User;
import com.springboot.c4_domain.entity.UserExample;
import com.springboot.c4_domain.result.CommonResults;
import com.springboot.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 4:36
 * @Description:
 */
@Service
public class ManagementUserServiceImpl implements ManagementUserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public CommonResults findUsers(int pageNumber, int pageSize) {
        //1. SQL：在用户表中，分页
        UserExample userExample = new UserExample();
        userExample.createCriteria().andIsDeletedEqualTo(0);
        List<User> userList = userMapper.selectByExample(userExample);
        if(userList == null || userList.isEmpty()){
            return new CommonResults(200, "查询失败","查询用户分页失败");
        }
        userList = PageUtil.getPageData(userList, pageNumber, pageSize);
        return new CommonResults<>(200,"查询成功",userList);
    }

    @Override
    public CommonResults addUser(String phoneNumber, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneNumberEqualTo(phoneNumber);
        List<User> users = userMapper.selectByExample(userExample);
        User user = (users==null||users.isEmpty())? null:users.get(0);
        if(user!=null){
            return new CommonResults(200,"添加失败","手机号已存在");
        } else {
            Date now = new Date();
            User user1 = new User(phoneNumber, password, now, now);
            userMapper.insertSelective(user1);
            return new CommonResults(200,"添加成功","添加成功");
        }
    }

    @Override
    public CommonResults updateUser(User user) {
        //SQL：在用户表中，更新用户记录。失败返回 “修改用户表记录失败”，成功返回 “修改用户表记录成功”
        int rows = userMapper.updateByPrimaryKeySelective(user);
        if(rows == 0){
            return new CommonResults(200, "修改失败","修改用户表记录失败");
        }
        return new CommonResults(200, "修改成功","修改用户表记录成功");
    }

    @Override
    public CommonResults deleteUser(int userId) {
        //SQL：在用户表中，删除用户ID的记录。失败返回 “删除用户表记录失败”，成功返回 “删除用户表记录成功”
        User user = userMapper.selectByPrimaryKey(userId);
        if(user == null){
            return new CommonResults(200 , "删除失败","用户记录不存在");
        }else{
            user.setIsDeleted(1);
            int rows = userMapper.updateByPrimaryKeySelective(user);
            if(rows == 0 ){
                return new CommonResults(200 , "删除失败", "用户记录存在，但是删除用户失败");
            }else {
                return new CommonResults(200 , "删除成功","删除用户记录成功");
            }
        }
    }
}



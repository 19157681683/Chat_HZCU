package com.springboot.c2_service.user.login.impl;

import com.springboot.c2_service.user.login.UserLoginService;
import com.springboot.c3_dao.UserMapper;
import com.springboot.c4_domain.entity.User;
import com.springboot.c4_domain.entity.UserExample;
import com.springboot.c4_domain.result.CommonResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/8 12:59
 * @Description:
 */

@Service
public class UserLoginServiceImpl implements UserLoginService {

    @Autowired
    private UserMapper userMapper;

    private String system_verificationCode = "5530";


    @Override
    public CommonResults login(String phoneNumber, String verificationCode, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneNumberEqualTo(phoneNumber);
        List<User> users = userMapper.selectByExample(userExample);
        User user = (users==null||users.isEmpty())? null:users.get(0);
        if(user == null || (user != null && user.getIsDeleted() == 1)){
            return new CommonResults(200,"登录失败","手机号不存在");
        } else if (verificationCode!=null && !system_verificationCode.equals(verificationCode)) {
            return new CommonResults(200,"登录失败","验证码错误");
        } else if (password!=null && !user.getPassword().equals(password))
            return new CommonResults(200, "登录失败", "密码错误");
        else {
            user.setLastLoginTime(new Date());
            userMapper.updateByPrimaryKeySelective(user);
            return new CommonResults(200, "登录成功", user.getUserId());
        }
    }

    @Override
    public CommonResults register(String phoneNumber, String verificationCode, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneNumberEqualTo(phoneNumber);
        List<User> users = userMapper.selectByExample(userExample);
        User user = (users==null||users.isEmpty())? null:users.get(0);
        if(user != null && user.getIsDeleted() == 0){
            return new CommonResults(200,"注册失败","手机号已存在");
        } else if (verificationCode!=null && !system_verificationCode.equals(verificationCode)) {
            return new CommonResults(200,"注册失败","验证码错误");
        }else {
            if(user != null){
                user.setIsDeleted(0);
                userMapper.updateByPrimaryKeySelective(user);
            }else{
                Date now = new Date();
                User user1 = new User(phoneNumber, password, now, now );
                userMapper.insertSelective(user1);
            }
            return new CommonResults(200,"注册成功","注册成功");
        }
    }

    @Override
    public CommonResults reset_password(String phoneNumber, String verificationCode, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneNumberEqualTo(phoneNumber);
        List<User> users = userMapper.selectByExample(userExample);
        User user = (users==null||users.isEmpty())? null:users.get(0);
        if(user == null  || (user != null && user.getIsDeleted() == 1)){
            return new CommonResults(200,"重置密码失败","手机号不存在");
        }else if (verificationCode!=null && !system_verificationCode.equals(verificationCode)) {
            return new CommonResults(200,"重置密码失败","验证码错误");
        }else {
            user.setPassword(password);
            userMapper.updateByPrimaryKeySelective(user);
            return new CommonResults(200,"重置密码成功","重置密码成功");
        }
    }

}



package com.springboot.c2_service.admin.c1_login.impl;

import com.springboot.c2_service.admin.c1_login.LoginService;
import com.springboot.c3_dao.AdminMapper;
import com.springboot.c4_domain.entity.Admin;
import com.springboot.c4_domain.entity.AdminExample;
import com.springboot.c4_domain.result.CommonResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 1:40
 * @Description:
 */

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private AdminMapper adminMapper;

    private String system_verificationCode = "5530";


    @Override
    public CommonResults login(String phoneNumber, String verificationCode, String password) {
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andPhoneNumberEqualTo(phoneNumber);
        List<Admin> admins = adminMapper.selectByExample(adminExample);
        Admin admin = (admins==null||admins.isEmpty())? null:admins.get(0);
        if(admin==null){
            return new CommonResults(200,"登录失败","手机号不存在");
        } else if (verificationCode!=null && !system_verificationCode.equals(verificationCode)) {
            return new CommonResults(200,"登录失败","验证码错误");
        } else if (password!=null && !admin.getPassword().equals(password))
            return new CommonResults(200, "登录失败", "密码错误");
        else {
            admin.setLastLoginTime(new Date());
            adminMapper.updateByPrimaryKeySelective(admin);
            return new CommonResults(200, "登录成功", admin);
        }
    }

    @Override
    public CommonResults register(String phoneNumber, String verificationCode, String password) {
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andPhoneNumberEqualTo(phoneNumber);
        List<Admin> admins = adminMapper.selectByExample(adminExample);
        Admin admin = (admins==null||admins.isEmpty())? null:admins.get(0);
        if(admin!=null){
            return new CommonResults(200,"注册失败","手机号已存在");
        } else if (verificationCode!=null && !system_verificationCode.equals(verificationCode)) {
            return new CommonResults(200,"注册失败","验证码错误");
        }else {
            Date now = new Date();
            Admin admin1 = new Admin(phoneNumber,password,"管理员", now, now);
            adminMapper.insertSelective(admin1);
            return new CommonResults(200,"注册成功","注册成功");
        }
    }

    @Override
    public CommonResults reset_password(String phoneNumber, String verificationCode, String password) {
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andPhoneNumberEqualTo(phoneNumber);
        List<Admin> admins = adminMapper.selectByExample(adminExample);
        Admin admin = (admins==null||admins.isEmpty())? null:admins.get(0);
        if(admin==null){
            return new CommonResults(200,"重置密码失败","手机号不存在");
        }else if (verificationCode!=null && !system_verificationCode.equals(verificationCode)) {
            return new CommonResults(200,"重置密码失败","验证码错误");
        }else {
            admin.setPassword(password);
            adminMapper.updateByPrimaryKeySelective(admin);
            return new CommonResults(200,"重置密码成功","重置密码成功");
        }
    }
}



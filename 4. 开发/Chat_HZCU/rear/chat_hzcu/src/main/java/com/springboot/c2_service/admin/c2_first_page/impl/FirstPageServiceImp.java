package com.springboot.c2_service.admin.c2_first_page.impl;

import com.springboot.c2_service.admin.c2_first_page.FirstPageService;
import com.springboot.c3_dao.AdminMapper;
import com.springboot.c3_dao.UserMapper;
import com.springboot.c4_domain.entity.Admin;
import com.springboot.c4_domain.result.CommonResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 2:15
 * @Description:
 */

@Service
public class FirstPageServiceImp implements FirstPageService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public CommonResults find7DayLoginPeople() {
        //1. SQL：在管理员表中，按照每天归组，选择日期和人数属性
        // 获取当前时间
        Date now = new Date();
        // 计算7天前的时间
        Date sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
        Date yesterday = new Date(now.getTime() - 1 * 24 * 60 * 60 * 1000);
        List<Map<String, Object>> maps = userMapper.selectDailyLoginCount(sevenDaysAgo, yesterday);
        if(maps == null || maps.isEmpty()){
            return new CommonResults<>(200, "查询失败",null);
        }
        return  new CommonResults(200, "查询成功", maps);
    }

    @Override
    public CommonResults findCurrentAdmin(int adminId) {
        //1. SQL：在管理员表中，根据管理员ID查询管理员信息
        Admin admin = adminMapper.selectByPrimaryKey(adminId);
        if(admin == null){
            return new CommonResults(200,"查询失败","查不到管理员记录");
        }
        return new CommonResults(200,"查询成功",admin);
    }

    @Override
    public CommonResults findTop10Chat() {
        return null;
    }

    @Override
    public CommonResults find7DayChatNumbers() {
        // 获取当前时间
        Date now = new Date();
        // 计算7天前的时间
        Date sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
        Date yesterday = new Date(now.getTime() - 1 * 24 * 60 * 60 * 1000);
        List<Map<String, Object>> maps = userMapper.selectDailyChatCount(sevenDaysAgo, yesterday);
        if(maps == null || maps.isEmpty()){
            return new CommonResults<>(200, "查询失败",null);
        }
        return  new CommonResults(200, "查询成功", maps);
    }

    @Override
    public CommonResults findRoasts() {
        return null;
    }

    @Override
    public CommonResults findWishes() {
        return null;
    }
}



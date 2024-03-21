//package com.springboot.c2_service.admin.c2_first_page.impl;
//
//import com.springboot.c2_service.admin.c6_management_wishes.c2_first_page.FirstPageService;
//import com.springboot.c4_domain.result.CommonResults;
//import junit.framework.TestCase;
//import org.apache.ibatis.type.Alias;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class FirstPageServiceImpTest extends TestCase {
//
//    @Autowired
//    private FirstPageService firstPageService;
//
//    // 1. 测试最近7天登录人数
//    @Test
//    public void test7DayPeopleNumber(){
//        CommonResults dayLoginPeople = firstPageService.find7DayLoginPeople();
//        System.out.println(dayLoginPeople);
//    }
//
//}
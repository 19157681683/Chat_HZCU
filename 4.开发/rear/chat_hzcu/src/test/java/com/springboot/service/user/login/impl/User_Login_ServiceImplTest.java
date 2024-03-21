//package com.springboot.service.user.login.impl;
//
//import com.springboot.c4_domain.result.CommonResults;
//import com.springboot.c2_service.user.login.UserLoginService;
//import junit.framework.TestCase;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class User_Login_ServiceImplTest extends TestCase {
//
//    @Autowired
//    private UserLoginService user_login_service;
//
//    @Test
//    public void testLogin() {
//        CommonResults login = user_login_service.login("19157681683", "5530", "123456");
//        System.out.println(login);
//    }
//
//    @Test
//    public void testRegister(){
//        CommonResults register = user_login_service.register("19157681685", "5530", "123456");
//        System.out.println(register);
//    }
//
//    @Test
//    public void testResetPassword(){
//        CommonResults commonResults = user_login_service.reset_password("19157681684", "5530", "123456aaAA");
//        System.out.println(commonResults);
//    }
//}
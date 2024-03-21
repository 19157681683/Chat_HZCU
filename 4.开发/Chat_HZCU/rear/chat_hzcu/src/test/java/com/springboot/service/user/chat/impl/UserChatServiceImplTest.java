//package com.springboot.service.user.chat.impl;
//
//import com.springboot.c3_dao.RoastMapper;
//import com.springboot.c3_dao.UserChatMapper;
//import com.springboot.c3_dao.UserMapper;
//import com.springboot.c4_domain.entity.Roast;
//import com.springboot.c4_domain.entity.RoastExample;
//import com.springboot.c4_domain.entity.User;
//import com.springboot.c4_domain.entity.UserChat;
//import com.springboot.c4_domain.result.CommonResults;
//import com.springboot.c2_service.user.chat.UserChatService;
//import junit.framework.TestCase;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class UserChatServiceImplTest extends TestCase {
//
//    @Autowired
//    private UserChatMapper userChatMapper;
//
//    @Autowired
//    private UserMapper userMapper;
//
//    @Autowired
//    private UserChatService userChatService;
//
//    @Autowired
//    private RoastMapper roastMapper;
//
//    @Test
//    public void testAutoIncre(){
//        // 在用户的聊天记录表中，插入新聊天记录，获取自增的ID。失败返回 “聊天记录表插入失败”
//        UserChat userChat = new UserChat();
//        userChat.setContent("你好");
//        userChat.setTime(new Date());
//        userChatMapper.insert(userChat);         //insert()返回自增的ID，insertSelective()返回影响的行数
//        System.out.println(userChat.getUserChatId());
//    }
//
//    @Test
//    public void testAutoUserId(){
//        User user = new User();
//        user.setPhoneNumber("19157681691");
//        user.setPassword("123456");
//        userMapper.insert(user);
//        System.out.println(user.getUserId());
//    }
//
//    // 测试获取Roasts的content(字段为text)
//    @Test
//    public void testFindRoast(){
//        //SQL：点赞数倒序，分页
//        RoastExample roastExample = new RoastExample();
//        roastExample.createCriteria();
//        roastExample.setOrderByClause("applause_number DESC");
//        List<Roast> roasts = roastMapper.selectByExampleWithBLOBs(roastExample);
//        for (int i = 0; i < roasts.size(); i++) {
//            Roast roast = roasts.get(i);
//            System.out.println(roast);
//        }
//    }
//
//    // 测试List.subList
//    @Test
//    public void testSubList(){
//        // 创建一个示例列表
//        List<String> originalList = new ArrayList<>();
//        originalList.add("Element 1");
//        originalList.add("Element 2");
//        originalList.add("Element 3");
//        originalList.add("Element 4");
//        originalList.add("Element 5");
//
//        // 获取从索引1（包含）到索引3（不包含）的子列表
//        List<String> subList = originalList.subList(0, 2);
//
//        // 输出子列表的元素
//        for (String item : subList) {
//            System.out.println(item);
//        }
//    }
//
//    public void testFindUserChats() {
//    }
//
//    public void testFindUserChat() {
//    }
//
//    @Test
//    public void testAddUserChat() {
//        CommonResults addUserChat = userChatService.addUserChat(10, "你好");
//        System.out.println(addUserChat);
//    }
//
//    public void testUpdateUserChat() {
//    }
//
//    public void testFindRoasts() {
//    }
//
//    public void testAddRoast() {
//    }
//
//    public void testUpdateRoast() {
//    }
//
//    public void testFindWishes() {
//    }
//
//    public void testAddWish() {
//    }
//
//    public void testUpdateWish() {
//    }
//
//    public void testFindRoastsComments() {
//    }
//
//    public void testAddRoastComment() {
//    }
//
//    public void testFindWishesComments() {
//    }
//
//    public void testAddWishesComments() {
//    }
//}
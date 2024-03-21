package com.springboot.c1_rest.admin;

import com.springboot.c2_service.admin.c2_first_page.FirstPageService;
import com.springboot.c2_service.user.chat.UserChatService;
import com.springboot.c4_domain.result.CommonResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 1:38
 * @Description:
 */

@RestController
@RequestMapping("/admins/first-pages")
public class AdminFirstPageController {

    @Autowired
    private FirstPageService firstPageService;

    @Autowired
    private UserChatService userChatService;

    @GetMapping("/users/7-day")
    public CommonResults find7DayPeopleLogin(){
        return firstPageService.find7DayLoginPeople();
    }

    @GetMapping("/admin")
    public CommonResults findCurrentAdmin(@RequestParam(value = "adminId") int adminId){
        return firstPageService.findCurrentAdmin(adminId);
    }


    @GetMapping("/chats/7-day")
    public CommonResults find7DayChats(){
        return firstPageService.find7DayChatNumbers();
    }

    @GetMapping("/roasts")
    public CommonResults findRoasts(@RequestParam(value = "pageNumber") int pageNumber,
                                    @RequestParam(value = "pageSize") int pageSize){
        return userChatService.findRoasts(pageNumber,pageSize);
    }

    @GetMapping("/wishes")
    public CommonResults findWishes(@RequestParam(value = "pageNumber") int pageNumber,
                                    @RequestParam(value = "pageSize") int pageSize){
        return userChatService.findWishes(pageNumber,pageSize);
    }
}



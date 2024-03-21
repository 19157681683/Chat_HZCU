package com.springboot.c1_rest.user;

import com.springboot.c4_domain.dto.*;
import com.springboot.c4_domain.entity.Roast;
import com.springboot.c4_domain.entity.Wish;
import com.springboot.c4_domain.result.CommonResults;
import com.springboot.c2_service.user.chat.UserChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/8 16:23
 * @Description:
 */

@RestController
@RequestMapping("/users/chats")
public class UserChatController {

    @Autowired
    private UserChatService userChatService;

    @GetMapping("/chats")
    public CommonResults findUserChats(@RequestParam(value = "userId") int userId,
                                       @RequestParam(value = "pageNumber") int pageNumber,
                                       @RequestParam(value = "pageSize") int pageSize){
        return userChatService.findUserChats(userId, pageNumber, pageSize);
    }
    @GetMapping("/chat")
    public CommonResults findUserChat(@RequestParam(value = "userChatId") int userChatId){
        return userChatService.findUserChat(userChatId);
    }
    @PostMapping("/chat")
    public CommonResults addUserChat(@RequestBody UserChatDTO userChatDTO){
        return userChatService.addUserChat(userChatDTO.getUserId(), userChatDTO.getContent());
    }
    @PutMapping("/chat")
    public CommonResults updateUserChat(@RequestBody UserChatUpdateDTO userChatUpdateDTO){
        return userChatService.updateUserChat(userChatUpdateDTO.getUserChatId(), userChatUpdateDTO.getContent());
    }



    @GetMapping("/roasts")
    public CommonResults findRoasts(@RequestParam(value = "pageNumber") int pageNumber,
                                    @RequestParam(value = "pageSize") int pageSize){
        return userChatService.findRoasts(pageNumber,pageSize);
    }
    @PostMapping("/roast")
    public CommonResults addUserRoast(@RequestBody UserRoastsDTO userRoastsDTO){
        return userChatService.addRoast(userRoastsDTO.getUserId(), userRoastsDTO.getContent());
    }
    @PutMapping("/roast")
    public CommonResults updateRoast(@RequestBody Roast roast){
        return userChatService.updateRoast(roast);
    }



    @GetMapping("/wishes")
    public CommonResults findWishes(@RequestParam(value = "pageNumber") int pageNumber,
                                    @RequestParam(value = "pageSize") int pageSize){
        return userChatService.findWishes(pageNumber,pageSize);
    }
    @PostMapping("/wish")
    public CommonResults addUserWish(@RequestBody UserWishesDTO userWishesDTO){
        return userChatService.addWish(userWishesDTO.getUserId(), userWishesDTO.getContent());
    }
    @PutMapping("/wish")
    public CommonResults updateWish(@RequestBody Wish wish){
        return userChatService.updateWish(wish);
    }



    @GetMapping("/roasts-comments")
    public CommonResults findRoastsComments(@RequestParam(value = "roastId") int roastId,
                                       @RequestParam(value = "pageNumber") int pageNumber,
                                       @RequestParam(value = "pageSize") int pageSize){
        return userChatService.findRoastsComments(roastId, pageNumber, pageSize);
    }
    @PostMapping("/roast-comment")
    public CommonResults addRoastComment(@RequestBody UserRoastCommentDTO userRoastCommentDTO){
        return userChatService.addRoastComment(userRoastCommentDTO.getUserId(), userRoastCommentDTO.getRoastId(), userRoastCommentDTO.getContent());
    }



    @GetMapping("/wishes-comments")
    public CommonResults findWishesComments(@RequestParam(value = "wishId") int wishId,
                                            @RequestParam(value = "pageNumber") int pageNumber,
                                            @RequestParam(value = "pageSize") int pageSize){
        return userChatService.findWishesComments(wishId, pageNumber, pageSize);
    }
    @PostMapping("/wish-comment")
    public CommonResults addWishComment(@RequestBody UserWishCommentDTO userWishCommentDTO){
        return userChatService.addWishComment(userWishCommentDTO.getUserId(), userWishCommentDTO.getWishId(), userWishCommentDTO.getContent());
    }

}



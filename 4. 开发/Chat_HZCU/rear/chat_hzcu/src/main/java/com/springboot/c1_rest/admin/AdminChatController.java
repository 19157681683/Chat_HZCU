package com.springboot.c1_rest.admin;

import com.springboot.c2_service.admin.c3_chat.AdminChatService;
import com.springboot.c4_domain.result.CommonResults;
import com.springboot.c4_domain.dto.AdminChatDTO;
import com.springboot.c4_domain.dto.AdminChatUpdateDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 1:38
 * @Description:
 */

@RestController
@RequestMapping("/admins/chats")
public class AdminChatController {

    @Autowired
    private AdminChatService adminChatService;

    @GetMapping("/chats")
    public CommonResults findAdminChats(@RequestParam(value = "adminId") int adminId,
                                        @RequestParam(value = "pageNumber") int pageNumber,
                                        @RequestParam(value = "pageSize") int pageSize){
        return adminChatService.findAdminChats(adminId, pageNumber, pageSize);
    }

    @GetMapping("/chat")
    public CommonResults findAdminChat(@RequestParam(value = "adminChatId") int adminChatId){
        return adminChatService.findAdminChat(adminChatId);
    }

    @PostMapping("/chat")
    public CommonResults addAdminChat(@RequestBody AdminChatDTO adminChatDTO){
        return adminChatService.addAdminChat(adminChatDTO.getAdminId(), adminChatDTO.getContent());
    }
    @PutMapping("/chat")
    public CommonResults updateAdminChat(@RequestBody AdminChatUpdateDTO adminChatUpdateDTO){
        return adminChatService.updateAdminChat(adminChatUpdateDTO.getAdminChatId(), adminChatUpdateDTO.getContent());
    }
}



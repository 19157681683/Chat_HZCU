package com.springboot.c1_rest.admin;

import com.springboot.c2_service.admin.c4_management_users.ManagementUserService;
import com.springboot.c4_domain.dto.AdminAddUserDTO;
import com.springboot.c4_domain.entity.User;
import com.springboot.c4_domain.result.CommonResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 1:39
 * @Description:
 */

@RestController
@RequestMapping("/admins/users-managements")
public class ManagementUsersController {

    @Autowired
    private ManagementUserService manageMentUserService;

    @GetMapping("/users")
    public CommonResults findUsers(@RequestParam(value = "pageNumber") int pageNumber,
                                   @RequestParam(value = "pageSize") int pageSize){
        return manageMentUserService.findUsers(pageNumber, pageSize);
    }

    @PostMapping("/user")
    public CommonResults addUser(@RequestBody AdminAddUserDTO adminAddUserDTO){
        return manageMentUserService.addUser(adminAddUserDTO.getPhoneNumber(), adminAddUserDTO.getPassword());
    }

    @PutMapping("/user")
    public CommonResults updateUser(@RequestBody User user){
        return manageMentUserService.updateUser(user);
    }

    @DeleteMapping("/user")
    public CommonResults deleteUser(@RequestParam(value = "userId") int userId){
        return manageMentUserService.deleteUser(userId);
    }


}



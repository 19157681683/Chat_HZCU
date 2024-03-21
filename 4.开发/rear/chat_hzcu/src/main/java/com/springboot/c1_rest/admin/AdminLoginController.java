package com.springboot.c1_rest.admin;

import com.springboot.c4_domain.dto.LoginDTO;
import com.springboot.c4_domain.result.CommonResults;
import com.springboot.c2_service.admin.c1_login.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 1:37
 * @Description:
 */
@RestController
@RequestMapping("/admins/logins")
public class AdminLoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/admins")
    public CommonResults login(@RequestParam(value = "phoneNumber") String phoneNumber,
                               @RequestParam(value = "verificationCode") String verificationCode,
                               @RequestParam(value = "password") String password){
        CommonResults login = loginService.login(phoneNumber, verificationCode, password);
        return login;
    }

    @PostMapping("/admins")
    public CommonResults register(@RequestBody LoginDTO adminLoginDTO) {
        CommonResults register = loginService.register(adminLoginDTO.getPhoneNumber(), adminLoginDTO.getVerificationCode(), adminLoginDTO.getPassword());
        return register;
    }

    @PutMapping("/admins")
    public CommonResults reset_password(@RequestBody LoginDTO adminLoginDTO){
        CommonResults reset_password = loginService.reset_password(adminLoginDTO.getPhoneNumber(), adminLoginDTO.getVerificationCode(), adminLoginDTO.getPassword());
        return reset_password;
    }
}



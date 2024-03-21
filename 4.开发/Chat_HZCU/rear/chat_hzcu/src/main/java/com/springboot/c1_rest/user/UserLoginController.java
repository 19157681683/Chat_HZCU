package com.springboot.c1_rest.user;

import com.springboot.c4_domain.dto.LoginDTO;
import com.springboot.c4_domain.result.CommonResults;
import com.springboot.c2_service.user.login.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/8 11:37
 * @Description:
 */
@RestController
@RequestMapping("/users/logins")
public class UserLoginController {

    @Autowired
    private UserLoginService userLoginService;

    @GetMapping("/users")
    public CommonResults login(@RequestParam(value = "phoneNumber") String phoneNumber,
                            @RequestParam(value = "verificationCode") String verificationCode,
                            @RequestParam(value = "password") String password){
        CommonResults login = userLoginService.login(phoneNumber, verificationCode, password);
        return login;
    }

    @PostMapping("/users")
    public CommonResults register(@RequestBody LoginDTO loginDTO) {
        CommonResults register = userLoginService.register(loginDTO.getPhoneNumber(), loginDTO.getVerificationCode(), loginDTO.getPassword());
        return register;
    }

    @PutMapping("/users")
    public CommonResults reset_password(@RequestBody LoginDTO loginDTO){
        CommonResults reset_password = userLoginService.reset_password(loginDTO.getPhoneNumber(), loginDTO.getVerificationCode(), loginDTO.getPassword());
        return reset_password;
    }
}




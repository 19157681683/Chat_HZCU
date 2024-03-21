package com.springboot.c1_rest.admin;

import com.springboot.c2_service.admin.c5_management_roasts.ManagementRoastsService;
import com.springboot.c4_domain.dto.UserRoastsDTO;
import com.springboot.c4_domain.entity.Roast;
import com.springboot.c4_domain.result.CommonResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 1:38
 * @Description:
 */

@RestController
@RequestMapping("/admins/roasts-managements")
public class ManagementRoastsController {

    @Autowired
    private ManagementRoastsService managementRoastsService;

    @GetMapping("/roasts")
    public CommonResults findRoasts(@RequestParam(value = "pageNumber") int pageNumber,
                                    @RequestParam(value = "pageSize") int pageSize){
        return managementRoastsService.findRoasts(pageNumber,pageSize);
    }

    @PostMapping("/roast")
    public CommonResults addUserRoast(@RequestBody UserRoastsDTO userRoastsDTO){
        return managementRoastsService.addRoast(1, userRoastsDTO.getContent());
    }

    @PutMapping("/roast")
    public CommonResults updateRoast(@RequestBody Roast roast){
        return managementRoastsService.updateRoast(roast);
    }


    @DeleteMapping("/roast")
    public CommonResults deleteRoast(@RequestParam(value = "roastId") int roastId){
        return managementRoastsService.deleteRoast(roastId);
    }

    @GetMapping("/roasts-comments")
    public CommonResults findRoastsComments(@RequestParam(value = "roastId") int roastId,
                                            @RequestParam(value = "pageNumber") int pageNumber,
                                            @RequestParam(value = "pageSize") int pageSize){
        return managementRoastsService.findRoastComments(roastId, pageNumber, pageSize);
    }
}



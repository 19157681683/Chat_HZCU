package com.springboot.c1_rest.admin;

import com.springboot.c2_service.admin.c6_management_wishes.ManagementWishesService;
import com.springboot.c4_domain.dto.UserWishesDTO;
import com.springboot.c4_domain.entity.Wish;
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
@RequestMapping("/admins/wishes-managements")
public class ManagementWishesController {

    @Autowired
    private ManagementWishesService managementWishesService;

    @GetMapping("/wishes")
    public CommonResults findWishes(@RequestParam(value = "pageNumber") int pageNumber,
                                    @RequestParam(value = "pageSize") int pageSize){
        return managementWishesService.findWishes(pageNumber,pageSize);
    }

    @PostMapping("/wish")
    public CommonResults addUserWish(@RequestBody UserWishesDTO userWishesDTO){
        return managementWishesService.addWish(1, userWishesDTO.getContent());
    }

    @PutMapping("/wish")
    public CommonResults updateWish(@RequestBody Wish wish){
        return managementWishesService.updateWish(wish);
    }

    @DeleteMapping("/wish")
    public CommonResults deleteWish(@RequestParam(value = "wishId") int wishId){
        return managementWishesService.deleteWish(wishId);
    }

    @GetMapping("/wishes-comments")
    public CommonResults findWishesComments(@RequestParam(value = "wishId") int wishId,
                                            @RequestParam(value = "pageNumber") int pageNumber,
                                            @RequestParam(value = "pageSize") int pageSize){
        return managementWishesService.findWishComments(wishId, pageNumber, pageSize);
    }
}




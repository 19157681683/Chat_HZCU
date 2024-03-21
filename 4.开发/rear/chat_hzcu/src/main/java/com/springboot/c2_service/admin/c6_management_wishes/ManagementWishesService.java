package com.springboot.c2_service.admin.c6_management_wishes;
/*

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/10 5:51

*/

import com.springboot.c4_domain.entity.Wish;
import com.springboot.c4_domain.result.CommonResults;

public interface ManagementWishesService {
    // 1. 查询我想榜（点赞数排序/分页）
    public CommonResults findWishes(int pageNumber, int pageSize);

    // 2. 添加我想
    public CommonResults addWish(int userId, String content);

    // 3. 更改我想
    public CommonResults updateWish(Wish wish);

    // 4. 删除我想
    public CommonResults deleteWish(int wishId);

    // 5. 根据我想ID查询我想评论
    public CommonResults findWishComments(int wishId, int pageNumber, int pageSize);
}

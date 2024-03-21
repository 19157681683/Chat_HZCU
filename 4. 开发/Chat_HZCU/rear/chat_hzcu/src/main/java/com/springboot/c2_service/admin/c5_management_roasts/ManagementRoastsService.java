package com.springboot.c2_service.admin.c5_management_roasts;
/*

@author = 李林名
@email = lishuai1199@qq.com
@create_time = 2024/3/10 5:23

*/

import com.springboot.c4_domain.entity.Roast;
import com.springboot.c4_domain.result.CommonResults;

public interface ManagementRoastsService {

    // 1. 查询吐槽榜（点赞数排序/分页）
    public CommonResults findRoasts(int pageNumber, int pageSize);

    // 2. 添加吐槽
    public CommonResults addRoast(int userId, String content);

    // 3. 更改吐槽
    public CommonResults updateRoast(Roast roast);

    // 4. 删除吐槽
    public CommonResults deleteRoast(int roastId);

    // 5. 根据吐槽ID查询吐槽评论
    public CommonResults findRoastComments(int roastId, int pageNumber, int pageSize);
}

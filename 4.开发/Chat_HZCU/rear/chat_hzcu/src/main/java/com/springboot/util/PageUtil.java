package com.springboot.util;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/9 18:55
 * @Description:
 */
public class PageUtil {

    public static <T> List<T> getPageData(List<T> sourceList, int pageNumber, int pageSize){
        if(sourceList == null || sourceList.isEmpty()){
            return Collections.emptyList();
        }

        int fromIndex = (pageNumber-1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, sourceList.size());

        return sourceList.subList(fromIndex, toIndex);
    }
}



package com.basic.common.utils;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Page组装类
 */
public class PageUtil<T> extends LinkedHashMap<String, Object> {
    int pageSize = 10;
    int pageNum = 0;
    private Page<T> page;

    public PageUtil(Map<String,Object> map){
        if (map.get("pageSize") != null) {
            pageSize = (int) map.get("pageSize");
        }
        if (map.get("pageNum") != null) {
            pageNum = (int) map.get("pageNum");
        }
       this.page = new Page<>(pageNum,pageSize);
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getPageNum() {
        return pageNum;
    }

    public Page<T> getPage() {
        return page;
    }
}

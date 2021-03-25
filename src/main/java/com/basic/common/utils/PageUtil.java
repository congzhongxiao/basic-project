package com.basic.common.utils;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.basic.common.domain.PageResult;

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

    //组装分页列表页面返回数据
    public static PageResult initPage(IPage page) {
        PageResult result = new PageResult();
        if (page != null) {
            result.setRows(page.getRecords());
            result.setTotal(page.getTotal());
        }
        return result;
    }
}

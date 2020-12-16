package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.utils.PageUtil;
import com.basic.common.utils.StringUtils;
import com.basic.entity.Dictionary;
import com.basic.mapper.DictionaryMapper;
import com.basic.service.DictionaryService;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
*字典ServiceImpl
*@author: lee
*@time: 2020-05-14 11:44:10
*/
@Service
public class DictionaryServiceImpl extends ServiceImpl<DictionaryMapper, Dictionary> implements DictionaryService {
    //添加
    public boolean add(Dictionary dictionary) {
        try {
            baseMapper.insert(dictionary);
            return true;
        } catch(Exception e) {
            return false;
        }
    }

    //分页查询
    public IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam){
        Page<Dictionary> page = new PageUtil<Dictionary>(queryParam).getPage();
        QueryWrapper<Dictionary> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        if(StringUtils.isNotBlank(queryParam.get("type"))) {
            queryWrapper.like("type",queryParam.get("type"));
        }
        if(StringUtils.isNotBlank(queryParam.get("name"))) {
            queryWrapper.like("name",queryParam.get("name"));
        }
        if(StringUtils.isNotBlank(queryParam.get("value"))) {
            queryWrapper.like("value",queryParam.get("value"));
        }
        queryWrapper.orderByAsc("type","sort");
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return mapIPage;
        }

}

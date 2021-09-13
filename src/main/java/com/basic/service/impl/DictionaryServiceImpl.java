package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;
import com.basic.common.utils.StringUtils;
import com.basic.entity.Dictionary;
import com.basic.mapper.DictionaryMapper;
import com.basic.service.DictionaryService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
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
    public Result getPageInfo(Map<String, Object> queryParam){
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
        IPage iPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(iPage));
    }

    /**
     * 根据字典type分类查询字典列表
     * @param type
     * @return
     */
    @Override
    public List<Dictionary> findDictListByType(String type) {
        QueryWrapper<Dictionary> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        if(StringUtils.isNotBlank(type)) {
            queryWrapper.eq("type",type);
        }
        queryWrapper.orderByAsc("sort");
        return this.baseMapper.selectList(queryWrapper);
    }

    /**
     * 根据类型获取字典map
     *
     * @param type
     * @return
     */
    @Override
    public Map<String, String> findDictMapByType(String type) {
        Map<String, String> map = new HashMap<>();
        List<Dictionary> list = findDictListByType(type);
        if (list != null && list.size() > 0) {
            for (Dictionary dict: list) {
                map.put(dict.getValue(), dict.getName());
            }
        }
        return map;
    }

    /**
     * 根据type查询正常使用参数列表
     *
     * @return
     */
    public List<Dictionary> findEnableListByType(String type) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("type", type);
        queryWrapper.eq("status", 1);
        queryWrapper.orderByAsc("sort");
        return baseMapper.selectList(queryWrapper);
    }

    /**
     * 根据参数type和value获取正常状态的参数对象
     * @param type
     * @param value
     * @return
     */
    public Dictionary findEnableInfoByTypeAndValue(String type, String value) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("type", type);
        queryWrapper.eq("value", value);
        queryWrapper.eq("status", 1);
        queryWrapper.last("limit 1");
        return baseMapper.selectOne(queryWrapper);
    }

}

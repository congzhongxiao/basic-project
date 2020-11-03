package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.TestTest;
import com.basic.service.TestTestService;
import com.basic.mapper.TestTestMapper;

import java.util.Map;
/**
*测试实体类ServiceImpl
*@author: lee
*@time: 2020-11-03 17:29:50
*/
@Service
public class TestTestServiceImpl extends ServiceImpl<TestTestMapper, TestTest> implements TestTestService {

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<TestTest> page = new PageUtil<TestTest>(queryParam).getPage();
        QueryWrapper<TestTest> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

}

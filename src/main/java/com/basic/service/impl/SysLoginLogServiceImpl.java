package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.utils.StringUtils;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.SysLoginLog;
import com.basic.service.SysLoginLogService;
import com.basic.mapper.SysLoginLogMapper;

import java.util.Map;
/**
*登录信息ServiceImpl
*@author: lee
*@time: 2021-09-07 15:38:51
*/
@Service
public class SysLoginLogServiceImpl extends ServiceImpl<SysLoginLogMapper, SysLoginLog> implements SysLoginLogService {

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<SysLoginLog> page = new PageUtil<SysLoginLog>(queryParam).getPage();
        QueryWrapper<SysLoginLog> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        queryWrapper.like(StringUtils.isNotBlank(queryParam.get("username")),"username",queryParam.get("username"));
        queryWrapper.orderByDesc("id");
        IPage mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

}

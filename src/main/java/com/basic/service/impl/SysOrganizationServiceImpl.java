package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.SysOrganization;
import com.basic.service.SysOrganizationService;
import com.basic.mapper.SysOrganizationMapper;

import java.util.Map;
/**
*组织架构ServiceImpl
*@author: lee
*@time: 2021-03-17 15:22:02
*/
@Service
public class SysOrganizationServiceImpl extends ServiceImpl<SysOrganizationMapper, SysOrganization> implements SysOrganizationService {

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<SysOrganization> page = new PageUtil<SysOrganization>(queryParam).getPage();
        QueryWrapper<SysOrganization> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

}

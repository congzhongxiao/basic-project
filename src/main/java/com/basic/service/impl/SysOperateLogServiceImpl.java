package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.utils.PageUtil;

import com.basic.entity.SysOperateLog;
import com.basic.service.SysOperateLogService;
import com.basic.mapper.SysOperateLogMapper;

import java.util.Map;

/**
 * 操作日志ServiceImpl
 *
 * @author: lee
 * @time: 2020-11-03 15:36:44
 */
@Service
public class SysOperateLogServiceImpl extends ServiceImpl<SysOperateLogMapper, SysOperateLog> implements SysOperateLogService {
    //分页查询
    public IPage<Map<String, Object>> getPageInfo(Map<String, Object> queryParam) {
        Page<SysOperateLog> page = new PageUtil<SysOperateLog>(queryParam).getPage();
        QueryWrapper<SysOperateLog> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return mapIPage;
    }

}

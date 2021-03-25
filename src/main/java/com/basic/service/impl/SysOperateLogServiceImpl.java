package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;
import com.basic.entity.SysOperateLog;
import com.basic.mapper.SysOperateLogMapper;
import com.basic.service.SysOperateLogService;
import org.springframework.stereotype.Service;

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
    public Result getPageInfo(Map<String, Object> queryParam) {
        Page<SysOperateLog> page = new PageUtil<SysOperateLog>(queryParam).getPage();
        QueryWrapper<SysOperateLog> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<SysOperateLog> mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

}

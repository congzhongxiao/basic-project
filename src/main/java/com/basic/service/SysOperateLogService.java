package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.entity.SysOperateLog;

import java.util.Map;

/**
*操作日志 Service
*@author: lee
*@time: 2020-11-03 15:36:44
*/
public interface SysOperateLogService extends IService<SysOperateLog> {
    IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam);

}
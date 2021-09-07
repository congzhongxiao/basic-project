package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.SysLoginLog;

import java.util.Map;

/**
*登录信息 Service
*@author: lee
*@time: 2021-09-07 15:38:51
*/
public interface SysLoginLogService extends IService<SysLoginLog> {
    Result getPageInfo(Map<String, Object> queryParam);
}
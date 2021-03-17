package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.SysOrganization;

import java.util.Map;

/**
*组织架构 Service
*@author: lee
*@time: 2021-03-17 15:22:02
*/
public interface SysOrganizationService extends IService<SysOrganization> {
    Result getPageInfo(Map<String, Object> queryParam);
}
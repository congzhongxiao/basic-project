package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.SysOrganization;

/**
*组织架构 Service
*@author: lee
*@time: 2021-03-17 15:22:02
*/
public interface SysOrganizationService extends IService<SysOrganization> {
    int addOrganization(SysOrganization organization);
    int updateOrganization(SysOrganization organization);
    int deleteById(String id);

}
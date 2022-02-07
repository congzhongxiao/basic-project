package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.SysDuty;

import java.util.Map;

/**
*职务 Service
*@author: djy
*@time: 2022-01-21 14:24:47
*/
public interface SysDutyService extends IService<SysDuty> {
    Result getPageInfo(Map<String, Object> queryParam);
    int findDataPermissionById(String dutyId);
    int findDataPermissionByCode(String code);


    /**
     * 将职务的更新同步至与此职务匹配的用户表及用户职务关系表
     * @param sysDuty
     */
    void updateDuty(SysDuty sysDuty);
}
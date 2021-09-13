package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.SysConfig;

import java.util.List;

/**
*系统配置 Service
*@author: lee
*@time: 2021-09-11 15:36:32
*/
public interface SysConfigService extends IService<SysConfig> {
    List<SysConfig> findListByModel(String model);
    void saveAndUpdate(List<SysConfig> addList, List<SysConfig> updateList, List<SysConfig> allList);
    String findValueByCode(String code);

}
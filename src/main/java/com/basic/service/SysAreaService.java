package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.SysArea;

import java.util.List;
import java.util.Map;

/**
*行政区划 Service
*@author: lee
*@time: 2020-11-12 10:07:45
*/
public interface SysAreaService extends IService<SysArea> {
    boolean isCodeExist(SysArea area);
    int addArea(SysArea area);
    int updateArea(SysArea area);
}
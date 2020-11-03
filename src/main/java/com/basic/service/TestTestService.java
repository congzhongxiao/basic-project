package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.TestTest;

import java.util.Map;

/**
*测试实体类 Service
*@author: lee
*@time: 2020-11-03 17:29:50
*/
public interface TestTestService extends IService<TestTest> {
    Result getPageInfo(Map<String, Object> queryParam);
}
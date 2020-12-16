package com.basic.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.Dictionary;

import java.util.Map;

/**
*字典 Service
*@author: lee
*@time: 2020-05-14 11:44:10
*/
public interface DictionaryService extends IService<Dictionary> {
    boolean add(Dictionary dictionary);
    IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam);
}
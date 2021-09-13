package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.common.domain.Result;
import com.basic.entity.Dictionary;

import java.util.List;
import java.util.Map;

/**
*字典 Service
*@author: lee
*@time: 2020-05-14 11:44:10
*/
public interface DictionaryService extends IService<Dictionary> {
    boolean add(Dictionary dictionary);
    Result getPageInfo(Map<String, Object> queryParam);
    List<Dictionary> findEnableListByType(String type);
    Dictionary findEnableInfoByTypeAndValue(String type, String value);
    List<Dictionary> findDictListByType(String type);

    /**
     * 根据类型获取字典map
     * @param type
     * @return
     */
    Map<String, String> findDictMapByType(String type);
}
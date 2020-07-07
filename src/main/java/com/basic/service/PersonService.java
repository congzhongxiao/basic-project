package com.basic.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.Person;

import java.util.List;
import java.util.Map;

/**
*人员信息 Service
*@author: lee
*@time: 2020-05-07 10:03:33
*/
public interface PersonService extends IService<Person> {
    boolean add(Person person);
    Result importPerson(List<Person> personList, String currentUser);
    IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam);
    Page<Person> getPageInfo2(Map<String, Object> queryParam);
}
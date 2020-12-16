package com.basic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.entity.Person;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
*人员信息 Mapper
*@author: lee
*@time: 2020-05-07 10:03:33
*/
@Component
public interface PersonMapper extends BaseMapper<Person> {
    List<Person> getPersonPage(IPage params, @Param("queryParam") Map<String, Object> queryParam);
}
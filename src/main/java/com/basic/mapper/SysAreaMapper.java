package com.basic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.basic.entity.SysArea;
import org.springframework.stereotype.Component;

import java.util.List;

/**
*行政区划 Mapper
*@author: lee
*@time: 2020-11-12 10:07:45
*/
@Component
public interface SysAreaMapper extends BaseMapper<SysArea> {
    List<SysArea> getChildrenById(String id);
    List<SysArea> getListByPid(String id);

}
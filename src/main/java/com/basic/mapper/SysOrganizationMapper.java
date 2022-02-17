package com.basic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.basic.entity.SysOrganization;
import org.springframework.stereotype.Component;

import java.util.List;

/**
*组织架构 Mapper
*@author: lee
*@time: 2021-03-17 15:22:02
*/
@Component
public interface SysOrganizationMapper extends BaseMapper<SysOrganization> {
    List<SysOrganization> getChildrenById(String id);
    List<SysOrganization> getListByPid(String id);


}
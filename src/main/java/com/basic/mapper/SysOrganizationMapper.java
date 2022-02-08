package com.basic.mapper;

import com.basic.entity.SysOrganization;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
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
    List<SysOrganization> getChildrenByDepartmentId(String departmentId);
    List<SysOrganization> getChildrenCompanyByCompanyId(String companyId);
    List<SysOrganization> getChildrenDeptByCompanyId(String companyId);
    //公司下的所有，包含自己
    List<SysOrganization> getOrgListByCompanyId(@Param("companyId") String companyId);

    /**
     * 查询当前公司节点开始的组织
     * @param companyId
     * @return
     */
    List<SysOrganization> getCurrentCompanyByCompanyId(@Param("companyId") String companyId, @Param("orgType") String orgType);


}
package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.common.domain.Ztree;
import com.basic.entity.SysOrganization;
import com.basic.entity.User;

import java.util.List;

/**
*组织架构 Service
*@author: lee
*@time: 2021-03-17 15:22:02
*/
public interface SysOrganizationService extends IService<SysOrganization> {
    int addOrganization(SysOrganization organization);
    void updateOrganization(SysOrganization organization);
    int deleteById(String id);
    List<Ztree> getAllTree(User user);
    SysOrganization getUpperCompany(String departmentId);
    List<SysOrganization> findChildrenCompanyByCompanyId(String companyId);
    List<SysOrganization> findAllChildrenDeptByCompanyId(String companyId);
    List<SysOrganization> findDirectChildrenDeptByCompanyId(String companyId);
    List<SysOrganization> findChildrenDeptByDeptId(String deptId);
    List<Ztree> getUserControlTreeByUser(User currentUser);
    List<Ztree> getOrganizationTreeByUser(User currentUser);
    List<Ztree> getCompanyTreeByUser(User currentUser);

    /**
     * 根据code查询组织架构信息
     * @param code
     * @return
     */
    SysOrganization findByCode(String code);

    /**
     * 获取当前用户所在企业的树，不添加子企业
     * @param user
     * @return
     */
    List<Ztree> getCurrentCompanyTree(User user);

    /**
     * 查询整个集团的树
     * @return
     */
    List<Ztree> getAllGroupTree();

    /**
     * 根据父节点查询子节点树
     * @param orgId
     * @return
     */
    List<Ztree> getChildTreeByPid(String orgId);
}
package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.common.domain.Ztree;
import com.basic.entity.Permission;

import java.util.List;

/**
 * @author lee
 * @since 2020-03-10
 */
public interface PermissionService extends IService<Permission> {
     List getPermissionListByCode(String code);
     int deleteById(String id);
     List<Ztree> getAllTree();
     List<Permission> getPermissionListByRoleId(String roleId);
     List<Ztree> getPermissionTreeForRole(String roleId);
     boolean isCodeExist(Permission permission);
}

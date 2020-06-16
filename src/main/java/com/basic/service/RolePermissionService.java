package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.RolePermission;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lee
 * @since 2020-03-10
 */
public interface RolePermissionService extends IService<RolePermission> {
    public boolean deleteRolePermissionByRoleId(String roleId);
}

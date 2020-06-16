package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.entity.RolePermission;
import com.basic.mapper.RolePermissionMapper;
import com.basic.service.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lee
 * @since 2020-03-10
 */
@Service
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements RolePermissionService {
    @Autowired
    RolePermissionMapper rolePermissionMapper;
    public boolean deleteRolePermissionByRoleId(String roleId) {
        try {
            this.rolePermissionMapper.delete(new QueryWrapper<RolePermission>().eq("role_id",roleId));
            return true;
        } catch (Exception e) {

        }
        return  false;
    }
}

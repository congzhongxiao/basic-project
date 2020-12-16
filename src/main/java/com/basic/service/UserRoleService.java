package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.UserRole;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lee
 * @since 2020-03-10
 */
public interface UserRoleService extends IService<UserRole> {
    boolean deleteByUserId(String userId);
    boolean deleteByRoleId(String roleId);
}

package com.basic.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.Role;

import java.util.List;
import java.util.Map;

/**
 * @author lee
 * @since 2020-03-10
 */
public interface RoleService extends IService<Role> {
     IPage<Map<String, Object>> getPageInfo(Map<String, Object> queryParam) ;
     List<Role> getRoleListByUserId(String userId);
     List<Role> getAllRoles();
}

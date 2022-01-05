package com.basic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.basic.entity.Permission;
import com.basic.entity.SysArea;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lee
 * @since 2020-03-10
 */
@Component
public interface PermissionMapper extends BaseMapper<Permission> {
    List<Permission> getPermissionListByRoleId(String roleId);
    List<Permission> getListByPid(String id);
}

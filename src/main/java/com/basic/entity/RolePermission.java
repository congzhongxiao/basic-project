package com.basic.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@TableName("sys_role_permission")
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class RolePermission {
    private String roleId;//角色id
    private String permId;//权限id
}

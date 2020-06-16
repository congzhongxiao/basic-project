package com.basic.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@TableName("sys_user_role")
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UserRole {
    private String userId;//用户表id
    private String roleId;//角色表id
}

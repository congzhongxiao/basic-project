package com.basic.common.exception.user;

/**
 * 角色锁定异常类
 * 
 */
public class RoleBlockedException extends UserException
{
    private static final long serialVersionUID = 1L;

    public RoleBlockedException()
    {
        super(null,"用户角色被禁用");
    }
}

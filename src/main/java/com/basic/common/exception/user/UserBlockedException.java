package com.basic.common.exception.user;

/**
 * 用户锁定异常类
 * 
 */
public class UserBlockedException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserBlockedException()
    {
        super( null,"该用户被禁用");
    }
}

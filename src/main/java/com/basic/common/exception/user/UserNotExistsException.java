package com.basic.common.exception.user;

/**
 * 用户不存在异常类
 * 
 */
public class UserNotExistsException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserNotExistsException()
    {
        super(null,"用户不存在");
    }
}

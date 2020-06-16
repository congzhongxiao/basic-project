package com.basic.common.exception.user;

/**
 * 用户错误记数异常类
 * 
 */
public class UserPasswordRetryLimitCountException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserPasswordRetryLimitCountException(int retryLimitCount)
    {
        super(new Object[] { retryLimitCount },"用户登录错误次数过多");
    }
}

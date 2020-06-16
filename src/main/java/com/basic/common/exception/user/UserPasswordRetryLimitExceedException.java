package com.basic.common.exception.user;

/**
 * 用户错误最大次数异常类
 */
public class UserPasswordRetryLimitExceedException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserPasswordRetryLimitExceedException(int retryLimitCount)
    {
        super(new Object[] { retryLimitCount },"错误次数超过"+ retryLimitCount +"次");
    }
}

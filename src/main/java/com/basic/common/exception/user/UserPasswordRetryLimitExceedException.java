package com.basic.common.exception.user;

import com.basic.common.constants.UserConstant;

/**
 * 用户错误最大次数异常类
 */
public class UserPasswordRetryLimitExceedException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserPasswordRetryLimitExceedException(long lastTime)
    {
        super(new Object[] {  lastTime},"用户连续登录失败超过"+ UserConstant.LOGIN_FAIL_LOCK_NUM +"次，账号被锁定，解除锁定还剩" + lastTime + "秒。");
    }
}

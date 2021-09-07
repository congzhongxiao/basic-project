package com.basic.common.exception.user;

import com.basic.common.constants.UserConstant;

/**
 * 用户错误记数异常类
 */
public class UserPasswordRetryLimitCountException extends UserException {
    private static final long serialVersionUID = 1L;

    public UserPasswordRetryLimitCountException(int retryLimitCount) {
        super(new Object[]{retryLimitCount}, "用户名密码错误，还可以尝试" + (UserConstant.LOGIN_FAIL_LOCK_NUM - retryLimitCount) + "次");
    }
}

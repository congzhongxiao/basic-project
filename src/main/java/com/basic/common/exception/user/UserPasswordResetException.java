package com.basic.common.exception.user;

/**
 * 密码过期异常类
 */
public class UserPasswordResetException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserPasswordResetException()
    {
        super( null,"系统检测您的密码已长时间未更新，为保障您的帐号安全，请先修改密码后再继续操作。");
    }
}

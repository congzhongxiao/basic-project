package com.basic.common.exception.user;

/**
 * 验证码错误异常类
 * 
 */
public class CaptchaException extends UserException
{
    private static final long serialVersionUID = 1L;

    public CaptchaException()
    {
        super(null,"验证码不正确");
    }
}

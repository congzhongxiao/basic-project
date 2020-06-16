package com.basic.common.exception.user;


import com.basic.common.exception.base.BaseException;

/**
 * 用户信息异常类
 * 
 */
public class UserException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public UserException(Object[] args,String message)
    {
        super("user", args, message);
    }
}

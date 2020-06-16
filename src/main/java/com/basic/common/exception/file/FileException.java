package com.basic.common.exception.file;


import com.basic.common.exception.base.BaseException;

/**
 * 文件信息异常类
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(Object[] args,String message)
    {
        super("file", args, message);
    }

}

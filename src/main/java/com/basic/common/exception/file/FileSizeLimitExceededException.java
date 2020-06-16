package com.basic.common.exception.file;

/**
 * 文件名大小限制异常类
 * 
 */
public class FileSizeLimitExceededException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileSizeLimitExceededException(long defaultMaxSize)
    {
        super(new Object[] { defaultMaxSize },"文件过大");
    }
}

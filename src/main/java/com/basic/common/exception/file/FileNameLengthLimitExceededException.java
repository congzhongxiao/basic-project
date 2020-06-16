package com.basic.common.exception.file;

/**
 * 文件名称超长限制异常类
 * 
 */
public class FileNameLengthLimitExceededException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileNameLengthLimitExceededException(int defaultFileNameLength)
    {
        super(new Object[] { defaultFileNameLength },"文件名称超过限制长度");
    }
}

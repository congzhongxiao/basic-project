package com.basic.common.exception.base;


/**
 * 基础异常
 */
public class BaseException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    /**
     * 所属模块
     */
    private String module;

    /**
     * 错误码对应的参数
     */
    private Object[] args;

    /**
     * 错误消息
     */
    private String defaultMessage;

    public BaseException(String module, Object[] args, String defaultMessage) {
        this.module = module;
        this.args = args;
        this.defaultMessage = defaultMessage;
    }

    public BaseException(String module, String defaultMessage) {
        this(module, null, defaultMessage);
    }

    public BaseException(String defaultMessage) {
        this(null, null, defaultMessage);
    }

    @Override
    public String getMessage() {
        return defaultMessage;
    }

    public String getModule() {
        return module;
    }


    public Object[] getArgs() {
        return args;
    }

    public String getDefaultMessage() {
        return defaultMessage;
    }
}

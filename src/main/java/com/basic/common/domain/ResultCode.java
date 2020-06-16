package com.basic.common.domain;

/**
 * 统一返回码
 */
public enum  ResultCode {

    //通用操作返回码
    COMMON_SUCCESS(true,1000,"操作成功!"),
    COMMON_FAIL(false,1001,"操作失败！"),
    COMMON_NO_LOGIN(false,1002,"未登录!"),
    COMMON_NO_PERMIT(false,1003,"权限不足!"),
    COMMON_SERVER_ERROR(false,1004,"系统繁忙，请稍后重试！"),
    COMMON_DATA_OPTION_ERROR(false,1005,"数据操作异常！"),
    //校验失败可能存在message自定义，在Result中实现
    COMMON_FAIL_VALIDATE(false,1050,"参数校验失败！");
    //业务细分返回码
    //example：会员管理返回码...

    private boolean success;
    private Integer code;
    private String message;

    ResultCode(boolean success, Integer code, String message) {
        this.success = success;
        this.code = code;
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}

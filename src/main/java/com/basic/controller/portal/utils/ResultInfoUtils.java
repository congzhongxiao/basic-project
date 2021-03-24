package com.basic.controller.portal.utils;

import com.basic.controller.portal.core.ResultInfo;

public final class ResultInfoUtils {

    /**
     * 返回成功结果
     */
    public static <T> ResultInfo<T> success() {
        return new ResultInfo<>();
    }

    /**
     * 返回成功结果
     *
     * @param msg 消息
     */
    public static <T> ResultInfo<T> success(String msg) {
        ResultInfo<T> result = new ResultInfo<>();
        result.setResponseMessage(msg);
        return result;
    }

    /**
     * 返回成功结果
     *
     * @param data 结果值
     */
    public static <T> ResultInfo<T> success(T data) {
        ResultInfo<T> result = new ResultInfo<>();
        result.setData(data);
        return result;
    }

    /**
     * 返回成功结果
     *
     * @param msg  消息
     * @param data 结果值
     * @param <T>  类型
     */
    public static <T> ResultInfo<T> success(String msg, T data) {
        ResultInfo<T> result = new ResultInfo<>();
        result.setData(data);
        result.setResponseMessage(msg);
        return result;
    }

    /**
     * 返回失败结果
     *
     */
    public static <T> ResultInfo<T> failure() {
        ResultInfo<T> result = new ResultInfo<>();
        result.setResponseCode(300);
        result.setResponseMessage("操作失败");
        return result;
    }

    /**
     * 返回失败结果
     *
     * @param msg 消息
     */
    public static <T> ResultInfo<T> failure(String msg) {
        ResultInfo<T> result = new ResultInfo<>();
        result.setResponseCode(300);
        result.setResponseMessage(msg);
        return result;
    }

    /**
     * 返回失败结果
     *
     * @param code 状态码
     * @param msg  消息
     */
    public static <T> ResultInfo<T> failure(int code, String msg) {
        ResultInfo<T> result = new ResultInfo<>();
        result.setResponseCode(code);
        result.setResponseMessage(msg);
        return result;
    }
}

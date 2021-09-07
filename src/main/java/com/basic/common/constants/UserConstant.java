package com.basic.common.constants;

/**
 * 用户设置全局变量
 */
public class UserConstant {
    public static final int USER_NAME_LENGTH_MIN = 2;//用户名最小长度
    public static final int USER_NAME_LENGTH_MAX = 20;//用户名最大长度

    public static final int USER_PASSWORD_LENGTH_MIN = 5;//用户密码最小长度

    public static final boolean LOGIN_FAIL_LOCK = true;//登录失败锁定机制
    public static final int LOGIN_FAIL_LOCK_NUM = 5;//登录失败锁定次数，连续登录失败次数后锁定账号
    public static final int LOGIN_FAIL_LOCK_TIME = 1 * 60 * 1000;//登录失败锁定时间，单位毫秒

}

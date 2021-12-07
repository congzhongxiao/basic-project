package com.basic.common.constants;

/**
 * 用户设置全局变量
 */
public class UserConstant {
    public static final int USER_NAME_LENGTH_MIN = 2;//用户名最小长度
    public static final int USER_NAME_LENGTH_MAX = 20;//用户名最大长度

    public static final int USER_PASSWORD_LENGTH_MIN = 8;//用户密码最小长度
    public static final int USER_PASSWORD_LENGTH_MAX = 20;//用户密码最大长度

    //正则匹配密码规则，必须由大写小写字母和数字组成。
    public static final String USER_PASSWORD_RULE = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{"+ USER_PASSWORD_LENGTH_MIN +"," + USER_PASSWORD_LENGTH_MAX +"}$";

    public static final boolean LOGIN_FAIL_LOCK = true;//登录失败锁定机制
    public static final int LOGIN_FAIL_LOCK_NUM = 5;//登录失败锁定次数，连续登录失败次数后锁定账号
    public static final int LOGIN_FAIL_LOCK_TIME = 2 * 60 * 1000;//登录失败锁定时间，单位毫秒

    //用户默认重置密码后的初始密码
    public static final String USER_RESET_DEFAULT_PASSWORD = "12345678";

    //用户密码修改周期失效检查机制
    public static final boolean USER_PASSWORD_INVALID_CHECK = false;
    //用户密码修改周期
    public static final int USER_PASSWORD_INVALID_TIME = 1000 * 60 * 60 * 24 * 30 * 3 ;


    //登录信息RSA加密私钥
    public static final String LOGIN_RSA_PRIVATE_KEY = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJ8mAjk3i9X41KnwmVx1CBCoX6/DjsmDYLN86QhKynI/m39uAR1Wt1H+/s7A84Z6WiF16ued16caKpA19rOzCOnQFcGYBhq6Fcui1QrllPEFK5dPydapOYPKJSLMK9Ov61XI749l3XG3EloRSPBbq27a5dfDQUyxRLrIuKV7UddXAgMBAAECgYApkQbRpOVb/IKm5BVaJaL2ntNnF7+KeErgdkZzCP25O03EyZl27TgyLVSl8ZVpUTmLNb4lwn8ZwObPBZkqtB8mcFWz6vIPKhOkWLLc543UkFLSrG4+de4xaZb9s/JaJGJfUANfRdjKH4TnQpcWZ0jTTlpTfMd/dMGZoUrkW4bzUQJBAN/zJY17qZDuJJ9Yp1B/Y/UMrSKSHSMfAg2duY4E1SdVXBKEqC3jyjyspjrWLQgKDPUG3jac7JzanrpG7jHIwM8CQQC17LwRJtG2xm7KES0XgOcUhucyVXVpf4OE+gsr0MmE0wAA0+8kWiZrSpsQN7twehWexrQq3FY0fnlHMapE9FL5AkEAyB87e4b6K+zjBRHv0dtEs4I0ZSQ0rWHUL962Jdbjs1ZwBIxOzVM1MasGkKU7cGeq1Hrir+Li/ffOx58C07IVuQJAXA1KZ/9Vc/9aBcLFJzRhOKC+EVjujRApczq2Nlhx71R4lvKl+aXn9LgOWBlrLZGIqQtwFJPixrMMGLsHpdZeuQJAD5ueI8cxMm2b2VNL5nwlOh9EjgYmIIemzBMsgN5AtzvnLQV83CuAHbdYIrHGMMw/YQvystxUryoGfsIxtC6caA==";

    public static final String LOGIN_RSA_PUBLIC_KEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCfJgI5N4vV+NSp8JlcdQgQqF+vw47Jg2CzfOkISspyP5t/bgEdVrdR/v7OwPOGelohdernndenGiqQNfazswjp0BXBmAYauhXLotUK5ZTxBSuXT8nWqTmDyiUizCvTr+tVyO+PZd1xtxJaEUjwW6tu2uXXw0FMsUS6yLile1HXVwIDAQAB";

}

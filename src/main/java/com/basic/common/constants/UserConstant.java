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
    public static final String LOGIN_RSA_PRIVATE_KEY = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKerl+BKXdXNNdHnhCSaULIPVf8U" +
            "Lh2zlkgLKE5vxKfDUNRUODP/C+c4CAbY2cuODzeBRLUOOjQHohbOBlxPT2A/srIghIj9o+1v1SCZ" +
            "NjK/TrQNLZhgTMhoh+HHZkED1tLM6NoTpyCTk1mrfxTr6bLnXqjeP8lO6C6FfdIc/5LpAgMBAAEC" +
            "gYAJZ5qRPhqdT3FhYLcMxosYMbwFHsCncddQGzAbljFVp6L1BfRRFlE4mu/4UlmFDWbVGi8caLvj" +
            "BzqUROIec2RkTkrWpglyz5fWnqzn7QJkcssOFTMnwANzFyXHX7LRuZxMBV8JgEBj57boD5BDvk/C" +
            "wbQ3JxoLrX+yR3BeKD/kMQJBAOfOWQlzlwaprrzxtazJcrHUNhCNEfWVhqD8KTyn1b4i/qPexhB7" +
            "43eQwjnbsfQq8+8hhzI9ny4Na+qh/cMZ6bcCQQC5K5hDWd6r3AGErgfmadzw0i2+JH+CumIwyEWr" +
            "vXv0xzbvKem4YdOGyGMuNAJnwyDsDbdO4n5JSjN7wPnqDOhfAkAOr4wEhUY0LdvcLJQN9lVF3uPt" +
            "+IICxQ5adJ9IMHniKeVoDF0P/klS8eDcOYb0qSP7KmyeSjkjecY0fz7MdX/RAkAxDh2OajaVbPlx" +
            "/vDU1+LSYbwAjYbCSUJODiB2+QHnvQcOoRnr4O663Ed6LAkfGBCWuKOBYHt4SxIMjPkoSjcdAkEA" +
            "4OdEAlPgNdmXY4Rq0LWbVYPpZ1REPomuxgWvhaEsFgjkXDCtV2TdwKZ868sb3u/sC9Jo1mgidtaV" +
            "Swjh1PBSKA==";

    public static final String LOGIN_RSA_PUBLIC_KEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnq5fgSl3VzTXR54QkmlCyD1X/FC4ds5ZICyhOb8Snw1DUVDgz/wvnOAgG2NnLjg83gUS1Djo0B6IWzgZcT09gP7KyIISI/aPtb9UgmTYyv060DS2YYEzIaIfhx2ZBA9bSzOjaE6cgk5NZq38U6+my516o3j/JTuguhX3SHP+S6QIDAQAB";

}

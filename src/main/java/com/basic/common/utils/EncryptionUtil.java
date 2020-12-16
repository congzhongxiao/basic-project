package com.basic.common.utils;

/**
 * 加密工具类
 */
public class EncryptionUtil {

    public static String getRandomString(int length) {
        String string = "1234567890abcdefghijklmnopqrstuvwxyz";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int index = (int) Math.floor(Math.random() * string.length());//向下取整0-25
            sb.append(string.charAt(index));
        }
        return sb.toString();
    }
    public static String encryption(String str2, String salt) {
        return Md5Util.hash(str2 + salt);
    }

}

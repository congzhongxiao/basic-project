package com.basic.generator.utils;

/**
 * 名称转换
 */
public class NameUtil {
    private static final char SEPARATOR = '_';

    /**
     * 驼峰命名法工具
     */
    public static String nameName(String s) {
        if (s == null) {
            return null;
        }
        s = s.toLowerCase();
        StringBuilder sb = new StringBuilder(s.length());
        boolean upperCase = false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            if (c == SEPARATOR) {
                upperCase = true;
            } else if (upperCase) {
                sb.append(Character.toUpperCase(c));
                upperCase = false;
            } else {
                sb.append(c);
            }
        }

        return sb.toString();
    }

    /**
     * 驼峰命名法工具
     */
    public static String NameName(String s) {
        if (s == null) {
            return null;
        }
        s = nameName(s);
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }
}
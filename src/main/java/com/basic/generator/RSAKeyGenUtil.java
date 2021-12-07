package com.basic.generator;

import com.basic.common.constants.UserConstant;
import com.basic.common.utils.RSAUtil;

import java.util.Map;

public class RSAKeyGenUtil {
    public static void main(String[] args) throws Exception {
        Map<String, Object> keyMap = RSAUtil.genKeyPair();
        Object publicObj = keyMap.get(RSAUtil.PUBLIC_KEY_ENCODED);
        if (publicObj != null) {
            System.out.println("生成的公钥为：\r\n" + publicObj.toString());
        } else {
            System.out.println("生成公钥失败！");
        }
        Object privateObj = keyMap.get(RSAUtil.PRIVATE_KEY_ENCODED);
        if (privateObj != null) {
            System.out.println("生成的私钥为：\r\n" + privateObj.toString());
        } else {
            System.out.println("生成私钥失败！");
        }
    }

    public static void demo() throws Exception {
        String source = "abcdefghigklmnopqrstuvwxyz1234567890你好么";
        //公钥加密
        String encryptRes = RSAUtil.encrypt(source, UserConstant.LOGIN_RSA_PUBLIC_KEY);
        System.out.println("加密后的内容:\r\n" + encryptRes);
        System.out.println("解密后的内容:\r\n" + RSAUtil.decrypt(encryptRes, UserConstant.LOGIN_RSA_PRIVATE_KEY));

    }
}
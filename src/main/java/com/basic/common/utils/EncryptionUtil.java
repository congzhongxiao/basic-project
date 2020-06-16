package com.basic.common.utils;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import java.security.Key;
import java.security.spec.AlgorithmParameterSpec;
import java.util.HashMap;
import java.util.Map;

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

    public static String encryption(String str1, String str2, String salt) {
        return Md5Util.hash(str1 + str2 + salt).toString();
    }

    /**
     * 解密登录信息
     *
     * @param strKey
     * @param strData
     * @return
     * @throws Exception
     */
    public static String decrypt(String strKey, String strData) {
        try {
            Map<String, String> map = new HashMap<>();
            if (StringUtils.isEmpty(strData)) {
                return "";
            }
            if (StringUtils.isNotEmpty(strKey)) {
                if (strKey.length() < 16) {
                    strKey = strKey + "XXXXXXXXXXXXXXXX".substring(0, 16 - strKey.length());
                } else {
                    strKey = strKey.substring(0, 16);
                }
                byte[] byteKey = (strKey.substring(0, 8)).getBytes();
                byte[] byteVector = (strKey.substring(strKey.length() - 8, strKey.length())).getBytes();
                AlgorithmParameterSpec iv = new IvParameterSpec(byteVector);// 设置向量

                DESKeySpec keySpec = new DESKeySpec(byteKey);// 设置密钥参数
                SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");// 获得密钥工厂
                Key key = keyFactory.generateSecret(keySpec);// 得到密钥对象;

                Cipher deCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
                deCipher.init(Cipher.DECRYPT_MODE, key, iv);
                byte[] pasByte = deCipher.doFinal(Base64.decodeBase64(strData));
                return new String(pasByte, "UTF-8");
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }
}

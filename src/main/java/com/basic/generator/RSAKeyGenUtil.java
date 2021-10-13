package com.basic.generator;

import sun.misc.BASE64Encoder;

import java.security.*;

public class RSAKeyGenUtil {

    /**
     * 指定加密算法为RSA
     */
    private static final String ALGORITHM = "RSA";
    /**
     * 密钥长度，用来初始化
     */
    private static final int KEYSIZE = 1024;

    public static void main(String[] args) throws Exception {
        genKeyPair();
    }

    /**
     * 生成密钥对
     */
    private static void genKeyPair() throws NoSuchAlgorithmException {

        /** RSA算法要求有一个可信任的随机数源 */
        SecureRandom secureRandom = new SecureRandom();

        /** 为RSA算法创建一个KeyPairGenerator对象 */
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(ALGORITHM);

        /** 利用上面的随机数据源初始化这个KeyPairGenerator对象 */
        keyPairGenerator.initialize(KEYSIZE, secureRandom);
        //keyPairGenerator.initialize(KEYSIZE);

        /** 生成密匙对 */
        KeyPair keyPair = keyPairGenerator.generateKeyPair();

        /** 得到公钥 */
        Key publicKey = keyPair.getPublic();

        /** 得到私钥 */
        Key privateKey = keyPair.getPrivate();

        byte[] publicKeyBytes = publicKey.getEncoded();
        byte[] privateKeyBytes = privateKey.getEncoded();

        String publicKeyBase64 = new BASE64Encoder().encode(publicKeyBytes);
        String privateKeyBase64 = new BASE64Encoder().encode(privateKeyBytes);

        System.out.println("公钥长度:" + publicKeyBase64.length());
        System.out.println("公钥内容:" + publicKeyBase64);

        System.out.println("秘钥长度:" + privateKeyBase64.length());
        System.out.print("秘钥内容:" + privateKeyBase64);
    }
}
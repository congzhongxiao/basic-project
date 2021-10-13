package com.basic.common.utils;

import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import javax.crypto.Cipher;

import com.basic.common.constants.UserConstant;
import org.apache.commons.codec.binary.Base64;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class RSAUtil {

    /** 指定加密算法为RSA */
    private static final String ALGORITHM = "RSA";

   /* public static void main(String[] args) throws Exception {

        String source = "深圳,您好!";// 要加密的字符串
        System.out.println("准备用公钥加密的字符串为：" + source);

        String cryptograph = encrypt(source);// 生成的密文
        System.out.print("用公钥加密后的结果为:" + cryptograph);
        System.out.println();

        String target = decrypt(cryptograph);// 解密密文
        System.out.println("用私钥解密后的字符串为：" + target);
        System.out.println();
    }*/

    /**
     * 加密方法
     * @param source 源数据
     * @return
     * @throws Exception
     */
    public static String encrypt(String source) throws Exception {

        java.security.spec.X509EncodedKeySpec x509KeySpec = new java.security.spec.X509EncodedKeySpec(Base64.decodeBase64(UserConstant.LOGIN_RSA_PUBLIC_KEY));
        // RSA算法
        java.security.KeyFactory keyFactory = java.security.KeyFactory.getInstance("RSA");
        // 取公钥匙对象
        java.security.PublicKey publicKey = keyFactory.generatePublic(x509KeySpec);
        // 得到Cipher对象来实现对源数据的RSA加密
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] b = source.getBytes();
        /** 执行加密操作 */
        byte[] b1 = cipher.doFinal(b);
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(b1);
    }

    /**
     * 解密算法
     * @param cryptograph    密文
     * @return
     * @throws Exception
     */
    public static String decrypt(String cryptograph) throws Exception {

        PKCS8EncodedKeySpec priPKCS8 = new PKCS8EncodedKeySpec(Base64.decodeBase64(UserConstant.LOGIN_RSA_PRIVATE_KEY));
        KeyFactory keyf = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyf.generatePrivate(priPKCS8);

        /** 得到Cipher对象对已用公钥加密的数据进行RSA解密 */
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] b1 = decoder.decodeBuffer(cryptograph);

        /** 执行解密操作 */
        byte[] b = cipher.doFinal(b1);
        return new String(b);
    }
}
package com.basic.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 全局配置
 * 项目整体配置信息
 */
@Component
@ConfigurationProperties(prefix = "system")
public class Global {
    private static String name;//项目名称
    private static String version;//版本
    private static String staticVersion;//静态资源版本号
    private static String copyright;//版权年份
    private static String profile;//上传路径
    private static boolean captchaLogin;//验证码登录开关
    private static String captchaType;//验证码类型
    private static boolean requestLog;//网络访问日志开关
    private static boolean addressEnabled;//获取ip地址开关

    private static String skins;//后台皮肤

    public static String getSkins() {
        return skins;
    }

    public void setSkins(String skins) {
        Global.skins = skins;
    }

    public static final String RESOURCE_PREFIX = "/profile";


    public static boolean isRequestLog() {
        return requestLog;
    }

    public void setRequestLog(boolean requestLog) {
        Global.requestLog = requestLog;
    }

    public static String getStaticVersion() {
        return staticVersion;
    }

    public void setStaticVersion(String staticVersion) {
        Global.staticVersion = staticVersion;
    }

    public static boolean isCaptchaLogin() {
        return captchaLogin;
    }

    public void setCaptchaLogin(boolean captchaLogin) {
        Global.captchaLogin = captchaLogin;
    }

    public static String getCaptchaType() {
        return captchaType;
    }

    public void setCaptchaType(String captchaType) {
        Global.captchaType = captchaType;
    }

    public static String getName() {
        return name;
    }

    public void setName(String name) {
        Global.name = name;
    }

    public static String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        Global.version = version;
    }

    public static String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        Global.copyright = copyright;
    }

    public static String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        Global.profile = profile;
    }

    public static boolean isAddressEnabled() {
        return addressEnabled;
    }

    public void setAddressEnabled(boolean addressEnabled) {
        Global.addressEnabled = addressEnabled;
    }

    /**
     * 获取头像上传路径
     */
    public static String getAvatarPath() {
        return getProfile() + "/avatar";
    }

    /**
     * 获取下载路径
     */
    public static String getDownloadPath() {
        return getProfile() + "/download/";
    }

    /**
     * 获取上传路径
     */
    public static String getUploadPath() {
        return getProfile() + "/upload";
    }

}

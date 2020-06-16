package com.basic.generator;



import com.basic.common.utils.DateUtils;
import com.basic.generator.entity.BaseInfo;
import com.basic.generator.entity.ClassPathInfo;
import com.basic.generator.entity.DBInfo;
import com.basic.generator.entity.PageInfo;
import com.basic.generator.service.CreateCodeService;

import java.io.File;

/**
 * 人工代码生成器，嘿嘿嘿
 */
public class MainGenerator {
    static String url = "jdbc:mysql://localhost:3306/basic-project?serverTimezone=Asia/Shanghai";//数据库连接字符串
    static String username = "root";//用户名
    static String password = "root";//密码
    static String driverName = "com.mysql.cj.jdbc.Driver";//数据库驱动
    static String tableName = "product_file";


    public static void main(String[] args) {
        System.out.println("欢迎使用代码生成器！");
        DBInfo dbInfo = new DBInfo(url,username,password,driverName);
        BaseInfo baseInfo = new BaseInfo();
        baseInfo.setAuthor("lee");
        baseInfo.setFunctionName("作品文件表");
        baseInfo.setDeleteKey("isdel");
        baseInfo.setCreateDate(DateUtils.dateTimeNow("yyyy-MM-dd HH:mm:ss"));
        PageInfo pageInfo = new PageInfo();
        pageInfo.setParentPage("com.basic");
        pageInfo.setControllerPage("controller.product");
        ClassPathInfo classPathInfo = new ClassPathInfo();
        classPathInfo.setDefaultPath("basic-project");
        classPathInfo.setDefault(false);
        classPathInfo.setHtmlPath("src"+
                File.separator+"main" +
                File.separator + "resources" +
                File.separator + "templates" +
                File.separator+ "product");
        new CreateCodeService(dbInfo,tableName,baseInfo,pageInfo,classPathInfo).init();
    }
}

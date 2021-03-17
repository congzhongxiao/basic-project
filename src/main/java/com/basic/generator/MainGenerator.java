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
    static String tableName = "sys_organization";


    public static void main(String[] args) {
        System.out.println("欢迎使用代码生成器！");
        DBInfo dbInfo = new DBInfo(url,username,password,driverName);
        BaseInfo baseInfo = new BaseInfo();
        baseInfo.setAuthor("lee");
        baseInfo.setFunctionName("组织架构");
        baseInfo.setDeleteKey("");
        baseInfo.setCreateDate(DateUtils.dateTimeNow("yyyy-MM-dd HH:mm:ss"));
        PageInfo pageInfo = new PageInfo();
        pageInfo.setParentPage("com.basic");
        pageInfo.setControllerPage("controller.system.organization");
        ClassPathInfo classPathInfo = new ClassPathInfo();
        classPathInfo.setDefaultPath("basic-project");
        classPathInfo.setDefault(false);

        classPathInfo.setHtmlFolder("organization");//生成ftl页面文件目录
        //组装生成ftl路径，默认:src/main/resource/templates/下面
        classPathInfo.setHtmlPath(classPathInfo.getHtmlPath()+ File.separator + classPathInfo.getHtmlFolder());
        new CreateCodeService(dbInfo,tableName,baseInfo,pageInfo,classPathInfo).init();
    }
}

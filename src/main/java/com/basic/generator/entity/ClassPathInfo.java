package com.basic.generator.entity;

import lombok.Data;

import java.io.File;

/**
 * 路径设置，默认单模块环境中可以不用设置
 * 多模块路径中统一位置设置default
 * 文件区分设置配置不同路径前缀
 */
@Data
public class ClassPathInfo {
    String basePath= System.getProperty("user.dir");
    String javaPath="src" + File.separator + "main" + File.separator + "java";//默认java路径
    String xmlPath = "src" + File.separator + "main" + File.separator + "resources" + File.separator + "mapper";
    String htmlPath = "src" + File.separator + "main" + File.separator + "resources" + File.separator + "templates";
    String controllerModulePath="";
    String entityModulePath="";
    String mapperModulePath="";
    String mapperXmlModulePath="";
    String serviceModulePath="";
    String serviceImplModulePath="";
    String htmlModelPath ="";
    String defaultPath = "";//设置统一文件上传路径
    boolean isDefault = true;//设置是否统一上级文件夹，设置true，其他路径不生效
}

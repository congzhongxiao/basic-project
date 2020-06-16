package com.basic.generator.service;

import com.basic.generator.entity.*;
import com.basic.generator.utils.NameUtil;
import com.basic.generator.utils.TypeUtil;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.Data;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 代码生成类
 */
@Data
public class CreateCodeService {
    DBInfo dbInfo;//数据库配置
    String tableName;//表名
    BaseInfo baseInfo;//基本设置
    PageInfo pageInfo;
    ClassPathInfo classPathInfo;
    private Map<String, Object> contextMap;

    public void init() {
        System.out.println("1.开始获取字段信息·····");
        List<ColumnInfo> columnInfos = new ColumnInfoService(dbInfo, tableName).getColumns();//获取字段信息
        System.out.println("2.开始组装上下文信息·····");
        contextMap = new HashMap<>();
        System.out.println("        组装基本信息");
        initBase();//组装基本信息
        System.out.println("        组装名称信息");
        initName();//组装名称信息
        System.out.println("        组装包信息");
        contextMap.put("pageInfo", pageInfo);
        System.out.println("        组装字段信息");
        initColumnInfos(columnInfos);
        System.out.println("        信息组装完成");
        System.out.println("3.开始生成模板文件");
        create();
    }

    public void create() {
        try {
            Configuration configuration = new Configuration(Configuration.VERSION_2_3_23);
            configuration.setClassForTemplateLoading(CreateCodeService.class, baseInfo.getTemplatePath());
            createEntity(configuration);
            createMapper(configuration);
            createMapperXML(configuration);
            createService(configuration);
            createServiceImpl(configuration);
//            createUpdate(configuration);
//            createAdd(configuration);
//            createList(configuration);
//            createController(configuration);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void createController(Configuration configuration) throws Exception {
        System.out.println("    开始生成Controller文件");
        Template template = configuration.getTemplate("controller.ftl");
        String filepath = getJavaFilePath(classPathInfo.getControllerModulePath(),pageInfo.getControllerPage(),contextMap.get("controllerName").toString());
        File file = new File(filepath);
        genFile(file, template, contextMap);
        System.out.println("    文件生成完毕，生成路径：" + filepath);
    }


    private void createUpdate(Configuration configuration) throws Exception {
        System.out.println("    开始生成Update文件");
        Template template = configuration.getTemplate("update.ftl");
        String filepath = getHtmlFilePath(contextMap.get("updateName").toString());
        File file = new File(filepath);
        genFile(file, template, contextMap);
        System.out.println("    文件生成完毕，生成路径：" + filepath);
    }
    private void createAdd(Configuration configuration) throws Exception {
        System.out.println("    开始生成Add文件");
        Template template = configuration.getTemplate("add.ftl");
        String filepath = getHtmlFilePath(contextMap.get("addName").toString());
        File file = new File(filepath);
        genFile(file, template, contextMap);
        System.out.println("    文件生成完毕，生成路径：" + filepath);
    }

    private String getHtmlFilePath(String name){
        String path = "";
        path += classPathInfo.getBasePath() + File.separator
                + (classPathInfo.isDefault() ? classPathInfo.getDefaultPath() : classPathInfo.getHtmlModelPath()) + File.separator + classPathInfo.getHtmlPath();
        return path + File.separator + name + ".ftl";
    }

    private void createList(Configuration configuration) throws Exception {
        System.out.println("    开始生成List文件");
        Template template = configuration.getTemplate("list.ftl");
        String filepath = getHtmlFilePath(contextMap.get("listName").toString());
        File file = new File(filepath);
        genFile(file, template, contextMap);
        System.out.println("    文件生成完毕，生成路径：" + filepath);
    }


    private void createServiceImpl(Configuration configuration) throws Exception {
        System.out.println("    开始生成ServiceImpl文件");
        Template template = configuration.getTemplate("serviceImpl.ftl");
        String filepath = getJavaFilePath(classPathInfo.getServiceImplModulePath(),pageInfo.getServiceImplPage(),contextMap.get("serviceImplName").toString());
        File file = new File(filepath);
        genFile(file, template, contextMap);
        System.out.println("    ServiceImpl文件生成完毕，生成路径：" + filepath);
    }

    private void createService(Configuration configuration) throws Exception {
        System.out.println("    开始生成Service文件");
        Template template = configuration.getTemplate("service.ftl");
        String filepath = getJavaFilePath(classPathInfo.getServiceModulePath(),pageInfo.getServicePage(),contextMap.get("serviceName").toString());
        File file = new File(filepath);
        genFile(file, template, contextMap);
        System.out.println("    文件生成完毕，生成路径：" + filepath);
    }

    private void createMapperXML(Configuration configuration) throws Exception {
        System.out.println("    开始生成mapperXml文件");
        Template mapperXmlTemplate = configuration.getTemplate("mapperXml.ftl");
        String mapperXmlPath = "";
        mapperXmlPath += classPathInfo.getBasePath() + File.separator
                + (classPathInfo.isDefault() ? classPathInfo.getDefaultPath() : classPathInfo.getMapperModulePath()) + File.separator + classPathInfo.getXmlPath();
        String filepath = mapperXmlPath + File.separator + contextMap.get("mapperXmlName") + ".xml";
        File file = new File(filepath);
        genFile(file, mapperXmlTemplate, contextMap);
        System.out.println("    文件生成完毕，生成路径：" + filepath);
    }


    private void createMapper(Configuration configuration) throws Exception {
        System.out.println("    开始生成Mapper文件");
        Template mapperTemplate = configuration.getTemplate("mapper.ftl");
        String filepath = getJavaFilePath(classPathInfo.getMapperModulePath(),pageInfo.getMapperPage(),contextMap.get("mapperName").toString());
        File file = new File(filepath);
        genFile(file, mapperTemplate, contextMap);
        System.out.println("    文件生成完毕，生成路径：" + filepath);
    }

    private void createEntity(Configuration configuration) throws Exception {
        System.out.println("    开始生成entity文件");
        Template entityTemplate = configuration.getTemplate("entity.ftl");
        String filepath = getJavaFilePath(classPathInfo.getEntityModulePath(),pageInfo.getEntityPage(),contextMap.get("entityName").toString());
        File file = new File(filepath);
        genFile(file, entityTemplate, contextMap);
        System.out.println("    文件生成完毕，生成路径：" + filepath);
    }
    private String getJavaFilePath(String classPath,String pagePath,String className){
        String path = "";
        path += classPathInfo.getBasePath() + File.separator
                + (classPathInfo.isDefault() ? classPathInfo.getDefaultPath() : classPath) + File.separator + classPathInfo.getJavaPath();

        String page = pageInfo.getParentPage() + "." + pagePath;
        path += File.separator+ page.replace(".", File.separator);

        return path + File.separator + className + ".java";
    }


    private static void genFile(File file, Template template, Map<String, Object> params) throws IOException {
        File parentFile = file.getParentFile();
        // 创建目录
        if (null != parentFile && !parentFile.exists()) {
            parentFile.mkdirs();
        }
        //创建输出流
        Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
        //输出模板和数据模型都对应的文件
        try {
            template.process(params, writer);
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }


    public void initColumnInfos(List<ColumnInfo> columnInfos) {
        // 是否包含 Timestamp 类型
        contextMap.put("hasTimestamp", false);
        // 是否包含 BigDecimal 类型
        contextMap.put("hasBigDecimal", false);
        // 是否为自增主键
        contextMap.put("auto", false);
        List<Map<String, Object>> columns = new ArrayList<>();
        if (columnInfos != null) {
            for (ColumnInfo columnInfo : columnInfos) {
                Map<String, Object> column = new HashMap<>();
                column.put("columnComment", columnInfo.getColumnComment());
                column.put("columnKey", columnInfo.getColumnKey());
                column.put("isPK","no");
                String colType = TypeUtil.translateToJava(columnInfo.getColumnType().toString());
                String changeColumnName = NameUtil.nameName(columnInfo.getColumnName().toString());
                column.put("deleteKey",baseInfo.getDeleteKey());
                if ("PRI".equals(columnInfo.getColumnKey())) {
                    column.put("pkColumnType", colType);
                    column.put("pkChangeColName", changeColumnName);
                    column.put("isPK","yes");
                }
                if ("Date".equals(colType)) {
                    column.put("hasTimestamp", true);
                }
                if ("BigDecimal".equals(colType)) {
                    column.put("hasBigDecimal", true);
                }
                if ("auto_increment".equals(columnInfo.getExtra())) {
                    column.put("auto", true);
                }
                column.put("columnType", colType);
                column.put("columnName", columnInfo.getColumnName());
                column.put("isNullable", columnInfo.getIsNullable());
                column.put("changeColumnName", changeColumnName);
                columns.add(column);
            }
        }
        contextMap.put("columns", columns);
    }

    //基本信息组装
    public void initBase() {
        contextMap.put("author", baseInfo.getAuthor());
        contextMap.put("createDate", baseInfo.getCreateDate());
        contextMap.put("functionName", baseInfo.getFunctionName());
    }

    //名称组装
    public void initName() {
        String entityName = NameUtil.NameName(tableName);
        String varName = NameUtil.nameName(tableName);
        String mapperName = entityName + "Mapper";
        String mapperXmlName = entityName + "Mapper";
        String serviceName = entityName + "Service";
        String serviceImplName = entityName + "ServiceImpl";
        String listName = tableName + "_list";
        String addName = tableName + "_add";
        String updateName = tableName + "_update";
        String controllerName = entityName + "Controller";
        contextMap.put("tableName",tableName);
        contextMap.put("varName",varName);
        contextMap.put("entityName", entityName);
        contextMap.put("mapperName", mapperName);
        contextMap.put("mapperXmlName", mapperXmlName);
        contextMap.put("serviceName", serviceName);
        contextMap.put("serviceImplName", serviceImplName);
        contextMap.put("listName", listName);
        contextMap.put("addName", addName);
        contextMap.put("updateName", updateName);
        contextMap.put("controllerName", controllerName);
    }

    public CreateCodeService(DBInfo dbInfo, String tableName, BaseInfo baseInfo, PageInfo pageInfo, ClassPathInfo classPathInfo) {
        this.dbInfo = dbInfo;
        this.tableName = tableName;
        this.baseInfo = baseInfo;
        this.pageInfo = pageInfo;
        this.classPathInfo = classPathInfo;
    }
}

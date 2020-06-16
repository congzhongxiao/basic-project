package com.basic.generator.entity;

import lombok.Data;

@Data
public class BaseInfo {
    String author="";//作者
    String createDate="";//创建时间
    String functionName="";//功能名称
    String tableType = "table";//表格类型：table/tree
    String templatePath = "/gen_template";
    String deleteKey = "";//软删除标记字段

}

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${pageInfo.parentPage}.${pageInfo.mapperPage}.${mapperName}">

    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${pageInfo.parentPage}.${pageInfo.entityPage}.${entityName}">
        <#list columns as column>
        <#if column.isPK == "yes">
        <id column="${column.columnName}" property="${column.changeColumnName}" />
        </#if>
        </#list>
        <#list columns as column>
        <#if column.isPK == "no">
        <result column="${column.columnName}" property="${column.changeColumnName}" />
        </#if>
        </#list>
    </resultMap>

</mapper>

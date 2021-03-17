package ${pageInfo.parentPage}.${pageInfo.entityPage};

import lombok.Data;
import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

/**
*${functionName}实体类
*@author: ${author}
*@time: ${createDate}
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("${tableName}")
public class ${entityName} extends Model<${entityName}> {
    private static final long serialVersionUID = 1L;
<#list columns as column>
    /**
    *${column.columnComment}
    */
    <#if column.isPK == "yes" >
    @TableId(value = "${column.columnName}", type = IdType.ID_WORKER_STR)
    private ${column.pkColumnType} ${column.changeColumnName};
    <#else >
    <#if column.deleteKey == column.changeColumnName>
    @TableLogic
    </#if>
    <#if column.columnName == 'create_by'>
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    <#elseif column.columnName == 'create_time'>
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    <#elseif column.columnName == 'update_time'>
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    <#elseif column.columnName == 'update_by'>
    @TableField(value = "update_by", fill = FieldFill.INSERT_UPDATE)
    </#if>
    <#if column.columnType == "Date">
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date ${column.changeColumnName};
    <#elseif column.columnType == "DateTime">
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date ${column.changeColumnName};
    <#else >
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    </#if>

</#list>

}

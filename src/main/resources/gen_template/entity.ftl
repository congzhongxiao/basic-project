package ${pageInfo.parentPage}.${pageInfo.entityPage};

import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
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
    <#if column.columnType == "Date">
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    </#if>
    private ${column.columnType} ${column.changeColumnName};
    </#if>

</#list>

}

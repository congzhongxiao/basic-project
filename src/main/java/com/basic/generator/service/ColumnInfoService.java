package com.basic.generator.service;

import com.basic.generator.entity.ColumnInfo;
import com.basic.generator.entity.DBInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.util.ObjectUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 获取字段信息服务
 */
@Data
@AllArgsConstructor
public class ColumnInfoService {
    DBInfo dbInfo;
    String tableName;

    /**
     * 加载获取字段信息
     * @return
     */
    public List<ColumnInfo> getColumns() {
        try {
            Class.forName(dbInfo.getDriverName());
            Connection conn = DriverManager.getConnection(dbInfo.getUrl(), dbInfo.getUsername(), dbInfo.getPassword());

            StringBuilder sql = new StringBuilder("select column_name, is_nullable, data_type, column_comment, column_key, extra from information_schema.columns where ");
            if (!ObjectUtils.isEmpty(getTableName())) {
                sql.append("table_name = '").append(getTableName()).append("' ");
            }
            sql.append("and table_schema = (select database()) order by ordinal_position");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql.toString());
            List<ColumnInfo> columnInfos = new ArrayList<>();
            while (rs.next()) {
                ColumnInfo columnInfo = new ColumnInfo();
                columnInfo.setColumnName(rs.getString("column_name"));
                columnInfo.setIsNullable(rs.getString("is_nullable"));
                columnInfo.setColumnType(rs.getString("data_type"));
                columnInfo.setColumnComment(rs.getString("column_comment"));
                columnInfo.setColumnKey(rs.getString("column_key"));
                columnInfos.add(columnInfo);
            }
            return columnInfos;
        } catch (Exception e) {
            return null;
        }
    }
}

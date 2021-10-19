package com.basic.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.basic.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
*人员信息实体类
*@author: lee
*@time: 2020-05-07 10:03:33
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("person")
public class Person extends Model<Person> {
    private static final long serialVersionUID = 1L;
    /**
    *主键
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
    *名称
    */
    @Excel(name = "姓名")
    private String name;

    /**
    *年龄
    */
    @Excel(name = "年龄")
    private Integer age;

    /**
    *出生日期
    */
    @Excel(name = "出生日期",dateFormat="yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @TableField(updateStrategy= FieldStrategy.IGNORED)
    private Date birthday;

    /**
    *性别
    */
    @Excel(name = "性别",readConverterExp = "1=男,2=女,0=保密",type = Excel.Type.EXPORT)
    private Integer gender;

    @Excel(name = "性别",type = Excel.Type.IMPORT)
    @TableField(exist = false)
    private String strGender;//导入用字段

    /**
    *地址
    */
    @Excel(name = "地址")
    private String address;

    /**
    *简介
    */
    @Excel(name = "简介")
    private String summary;

    /**
     *创建账号
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
     *创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     *更新账号
     */
    @TableField(value = "update_by", fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    /**
     *更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;


}

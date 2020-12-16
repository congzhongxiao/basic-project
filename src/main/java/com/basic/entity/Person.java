package com.basic.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.basic.common.annotation.Excel;
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
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
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
    *创建用户
    */
    private String createBy;

    /**
    *创建时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
    *更新用户
    */
    private String updateBy;

    /**
    *更新时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;


}

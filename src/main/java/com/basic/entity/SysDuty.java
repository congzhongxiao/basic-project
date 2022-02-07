package com.basic.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

/**
*职务实体类
*@author: djy
*@time: 2022-01-21 14:24:47
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_duty")
public class SysDuty extends Model<SysDuty> {
private static final long serialVersionUID = 1L;
    /**
    *主键
    */
        @TableId(value = "id", type = IdType.ASSIGN_ID)
        private String id;

    /**
    *职务名称
    */
            private String dutyName;

    /**
    *职务简介
    */
            private String dutyDescription;

    /**
    *浏览权限：0只能浏览个人信息1可以浏览所属部门信息2可以浏览部门及下属信息3可以浏览本公司数据4可以浏览本公司及以下数据5可以浏览所有信息
    */
            private Integer dutyLimit;

    /**
    *职务编码
    */
            private String code;

    /**
    *创建者id
    */
            private String createId;

    /**
    *创建者名称
    */
            private String createName;

    /**
    *创建时间
    */
            @TableField(value = "create_time", fill = FieldFill.INSERT)
            @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
            @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
            private Date createTime;

    /**
    *更新人id
    */
            private String updateId;

    /**
    *更新人名称
    */
            private String updateName;

    /**
    *更新时间
    */
            @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
            @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
            @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
            private Date updateTime;


}

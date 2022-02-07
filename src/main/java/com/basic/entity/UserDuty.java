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
*用户职务表实体类
*@author: djy
*@time: 2022-01-21 14:26:49
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_user_duty")
public class UserDuty extends Model<UserDuty> {
private static final long serialVersionUID = 1L;
    /**
    *主键
    */
        @TableId(value = "id", type = IdType.ASSIGN_ID)
        private String id;

    /**
    *用户id
    */
            private String userId;

    /**
    *部门id
    */
            private String deptId;

    /**
    *部门编号
    */
            private String deptCode;

    /**
    *公司id
    */
            private String companyId;

    /**
    *公司编码
    */
            private String companyCode;

    /**
    *兼职id
    */
            private String dutyId;

    /**
    *部门名称
    */
            private String deptName;

    /**
    *公司名称
    */
            private String companyName;

    /**
    *兼职名称
    */
            private String dutyName;

    /**
    *兼职编码
    */
            private String code;

    /**
    *是否为主要职务0主要职务1兼职
    */
            private Integer isMain;

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

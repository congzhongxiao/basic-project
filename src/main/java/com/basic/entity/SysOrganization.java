package com.basic.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

/**
*组织架构实体类
*@author: lee
*@time: 2021-03-17 15:22:02
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_organization")
public class SysOrganization extends Model<SysOrganization> {
    private static final long serialVersionUID = 1L;
    /**
    *组织id
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
    *父级组织id
    */
    private String pid;

    /**
    *祖级列表
    */
    private String ancestors;

    /**
    *组织名称
    */
    private String name;

    /**
    *显示顺序
    */
    private Integer sort;

    /**
    *负责人
    */
    private String leader;

    /**
    *联系电话
    */
    private String phone;

    /**
    *邮箱
    */
    private String email;

    /**
    *状态（0正常 1停用）
    */
    private Integer status;

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

    /**
    *组织类型：0公司 1部门
    */
    private String orgType;

    /**
     * 编码
     */
    private String code;
}

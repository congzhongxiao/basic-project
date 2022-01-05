package com.basic.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import java.util.Date;

/**
 * 行政区划实体类
 *
 * @author: lee
 * @time: 2020-11-12 10:07:45
 */

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_area")
public class SysArea extends Model<SysArea> {
    private static final long serialVersionUID = 1L;
    /**
     * 地区id
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 父级id
     */
    private String pid;

    /**
     * 祖级列表
     */
    private String ancestors;

    /**
     * 区划编码
     */
    @NotEmpty(message = "区划编码不能为空")
    private String code;

    /**
     * 地区名称
     */
    private String name;

    /**
     * 显示顺序
     */
    private Integer sort;

    /**
     * 创建账号
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新账号
     */
    @TableField(value = "update_by", fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
     * 是否叶子节点，是1否0
     */
    @TableField(exist = false)
    private String isLeaf;


}

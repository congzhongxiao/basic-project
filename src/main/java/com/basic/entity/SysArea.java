package com.basic.entity;

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

import javax.validation.constraints.NotEmpty;

/**
*行政区划实体类
*@author: lee
*@time: 2020-11-12 10:07:45
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_area")
public class SysArea extends Model<SysArea> {
    private static final long serialVersionUID = 1L;
    /**
    *地区id
    */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
    *父级id
    */
    private String pid;

    /**
    *祖级列表
    */
    private String ancestors;

    /**
    *区划编码
    */
    @NotEmpty(message = "区划编码不能为空")
    private String code;

    /**
    *地区名称
    */
    private String name;

    /**
    *显示顺序
    */
    private Integer sort;

    /**
    *创建人
    */
    private String createBy;

    /**
    *创建时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
    *更新人
    */
    private String updateBy;

    /**
    *更新时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;


}

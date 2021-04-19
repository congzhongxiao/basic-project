package com.basic.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
*产品实体类
*@author: lee
*@time: 2020-04-27 10:58:14
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("product")
public class Product extends Model<Product> {
    private static final long serialVersionUID = 1L;
    /**
    *主键
    */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
    *名称
    */
    private String name;

    /**
    *作者
    */
    private String author;

    /**
    *描述
    */
    private String detail;
    private String cutId;
    private String cutUrl;

    //缩略图片id
    private String shortId;
    /**
    *缩略图
    */
    private String shortImage;

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

    private String content;


}

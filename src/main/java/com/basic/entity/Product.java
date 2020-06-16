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
    //缩略图片id
    private String shortId;
    /**
    *缩略图
    */
    private String shortImage;

    /**
    *创建人
    */
    private String createBy;

    /**
    *创建时间
    */
    private Date createTime;

    /**
    *修改人
    */
    private String updateBy;

    /**
    *修改时间
    */
    private Date updateTime;


}

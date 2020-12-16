package com.basic.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
*产品图片实体类
*@author: lee
*@time: 2020-04-27 10:51:58
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("product_image")
public class ProductImage extends Model<ProductImage> {
    private static final long serialVersionUID = 1L;
    /**
    *作品主键
    */
    private String productId;

    /**
    *图片主键
    */
    private String imageId;


}

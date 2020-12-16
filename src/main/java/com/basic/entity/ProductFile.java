package com.basic.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
*作品文件表实体类
*@author: lee
*@time: 2020-06-08 14:54:54
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("product_file")
public class ProductFile extends Model<ProductFile> {
    private static final long serialVersionUID = 1L;
    /**
    *作品id
    */
    private String productId;

    /**
    *文件id
    */
    private String fileId;


}

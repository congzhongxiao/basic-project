package com.basic.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.ProductImage;

import java.util.Map;

/**
*产品图片 Service
*@author: lee
*@time: 2020-04-27 10:51:58
*/
public interface ProductImageService extends IService<ProductImage> {
    boolean add(ProductImage productImage);
    IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam);
}
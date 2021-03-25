package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.utils.PageUtil;
import com.basic.entity.ProductImage;
import com.basic.mapper.ProductImageMapper;
import com.basic.service.ProductImageService;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
*产品图片ServiceImpl
*@author: lee
*@time: 2020-04-27 10:51:58
*/
@Service
public class ProductImageServiceImpl extends ServiceImpl<ProductImageMapper, ProductImage> implements ProductImageService {
    //添加
    public boolean add(ProductImage productImage) {
        try {
            baseMapper.insert(productImage);
            return true;
        } catch(Exception e) {
            return false;
        }
    }
}

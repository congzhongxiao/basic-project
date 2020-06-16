package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.utils.PageUtil;

import com.basic.entity.Product;
import com.basic.service.ProductService;
import com.basic.mapper.ProductMapper;

import java.util.Map;
/**
*产品ServiceImpl
*@author: lee
*@time: 2020-04-27 10:58:14
*/
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {
    //添加
    public boolean add(Product product) {
        try {
            baseMapper.insert(product);
            return true;
        } catch(Exception e) {
            return false;
        }
    }

    //分页查询
    public IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam){
        Page<Product> page = new PageUtil<Product>(queryParam).getPage();
        QueryWrapper<Product> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return mapIPage;
        }

}

package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.entity.Product;

import java.util.List;
import java.util.Map;

/**
*产品 Service
*@author: lee
*@time: 2020-04-27 10:58:14
*/
public interface ProductService extends IService<Product> {
    IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam);
    boolean addProduct(Product product, List<String> mainImageIds,List<String> tempFileIds);
    boolean updateProduct(Product product, List<String> mainImageIds,List<String> tempFileIds);
    boolean removeProduct(String id);
}
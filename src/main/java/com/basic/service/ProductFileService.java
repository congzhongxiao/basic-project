package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.common.domain.Result;
import com.basic.entity.ProductFile;

import java.util.Map;

/**
*作品文件表 Service
*@author: lee
*@time: 2020-06-08 14:54:54
*/
public interface ProductFileService extends IService<ProductFile> {
    boolean add(ProductFile productFile);
}
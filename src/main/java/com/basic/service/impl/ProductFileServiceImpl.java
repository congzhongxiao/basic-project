package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;
import com.basic.entity.ProductFile;
import com.basic.mapper.ProductFileMapper;
import com.basic.service.ProductFileService;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
*作品文件表ServiceImpl
*@author: lee
*@time: 2020-06-08 14:54:54
*/
@Service
public class ProductFileServiceImpl extends ServiceImpl<ProductFileMapper, ProductFile> implements ProductFileService {
    //添加
    public boolean add(ProductFile productFile) {
        try {
            baseMapper.insert(productFile);
            return true;
        } catch(Exception e) {
            return false;
        }
    }
}

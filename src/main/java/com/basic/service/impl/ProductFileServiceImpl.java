package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.utils.PageUtil;

import com.basic.entity.ProductFile;
import com.basic.service.ProductFileService;
import com.basic.mapper.ProductFileMapper;

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

    //分页查询
    public IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam){
        Page<ProductFile> page = new PageUtil<ProductFile>(queryParam).getPage();
        QueryWrapper<ProductFile> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return mapIPage;
        }

}

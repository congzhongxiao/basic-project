package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.utils.PageUtil;

import com.basic.entity.UploadFiles;
import com.basic.service.UploadFilesService;
import com.basic.mapper.UploadFilesMapper;

import java.util.List;
import java.util.Map;
/**
*文件管理ServiceImpl
*@author: lee
*@time: 2020-04-27 10:43:49
*/
@Service
public class UploadFilesServiceImpl extends ServiceImpl<UploadFilesMapper, UploadFiles> implements UploadFilesService {

   public List<UploadFiles> selectImageByProductId(String productId){
        return baseMapper.selectImageByProductId(productId);
    }

   public List<UploadFiles> selectFileByProductId(String productId){
        return baseMapper.selectFileByProductId(productId);
    }
    //添加
    public boolean add(UploadFiles uploadFiles) {
        try {
            baseMapper.insert(uploadFiles);
            return true;
        } catch(Exception e) {
            return false;
        }
    }

    //分页查询
    public IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam){
        Page<UploadFiles> page = new PageUtil<UploadFiles>(queryParam).getPage();
        QueryWrapper<UploadFiles> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return mapIPage;
        }

}

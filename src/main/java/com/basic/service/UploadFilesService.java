package com.basic.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.UploadFiles;

import java.util.List;
import java.util.Map;

/**
*文件管理 Service
*@author: lee
*@time: 2020-04-27 10:43:49
*/
public interface UploadFilesService extends IService<UploadFiles> {
    boolean add(UploadFiles uploadFiles);
    List<UploadFiles> selectImageByProductId(String productId);
    List<UploadFiles> selectFileByProductId(String productId);
}
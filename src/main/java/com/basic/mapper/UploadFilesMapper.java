package com.basic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.basic.entity.UploadFiles;
import org.springframework.stereotype.Component;

import java.util.List;

/**
*文件管理 Mapper
*@author: lee
*@time: 2020-04-27 10:43:49
*/
@Component
public interface UploadFilesMapper extends BaseMapper<UploadFiles> {
    List<UploadFiles> selectImageByProductId(String productId);
    List<UploadFiles> selectFileByProductId(String productId);
}
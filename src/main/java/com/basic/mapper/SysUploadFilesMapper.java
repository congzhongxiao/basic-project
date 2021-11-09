package com.basic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.basic.entity.SysUploadFiles;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 附件信息 Mapper
 *
 * @author: lee
 * @time: 2021-09-24 11:39:42
 */
@Component
public interface SysUploadFilesMapper extends BaseMapper<SysUploadFiles> {
    List<SysUploadFiles> selectImageByProductId(String id);
    List<SysUploadFiles> selectFileByProductId(String id);
}
package com.basic.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.SysUploadFiles;

import java.util.List;

/**
 * 附件信息 Service
 *
 * @author: lee
 * @time: 2021-09-24 11:39:42
 */
public interface SysUploadFilesService extends IService<SysUploadFiles> {
    List<SysUploadFiles> findFileListByIds(String[] ids);

    SysUploadFiles findOneByMd5(String md5);
    List<SysUploadFiles> selectImageByProductId(String id);
    List<SysUploadFiles> selectFileByProductId(String id);
}
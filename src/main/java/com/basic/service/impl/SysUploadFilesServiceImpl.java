package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.entity.SysUploadFiles;
import com.basic.mapper.SysUploadFilesMapper;
import com.basic.service.SysUploadFilesService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 附件信息ServiceImpl
 *
 * @author: lee
 * @time: 2021-09-24 11:39:42
 */
@Service
public class SysUploadFilesServiceImpl extends ServiceImpl<SysUploadFilesMapper, SysUploadFiles> implements SysUploadFilesService {

    public List<SysUploadFiles> findFileListByIds(String[] ids) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.in("id", ids);
        return baseMapper.selectList(queryWrapper);
    }

    public SysUploadFiles findOneByMd5(String md5) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("md5data", md5);
        queryWrapper.orderByDesc("id");
        queryWrapper.last(" limit 1");
        return baseMapper.selectOne(queryWrapper);
    }

    public List<SysUploadFiles> selectImageByProductId(String id){
        return baseMapper.selectImageByProductId(id);
    }
    public List<SysUploadFiles> selectFileByProductId(String id){
        return this.baseMapper.selectFileByProductId(id);
    }
}

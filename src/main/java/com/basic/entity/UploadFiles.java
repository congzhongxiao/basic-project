package com.basic.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
*文件管理实体类
*@author: lee
*@time: 2020-04-27 10:43:49
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("upload_files")
public class UploadFiles extends Model<UploadFiles> {
    private static final long serialVersionUID = 1L;
    /**
    *主键
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
    *上传类型
    */
    private String storage;

    /**
    *地址
    */
    private String url;

    /**
    *文件名称
    */
    private String name;

    /**
    *文件大小
    */
    private Long size;

    /**
    *文件类型
    */
    private String type;

    /**
    *文件后缀名
    */
    private String extension;

    /**
    *创建时间
    */
    private Date createTime;

    /**
    *创建人
    */
    private String createBy;


}

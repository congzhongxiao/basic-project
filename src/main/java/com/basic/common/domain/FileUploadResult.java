package com.basic.common.domain;

import lombok.Data;

/**
 * 上传结果对象
 */
@Data
public class FileUploadResult {
    private String originalFileName;//原始文件名
    private String lastName;//上传后的文件名称
    private String absolutePath;//上传后的绝对地址
    private String relativePath;//上传后的相对地址
    private String extension;//后缀名
    private Long size;
    private String contentType;
}

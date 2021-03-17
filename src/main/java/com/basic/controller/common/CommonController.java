package com.basic.controller.common;

import com.basic.common.config.Global;
import com.basic.common.config.ServerConfig;
import com.basic.common.domain.Result;
import com.basic.common.utils.StringUtils;
import com.basic.common.utils.file.FileUploadUtils;
import com.basic.common.utils.file.FileUtils;
import com.basic.common.utils.file.MimeTypeUtils;
import com.basic.entity.UploadFiles;
import com.basic.service.UploadFilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 通用控制器
 */
@Controller
@RequestMapping("/common")
public class CommonController extends BasicController {
    @Autowired
    ServerConfig serverConfig;
    @Autowired
    UploadFilesService uploadFilesService;

    @PostMapping("upload/image")
    @ResponseBody
    public Result uploadImage(@RequestPart("file") MultipartFile file) {
        try {
            String filePath = Global.getUploadPath();
            String fileName = FileUploadUtils.upload(filePath, file, MimeTypeUtils.IMAGE_EXTENSION);
            String url = serverConfig.getUrl() + fileName;
            UploadFiles image = new UploadFiles();
            image.setName(file.getOriginalFilename());
            image.setSize(file.getSize());
            image.setUrl(url);
            image.setType("image");
            image.setExtension(FileUploadUtils.getExtension(file));
            uploadFilesService.save(image);
            return Result.success(image);
        } catch (Exception e) {
            return Result.fail(e.getMessage());
        }
    }


    @PostMapping("upload/file")
    @ResponseBody
    public Result uploadFile(@RequestPart("file") MultipartFile file) {
        try {
            String filePath = Global.getUploadPath();
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            UploadFiles uploadFile = new UploadFiles();
            uploadFile.setName(file.getOriginalFilename());
            uploadFile.setSize(file.getSize());
            uploadFile.setUrl(url);
            uploadFile.setType("file");
            uploadFile.setExtension(FileUploadUtils.getExtension(file));
            uploadFilesService.save(uploadFile);
            return Result.success(uploadFile);
        } catch (Exception e) {
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 通用下载请求
     *
     * @param fileName 文件名称
     * @param delete   是否删除
     */
    @GetMapping("download")
    public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request) {
        try {
            if (!FileUtils.isValidFilename(fileName)) {
                throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
            }
            String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
            String filePath = Global.getDownloadPath() + fileName;

            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition",
                    "attachment;fileName=" + FileUtils.setFileDownloadHeader(request, realFileName));
            FileUtils.writeBytes(filePath, response.getOutputStream());
            if (delete) {
                FileUtils.deleteFile(filePath);
            }
        } catch (Exception e) {
        }
    }


    /**
     * 通用上传请求
     */
    @PostMapping("upload")
    @ResponseBody
    public Result upload(MultipartFile file) throws Exception {
        try {
            // 上传文件路径
            String filePath = Global.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            Map<String, String> data = new HashMap<>();
            data.put("fileName", fileName);
            data.put("url", url);
            return Result.success(data);
        } catch (Exception e) {
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 本地资源通用下载
     */
    @GetMapping("download/resource")
    public void resourceDownload(String resource, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // 本地资源路径
        String localPath = Global.getProfile();
        // 数据库资源地址
        String downloadPath = localPath + StringUtils.substringAfter(resource, Global.RESOURCE_PREFIX);
        // 下载名称
        String downloadName = StringUtils.substringAfterLast(downloadPath, "/");
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition",
                "attachment;fileName=" + FileUtils.setFileDownloadHeader(request, downloadName));
        FileUtils.writeBytes(downloadPath, response.getOutputStream());
    }
}

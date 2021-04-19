package com.basic.controller.common;

import com.basic.common.config.Global;
import com.basic.common.config.ServerConfig;
import com.basic.common.constans.SystemConst;
import com.basic.common.domain.FileUploadResult;
import com.basic.common.domain.Result;
import com.basic.common.utils.StringUtils;
import com.basic.common.utils.file.FileUploadUtils;
import com.basic.common.utils.file.FileUtils;
import com.basic.common.utils.file.MimeTypeUtils;
import com.basic.entity.UploadFiles;
import com.basic.service.UploadFilesService;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 通用控制器
 */
@Slf4j
@Controller
@RequestMapping("/common")
public class CommonController extends BasicController {
    @Autowired
    ServerConfig serverConfig;
    @Autowired
    UploadFilesService uploadFilesService;

    /**
     * 图片上传控制器
     *
     * @param file
     * @return
     */
    @PostMapping("upload/image")
    @ResponseBody
    public Result uploadImage(@RequestPart("file") MultipartFile file) {
        try {
            String filePath = Global.getUploadPath() + SystemConst.UPLOAD_FOLDER_IMAGE;
            FileUploadResult result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.IMAGE_EXTENSION);

            UploadFiles image = new UploadFiles();
            image.setName(result.getOriginalFileName());
            image.setSize(result.getSize());
            image.setUrl(result.getRelativePath());
            image.setType(result.getContentType());
            image.setExtension(result.getExtension());
            image.setCreateBy(getCurrentUser().getUsername());
            image.setCreateTime(new Date());
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
            String extension = FileUploadUtils.getExtension(file);
            FileUploadResult result;
            if (StringUtils.containsInArray(extension, MimeTypeUtils.IMAGE_EXTENSION)) {//是图片文件
                filePath += SystemConst.UPLOAD_FOLDER_IMAGE;
                result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.IMAGE_EXTENSION);
            } else if (StringUtils.containsInArray(extension, MimeTypeUtils.DOCUMENT_EXTENSION)) {
                filePath += SystemConst.UPLOAD_FOLDER_DOCUMENT;
                result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.DOCUMENT_EXTENSION);
            } else if (StringUtils.containsInArray(extension, MimeTypeUtils.MEDIA_EXTENSION)) {
                filePath += SystemConst.UPLOAD_FOLDER_MEDIA;
                result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.MEDIA_EXTENSION);
            } else if (StringUtils.containsInArray(extension, MimeTypeUtils.COMPRESS_EXTENSION)) {
                filePath += SystemConst.UPLOAD_FOLDER_COMPRESS;
                result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.COMPRESS_EXTENSION);
            } else {
                return Result.fail("上传类型不支持");
            }
            UploadFiles uploadFile = new UploadFiles();
            uploadFile.setName(result.getOriginalFileName());
            uploadFile.setSize(result.getSize());
            uploadFile.setUrl(result.getRelativePath());
            uploadFile.setType("file");
            uploadFile.setExtension(extension);
            uploadFile.setCreateBy(getCurrentUser().getUsername());
            uploadFile.setCreateTime(new Date());
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

    @PostMapping("upload/ueditor")
    @ResponseBody
    public Map ueditorUpload(@RequestPart("upfile") MultipartFile upfile) {
        try {
            String filePath = Global.getUploadPath() + SystemConst.UPLOAD_FOLDER_UEDITOR;
            String fileName = upfile.getOriginalFilename();
            FileUploadResult uploadResult = FileUploadUtils.upload(filePath, upfile, MimeTypeUtils.IMAGE_EXTENSION);

            Map result = new HashMap();
            result.put("state", "SUCCESS");
            result.put("url", uploadResult.getRelativePath());
            result.put("title", fileName);
            result.put("original", fileName);
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 百度富文本编辑器 远程图片本地化
     *
     * @param content
     * @return
     */
    @PostMapping("imageLocal")
    @ResponseBody
    public Result imageLocal(@RequestParam("content") String content) {
        Document document = Jsoup.parse(HtmlUtils.htmlUnescape(content));
        Elements imgTags = document.select("img[src]");
        for (Element img : imgTags) {
            String imageSrc = img.attr("src");
            if (isOutLink(imageSrc)) {//外链地址，进行图片本地化处理
                FileUploadResult result = FileUploadUtils.upload(Global.getUploadPath() + SystemConst.UPLOAD_FOLDER_UEDITOR, imageSrc, MimeTypeUtils.IMAGE_EXTENSION);
                img.attr("src", result.getRelativePath());
            }
        }
        Map data = new HashMap();
        data.put("content", document.toString());
        return Result.success(data);
    }

    @PostMapping("cleanUrl")
    @ResponseBody
    public Result cleanUrl(@RequestParam("content") String content) {
        Document document = Jsoup.parse(HtmlUtils.htmlUnescape(content));
        Elements aTags = document.select("a[href]");
        for (Element a : aTags) {
            String href = a.attr("href");
            if (isOutLink(href)) {//外链地址，进行图片本地化处理
                a.attr("href", "javascript:void(0);");
            }
        }
        Map data = new HashMap();
        data.put("content", document.toString());
        return Result.success(data);
    }

    /**
     * 校验链接是否外链
     * TODO 目前只要携带域名统一认为是外链，将来增加外链域名排除规则
     *
     * @param linkUrl
     * @return
     */
    private static boolean isOutLink(String linkUrl) {
        try {
            URL url = new URL(linkUrl);
            String host = url.getHost();
            if (StringUtils.isNotBlank(host)) {
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

}

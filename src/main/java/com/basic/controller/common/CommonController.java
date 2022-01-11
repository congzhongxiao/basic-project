package com.basic.controller.common;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.basic.common.config.Global;
import com.basic.common.constants.UploadConstant;
import com.basic.common.domain.FileUploadResult;
import com.basic.common.domain.Result;
import com.basic.common.exception.base.BaseException;
import com.basic.common.utils.DateUtils;
import com.basic.common.utils.Md5Util;
import com.basic.common.utils.StringUtils;
import com.basic.common.utils.file.*;
import com.basic.entity.SysUploadFiles;
import com.basic.service.SysUploadFilesService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
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
import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

/**
 * 通用控制器
 */
@Slf4j
@Controller
@RequestMapping("/common")
public class CommonController extends BasicController {
    @Autowired
    SysUploadFilesService sysUploadFilesService;

    @PostMapping("upload/imageBase64")
    @ResponseBody
    public Result uploadImageBase64(HttpServletRequest request) {
        String info = HtmlUtils.htmlUnescape(request.getParameter("imageArray"));
        if (StringUtils.isNotBlank(info)) {
            try {
                JSONArray imageArray = JSONArray.parseArray(info);
                List<FileUploadResult> resultFiles = new ArrayList<>();
                for (int i = 0; i < imageArray.size(); i++) {
                    JSONObject imageObj = (JSONObject) imageArray.get(i);
                    String imageFileName = (String) imageObj.get("name");
                    imageFileName = imageFileName.replaceAll("[\\\\s\\\\\\\\/:\\\\*\\\\?\\\\\\\"<>\\\\|]", "");
                    String imageData = (String) imageObj.get("data");
                    if (StringUtils.isNotBlank(imageFileName) && StringUtils.isNotBlank(imageData)) {
                        MultipartFile file = BASE64DecodedMultipartFile.base64ToMultipart(imageData);
                        FileUploadResult result = FileUploadUtils.upload(Global.getUploadPath() + UploadConstant.UPLOAD_FOLDER_IMAGE, file, MimeTypeUtils.IMAGE_EXTENSION);
                        result.setOriginalFileName(imageFileName + ".jpg");
                        resultFiles.add(result);
                    }
                }
                return Result.success("图片上传成功", resultFiles);
            } catch (Exception e) {
                return Result.fail("上传文件异常，请联系系统管理员。");
            }
        } else {
            return Result.fail("上传数据获取失败！");
        }
    }

    @PostMapping("upload/imageBase64Pdf")
    @ResponseBody
    public Result imageBase64Pdf(HttpServletRequest request) {
        String info = HtmlUtils.htmlUnescape(request.getParameter("imageArray"));
        String pdfName = request.getParameter("pdfName");
        if (StringUtils.isBlank(pdfName)) {
            return Result.fail("PDF文件名称不能为空。");
        }
        if (StringUtils.isNotBlank(info)) {
            try {
                JSONArray imageArray = JSONArray.parseArray(info);
                List<String> imagePaths = new ArrayList<>();
                for (int i = 0; i < imageArray.size(); i++) {
                    JSONObject imageObj = (JSONObject) imageArray.get(i);
                    String imageData = (String) imageObj.get("data");
                    if (StringUtils.isNotBlank(imageData)) {
                        MultipartFile file = BASE64DecodedMultipartFile.base64ToMultipart(imageData);
                        FileUploadResult result = FileUploadUtils.upload(Global.getUploadPath() + UploadConstant.UPLOAD_FOLDER_IMAGE, file, MimeTypeUtils.IMAGE_EXTENSION);
                        imagePaths.add(result.getAbsolutePath());
                    }
                }
                FileUploadResult pdfResult = new FileUploadResult();
                pdfName = pdfName.replaceAll("[\\\\s\\\\\\\\/:\\\\*\\\\?\\\\\\\"<>\\\\|]","");
                pdfResult.setOriginalFileName(pdfName + ".pdf");
                pdfResult.setExtension(".pdf");

                try {
                    String relativePath = FileUploadUtils.convertImageToPDF(Global.getUploadPath() + UploadConstant.UPLOAD_FOLDER_DOCUMENT, imagePaths);
                    pdfResult.setRelativePath(relativePath);

                    List<FileUploadResult> result = new ArrayList<>();
                    result.add(pdfResult);
                    return Result.success("上传成功",result);
                } catch (Exception e) {
                    return Result.fail("图片合成PDF文件异常，上传失败。");
                }
            } catch (Exception e) {
                return Result.fail("上传文件异常，请联系系统管理员。");
            }
        } else {
            return Result.fail("上传数据获取失败！");
        }
    }

    /**
     * 图片上传控制器
     *
     * @param file
     * @return
     */
    @PostMapping("upload/image")
    @ResponseBody
    public Result uploadImageLocal(@RequestPart("file") MultipartFile file) {
        try {
            String md5data = Md5Util.hash(file.getBytes());

            String filePath = Global.getUploadPath() + UploadConstant.UPLOAD_FOLDER_IMAGE;
            FileUploadResult result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.IMAGE_EXTENSION);

            SysUploadFiles sysUploadFiles = new SysUploadFiles();
            sysUploadFiles.setName(result.getOriginalFileName());
            sysUploadFiles.setStorage(UploadConstant.UPLOAD_TYPE_LOCAL);
            sysUploadFiles.setUrl(result.getRelativePath());
            sysUploadFiles.setType(result.getContentType());
            sysUploadFiles.setExtension(result.getExtension());
            sysUploadFiles.setCreateBy(getCurrentUser().getUsername());
            sysUploadFiles.setCreateTime(new Date());
            sysUploadFiles.setSize(result.getSize());
            sysUploadFiles.setMd5data(md5data);
            sysUploadFilesService.save(sysUploadFiles);
            return Result.success(sysUploadFiles);
        } catch (Exception e) {
            return Result.fail(e.getMessage());
        }
    }


    @PostMapping("upload/file")
    @ResponseBody
    public Result uploadFile(@RequestPart("file") MultipartFile file) {
        try {
            String md5data = Md5Util.hash(file.getBytes());
            String filePath = Global.getUploadPath();
            String extension = FileUploadUtils.getExtension(file);
            FileUploadResult result;
            if (StringUtils.containsInArray(extension, MimeTypeUtils.IMAGE_EXTENSION)) {//是图片文件
                filePath += UploadConstant.UPLOAD_FOLDER_IMAGE;
                result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.IMAGE_EXTENSION);
            } else if (StringUtils.containsInArray(extension, MimeTypeUtils.DOCUMENT_EXTENSION)) {
                filePath += UploadConstant.UPLOAD_FOLDER_DOCUMENT;
                result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.DOCUMENT_EXTENSION);
            } else if (StringUtils.containsInArray(extension, MimeTypeUtils.MEDIA_EXTENSION)) {
                filePath += UploadConstant.UPLOAD_FOLDER_MEDIA;
                result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.MEDIA_EXTENSION);
            } else if (StringUtils.containsInArray(extension, MimeTypeUtils.COMPRESS_EXTENSION)) {
                filePath += UploadConstant.UPLOAD_FOLDER_COMPRESS;
                result = FileUploadUtils.upload(filePath, file, MimeTypeUtils.COMPRESS_EXTENSION);
            } else {
                return Result.fail("上传类型不支持");
            }
            SysUploadFiles uploadFile = new SysUploadFiles();
            uploadFile.setName(result.getOriginalFileName());
            uploadFile.setStorage(UploadConstant.UPLOAD_TYPE_LOCAL);
            uploadFile.setUrl(result.getRelativePath());
            uploadFile.setType(result.getContentType());
            uploadFile.setExtension(result.getExtension());
            uploadFile.setCreateBy(getCurrentUser().getUsername());
            uploadFile.setCreateTime(new Date());
            uploadFile.setSize(result.getSize());
            uploadFile.setMd5data(md5data);
            sysUploadFilesService.save(uploadFile);
            return Result.success(uploadFile);
        } catch (Exception e) {
            return Result.fail(e.getMessage());
        }
    }

    @GetMapping("download/file")
    public void downlaodFile(String path, String fileName, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (StringUtils.isBlank(path) || StringUtils.isBlank(fileName)) {
                throw new BaseException("下载路径或文件不能为空");
            }
            fileName = URLEncoder.encode(fileName, "utf-8");
            fileName = fileName.replaceAll("\\+", "%20");    //处理空格转为加号的问题
            if (fileName.indexOf(".") < 0) {//文件名称不包括后缀名称
                String extension = FilenameUtils.getExtension(path);
                fileName += "." + extension;
            }
            if (FileUploadUtils.isHttpLink(path)) {
                request.setCharacterEncoding("UTF-8");
                response.reset();//清除response中的缓存
                //根据网络文件地址创建URL
                URL url = new URL(path);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();

                Long fileLength = conn.getContentLengthLong();//获取文件大小
                response.addHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", fileName));
                response.setCharacterEncoding("UTF-8");
                response.setContentType("application/force-download");
                response.setHeader("Content-Length", String.valueOf(fileLength));
                FileUtils.writeBytes(conn.getInputStream(), response.getOutputStream());
            } else {
                // 本地资源路径
                String localPath = Global.getProfile();
                // 数据库资源地址
                String downloadPath = localPath + StringUtils.substringAfter(path, Global.RESOURCE_PREFIX);
                // 下载名称
                response.setCharacterEncoding("utf-8");
                response.setContentType("application/force-download");
                response.addHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", fileName));

                FileUtils.writeBytes(downloadPath, response.getOutputStream());
            }
        } catch (Exception e) {
            log.error(e.getMessage());
        }
    }

    @PostMapping("upload/ueditor")
    @ResponseBody
    public Map ueditorUpload(@RequestPart("upfile") MultipartFile upfile) {
        try {
            String filePath = Global.getUploadPath() + UploadConstant.UPLOAD_FOLDER_UEDITOR;
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
            if (FileUploadUtils.isOutLink(imageSrc)) {//外链地址，进行图片本地化处理
                FileUploadResult result = FileUploadUtils.upload(Global.getUploadPath() + UploadConstant.UPLOAD_FOLDER_UEDITOR, imageSrc, MimeTypeUtils.IMAGE_EXTENSION);
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
            if (FileUploadUtils.isOutLink(href)) {//外链地址，进行图片本地化处理
                a.attr("href", "javascript:void(0);");
            }
        }
        Map data = new HashMap();
        data.put("content", document.toString());
        return Result.success(data);
    }


}

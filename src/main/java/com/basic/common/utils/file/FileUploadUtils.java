package com.basic.common.utils.file;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.basic.common.config.Global;
import com.basic.common.domain.FileUploadResult;
import com.basic.common.exception.file.FileNameLengthLimitExceededException;
import com.basic.common.exception.file.FileSizeLimitExceededException;
import com.basic.common.exception.file.InvalidExtensionException;
import com.basic.common.utils.DateUtils;
import com.basic.common.utils.Md5Util;
import com.basic.common.utils.StringUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.ReadableByteChannel;

/**
 * 文件上传工具类
 */
public class FileUploadUtils {
    /**
     * 默认大小 50M
     */
    public static final long DEFAULT_MAX_SIZE = 500 * 1024 * 1024;

    /**
     * 默认的文件名最大长度 100
     */
    public static final int DEFAULT_FILE_NAME_LENGTH = 100;

    /**
     * 默认上传的地址
     */
    private static String defaultBaseDir = Global.getProfile();

    private static int counter = 0;

    public static void setDefaultBaseDir(String defaultBaseDir) {
        FileUploadUtils.defaultBaseDir = defaultBaseDir;
    }

    public static String getDefaultBaseDir() {
        return defaultBaseDir;
    }

    /**
     * 文件上传
     *
     * @param baseDir 相对应用的基目录
     * @param file    上传的文件
     * @return 返回上传成功的文件名
     * @throws FileSizeLimitExceededException       如果超出最大大小
     * @throws FileNameLengthLimitExceededException 文件名太长
     * @throws IOException                          比如读写文件出错时
     * @throws InvalidExtensionException            文件校验异常
     */
    public static final FileUploadResult upload(String baseDir, MultipartFile file, String[] allowedExtension)
            throws FileSizeLimitExceededException, IOException, FileNameLengthLimitExceededException,
            InvalidExtensionException {
        FileUploadResult result = new FileUploadResult();
        result.setSize(file.getSize());
        result.setContentType(file.getContentType());
        int fileNamelength = file.getOriginalFilename().length();
        if (fileNamelength > FileUploadUtils.DEFAULT_FILE_NAME_LENGTH) {
            throw new FileNameLengthLimitExceededException(FileUploadUtils.DEFAULT_FILE_NAME_LENGTH);
        }

        assertAllowed(file, allowedExtension);

        String fileName = extractFilename(file);

        File desc = getAbsoluteFile(baseDir, fileName);
        file.transferTo(desc);
        String pathFileName = getPathFileName(baseDir, fileName);

        result.setOriginalFileName(file.getOriginalFilename());
        result.setExtension(getExtension(file));
        result.setAbsolutePath(desc.getAbsolutePath());
        result.setRelativePath(pathFileName);
        result.setLastName(desc.getName());
        return result;
    }

    /**
     * 根据图片url保存图片到本地
     *
     * @param baseDir
     * @param source
     * @return
     * @throws IOException
     */
    public static final FileUploadResult upload(String baseDir, String source, String[] allowedExtension) {
        try {
            URL url = new URL(source);
            ReadableByteChannel readableByteChannel = Channels.newChannel(url.openStream());
            String path = url.getPath();
            String fileExt = path.substring(path.lastIndexOf("."));
            String filePath = DateUtils.dateTimePath() + "/" + IdWorker.get32UUID() + fileExt;
            File desc = getAbsoluteFile(baseDir, filePath);
            FileOutputStream fileOutputStream = new FileOutputStream(desc);
            FileChannel channel = fileOutputStream.getChannel();
            channel.transferFrom(readableByteChannel, 0, Long.MAX_VALUE);
            String pathFileName = getPathFileName(baseDir, filePath);


            FileUploadResult result = new FileUploadResult();
            result.setSize(desc.length());
            result.setOriginalFileName(desc.getName());
            result.setExtension(fileExt);
            result.setAbsolutePath(desc.getAbsolutePath());
            result.setRelativePath(pathFileName);
            result.setLastName(desc.getName());
            return result;
        } catch (Exception e) {
            return null;
        }

    }


    /**
     * 编码文件名
     */
    public static final String extractFilename(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        String extension = getExtension(file);
        fileName = DateUtils.dateTimePath() + "/" + encodingFilename(fileName) + "." + extension;
        return fileName;
    }

    private static final File getAbsoluteFile(String uploadDir, String fileName) throws IOException {
        File desc = new File(uploadDir + File.separator + fileName);

        if (!desc.getParentFile().exists()) {
            desc.getParentFile().mkdirs();
        }
        if (!desc.exists()) {
            desc.createNewFile();
        }
        return desc;
    }

    private static final String getPathFileName(String uploadDir, String fileName) throws IOException {
        int dirLastIndex = Global.getProfile().length() + 1;
        String currentDir = StringUtils.substring(uploadDir, dirLastIndex);
        String pathFileName = Global.RESOURCE_PREFIX + "/" + currentDir + "/" + fileName;
        return pathFileName;
    }

    /**
     * 根据文件绝对路径，返回访问相对路径
     *
     * @param absolutePath
     * @return
     */
    public static final String getRelativeFilePath(String absolutePath) {
        int dirLastIndex = Global.getProfile().length() + 1;
        String currentDir = StringUtils.substring(absolutePath, dirLastIndex);
        return Global.RESOURCE_PREFIX + "/" + currentDir;
    }

    /**
     * 编码文件名
     */
    private static final String encodingFilename(String fileName) {
        fileName = fileName.replace("_", " ");
        fileName = Md5Util.hash(fileName + System.nanoTime() + counter++);
        return fileName;
    }

    /**
     * 文件大小校验
     *
     * @param file 上传的文件
     * @return
     * @throws FileSizeLimitExceededException 如果超出最大大小
     * @throws InvalidExtensionException
     */
    public static final void assertAllowed(MultipartFile file, String[] allowedExtension)
            throws FileSizeLimitExceededException, InvalidExtensionException {
        long size = file.getSize();
        if (DEFAULT_MAX_SIZE != -1 && size > DEFAULT_MAX_SIZE) {
            throw new FileSizeLimitExceededException(DEFAULT_MAX_SIZE / 1024 / 1024);
        }

        String fileName = file.getOriginalFilename();
        String extension = getExtension(file);
        if (allowedExtension != null && !isAllowedExtension(extension, allowedExtension)) {
            if (allowedExtension == MimeTypeUtils.IMAGE_EXTENSION) {//图片文件
                throw new InvalidExtensionException.InvalidImageExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.DOCUMENT_EXTENSION) {//文档文件
                throw new InvalidExtensionException.InvalidDocumentExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.COMPRESS_EXTENSION) {//压缩文件
                throw new InvalidExtensionException.InvalidCompressExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.MEDIA_EXTENSION) {//多媒体文件
                throw new InvalidExtensionException.InvalidMediaExtensionException(allowedExtension, extension,
                        fileName);
            } else {
                throw new InvalidExtensionException(allowedExtension, extension, fileName);
            }
        }

    }

    /**
     * 判断MIME类型是否是允许的MIME类型
     *
     * @param extension
     * @param allowedExtension
     * @return
     */
    public static final boolean isAllowedExtension(String extension, String[] allowedExtension) {
        for (String str : allowedExtension) {
            if (str.equalsIgnoreCase(extension)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取文件名的后缀
     *
     * @param file 表单文件
     * @return 后缀名
     */
    public static final String getExtension(MultipartFile file) {
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        if (StringUtils.isEmpty(extension)) {
            extension = MimeTypeUtils.getExtension(file.getContentType());
        }
        return extension;
    }

    /**
     * 判断链接地址是否是网络请求
     *
     * @param linkUrl
     * @return
     */
    public static boolean isHttpLink(String linkUrl) {
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

    /**
     * 校验链接是否外链
     * TODO 目前只要携带域名统一认为是外链，将来增加外链域名排除规则
     *
     * @param linkUrl
     * @return
     */
    public static boolean isOutLink(String linkUrl) {
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
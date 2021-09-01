package com.basic.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 通用配置
 * 
 */
@Configuration
public class ResourcesConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry)
    {
        /** 本地上传路径构建虚拟路径 */
        registry.addResourceHandler(Global.RESOURCE_PREFIX + "/**").addResourceLocations("file:" + Global.getProfile() + "/");
    }

}
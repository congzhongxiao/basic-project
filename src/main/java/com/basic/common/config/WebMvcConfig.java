package com.basic.common.config;

import com.basic.common.config.interceptor.RepeatSubmitInterceptor;
import com.basic.common.config.interceptor.RequestInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 请求拦截器
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Autowired
    private RequestInterceptor adminInterceptor;
    @Autowired
    private RepeatSubmitInterceptor repeatSubmitInterceptor;//重复提交拦截，测试中
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminInterceptor).addPathPatterns("/**");
        registry.addInterceptor(repeatSubmitInterceptor).addPathPatterns("/**");
    }

}

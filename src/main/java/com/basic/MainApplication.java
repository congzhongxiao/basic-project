package com.basic;

import com.basic.common.xss.XssObjectMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;

import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

@SpringBootApplication(scanBasePackages = "com")
@MapperScan("com.*.mapper")
public class MainApplication {

    public static void main(String[] args) {
        SpringApplication.run(MainApplication.class, args);
    }

    /**
     * 解决RequestBody下json的xss防御问题
     */
    @Bean
    public MappingJackson2HttpMessageConverter getMappingJackson2HttpMessageConverter() {
        MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
        XssObjectMapper xssObjectMapper = new XssObjectMapper();
        xssObjectMapper.setTimeZone(TimeZone.getTimeZone("GMT+8"));
        mappingJackson2HttpMessageConverter.setObjectMapper(xssObjectMapper);
        //设置中文编码格式
        List<MediaType> list = new ArrayList();
        list.add(MediaType.APPLICATION_JSON_UTF8);
        list.add(MediaType.APPLICATION_JSON);
        mappingJackson2HttpMessageConverter.setSupportedMediaTypes(list);
        return mappingJackson2HttpMessageConverter;
    }

}

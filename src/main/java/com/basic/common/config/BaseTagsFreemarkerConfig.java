package com.basic.common.config;

import com.basic.tags.ConfigTag;
import com.basic.tags.DictionaryTag;
import freemarker.template.DefaultObjectWrapperBuilder;
import freemarker.template.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class BaseTagsFreemarkerConfig {
    @Autowired
    protected FreeMarkerConfigurer configurer;
    @Autowired
    DictionaryTag dictionaryTag;
    @Autowired
    ConfigTag configTag;

    @PostConstruct
    public void setSharedVariable() {
        Map tagsMap = new HashMap();
        tagsMap.put("dictionary", dictionaryTag);
        tagsMap.put("config", configTag);
        SimpleHash simpleHash = new SimpleHash(tagsMap, new DefaultObjectWrapperBuilder(freemarker.template.Configuration.VERSION_2_3_25).build());
        configurer.getConfiguration().setSharedVariable("system", simpleHash);
    }
}

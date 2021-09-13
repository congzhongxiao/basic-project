package com.basic.tags;

import com.basic.common.utils.StringUtils;
import com.basic.entity.Dictionary;
import com.basic.service.DictionaryService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Component
public class DictionaryTag extends BaseTag {
    @Autowired
    DictionaryService dictionaryService;
    /*页面调用示例
         <@system.dictionary method="list" type="system_sex" >
            <#if list?has_content>
                <#list list as dic>
                    ${dic.name}
                </#list>
            </#if>
        </@system.dictionary>
        <@system.dictionary method="info" type="system_sex" value="0" >
            <#if info?has_content>
                ${info.name}
            </#if>
        </@system.dictionary>
      */
    @Override
    public void render(Environment env, Map params, TemplateDirectiveBody body) throws IOException, TemplateException {

        String method = "";
        if (StringUtils.isNotBlank(params.get("method"))) {
            method = params.get("method").toString();
        }
        if ("list".equalsIgnoreCase(method)) {//列表查询
            if (StringUtils.isNotBlank(params.get("type"))) {
                List<Dictionary> list = dictionaryService.findEnableListByType(params.get("type").toString());
                env.setVariable("list", getModel(list));
            }

        } else if ("info".equalsIgnoreCase(method)) {//查询参数信息
            String type = "";
            if (StringUtils.isNotBlank(params.get("type"))) {
                type = params.get("type").toString();
            }
            String value = "";
            if (StringUtils.isNotBlank(params.get("value"))) {
                value = params.get("value").toString();
            }
            if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)) {
                Dictionary info = dictionaryService.findEnableInfoByTypeAndValue(type, value);
                env.setVariable("info", getModel(info));
            }

        }
        renderBody(env, body);
    }
}

package com.basic.tags;

import com.basic.common.utils.StringUtils;
import com.basic.service.SysConfigService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

@Component
public class ConfigTag extends BaseTag {
    @Autowired
    SysConfigService configService;

    @Override
    public void render(Environment env, Map params, TemplateDirectiveBody body) throws IOException, TemplateException {

        //获取方法指令
        String code = "";
        if (StringUtils.isNotBlank(params.get("code"))) {
            code = params.get("code").toString();
            String config = configService.findValueByCode(code);
            if (StringUtils.isNotBlank(config)) {
                env.setVariable("content", getModel(config));
            }
        }
        renderBody(env, body);
    }
}

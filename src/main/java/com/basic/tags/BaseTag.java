package com.basic.tags;

import com.basic.common.utils.StringUtils;
import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.util.Map;

public abstract class BaseTag implements TemplateDirectiveModel {
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        verifyParameters(params);
        render(env, params, body);
    }

    public abstract void render(Environment env, Map params, TemplateDirectiveBody body) throws IOException, TemplateException;

    protected String getParam(Map params, String name) {
        Object value = params.get(name);

        if (value instanceof SimpleScalar) {
            return ((SimpleScalar) value).getAsString();
        }

        return null;
    }

    private DefaultObjectWrapper getBuilder() {
        return new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25).build();
    }

    public TemplateModel getModel(Object o) throws TemplateModelException {
        return this.getBuilder().wrap(o);
    }


    protected void verifyParameters(Map params) throws TemplateModelException {
    }

    protected void renderBody(Environment env, TemplateDirectiveBody body) throws IOException, TemplateException {
        if (body != null) {
            body.render(env.getOut());
        }
    }

    /**
     * 初始化排序字段和排序类型数据
     * @param params
     * @param queryParam
     */
    protected void initOrderParam(Map params,Map<String, Object> queryParam){
        if (StringUtils.isNotBlank(params.get("orderBy"))) {

            queryParam.put("orderBy", params.get("orderBy").toString());

            if (StringUtils.isNotBlank(params.get("orderType"))) {
                queryParam.put("orderType", params.get("orderType").toString());
            } else {
                queryParam.put("orderType", "asc");
            }
        } else {
            queryParam.put("orderBy", "sort");
            queryParam.put("orderType", "asc");
        }
    }
}

package com.basic.common.jagregory.shiro.freemarker;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;

import java.io.IOException;
import java.util.Map;


/**
 * Freemarker tag that renders the tag body only if the current user has <em>not</em> executed a successful authentication
 * attempt <em>during their current session</em>.
 *
 * <p>The logically opposite tag of this one is the {@link org.apache.shiro.web.tags.AuthenticatedTag}.
 *
 * <p>Equivalent to {@link org.apache.shiro.web.tags.NotAuthenticatedTag}</p>
 */
public class NotAuthenticatedTag extends SecureTag {

    @Override
    public void render(Environment env, Map params, TemplateDirectiveBody body) throws IOException, TemplateException {
        if (getSubject() == null || !getSubject().isAuthenticated()) {
            renderBody(env, body);
        } else {
        }
    }
}
package com.basic.common.shiro;

import com.alibaba.fastjson.JSON;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * CSRF防御拦截机制
 */
@Slf4j
public class CSRFSessionControlFilter extends AccessControlFilter {

    @Lazy
    @Autowired
    private ShiroFilterFactoryBean shiroFilterFactoryBean;

    @Value("#{ @environment['csrf.enabled'] ?: false }")
    private boolean csrfEnabled;


    @Value("#{ @environment['csrf.excludes'] ?: \"\" }")
    private String excludes;


    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object o) throws Exception {
        return false;
    }


    private boolean isStaticFile(String path) {
        Map<String, String> filterMap = shiroFilterFactoryBean.getFilterChainDefinitionMap();
        for (String key : filterMap.keySet()) {
            String value = filterMap.get(key);
            PathMatcher matcher = new AntPathMatcher();
            if(matcher.match(key, path)) {
                if(value.equals("anon") ){
                    return true;
                } else {
                    return false;
                }
            }
        }
        return false;
    }

    /**
     * 校验是否是排除的路径
     *
     * @param path
     * @return
     */
    private boolean isExcludesPath(String path) {
        if (StringUtils.isNotBlank(excludes)) {
            String[] excludeArray = excludes.split(",");
            for (String pattern : excludeArray) {
                AntPathMatcher matcher = new AntPathMatcher();
                if (matcher.match(pattern, path) || matcher.matchStart(pattern, path)) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        Subject subject = this.getSubject(servletRequest, servletResponse);
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        //加密会话SSL中设置cookie的Secure属性和HttpOnly属性
        String scheme = request.getScheme();
        if (!StringUtils.isEmpty(scheme) && "https".equalsIgnoreCase(scheme)) {
            response.setHeader("strict-transport-security", "max-age=16070400; includeSubDomains");//简称为HSTS。它允许一个HTTPS网站，要求浏览器总是通过HTTPS来访问它
            response.setHeader("Set-Cookie", "JSESSIONID=" + request.getSession().getId() + "; Path=/cas;HttpOnly=true;Secure=true;");
        }

        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        response.setHeader("Content-Security-Policy", "script-src * 'unsafe-inline' 'unsafe-eval';form-action 'self';frame-ancestors 'self';");//这个响应头主要是用来定义页面可以加载哪些资源，减少XSS的发生
        response.setHeader("X-Content-Type-Options", "nosniff");//互联网上的资源有各种类型，通常浏览器会根据响应头的Content-Type字段来分辨它们的类型。通过这个响应头可以禁用浏览器的类型猜测行为
        response.setHeader("X-XSS-Protection", "1; mode=block");//1; mode=block：启用XSS保护，并在检查到XSS攻击时，停止渲染页面
        response.setHeader("X-Frame-Options", "SAMEORIGIN");//SAMEORIGIN：不允许被本域以外的页面嵌入



        String path = request.getServletPath();
        if (csrfEnabled && subject != null && subject.getSession() != null) {
            String sysCsrfToken = (String) subject.getSession().getAttribute("sys_csrfToken:" + subject.getSession().getId());
            if (!isStaticFile(path)) {//是否anon路径
                if ("POST".equals(request.getMethod())) {
                    //排除特例
                    if (!isExcludesPath(path)) {//是否排除路径
                        String csrfToken = request.getHeader("X-CSRF-Token");
                        String inputCsrfToken = request.getParameter("X-CSRF-Token");
                        if ((StringUtils.isEmpty(csrfToken) && StringUtils.isEmpty(inputCsrfToken)) || StringUtils.isEmpty(sysCsrfToken)) {
                            String json = JSON.toJSONString(Result.alert(ResultCode.COMMON_REQUEST_CSRF));
                            response.setStatus(200);
                            response.setContentType("application/json;charset=utf-8");
                            response.getWriter().print(json);
                            return false;
                        } else {
                            if (!(sysCsrfToken.equals(csrfToken) || sysCsrfToken.equals(inputCsrfToken))) {
                                String json = JSON.toJSONString(Result.alert(ResultCode.COMMON_REQUEST_CSRF));
                                response.setStatus(200);
                                response.setContentType("application/json;charset=utf-8");
                                response.getWriter().print(json);
                                return false;
                            }
                        }
                    }
                }
            }
            request.setAttribute("sys_csrfToken", sysCsrfToken);
        }
        return true;
    }
}

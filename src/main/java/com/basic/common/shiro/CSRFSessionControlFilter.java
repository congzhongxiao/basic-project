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
            if (value.equals("anon") && matcher.match(key, path)) {
                return true;
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

package com.basic.common.config.interceptor;
/**
 * @Description: 防止重复提交拦截器(用一句话描述该文件做什么)
 */

import com.basic.common.annotation.RepeatSubmit;
import com.basic.common.domain.Result;
import com.basic.common.json.JSON;
import com.basic.common.utils.ServletUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * @ClassName: RepeatSubmitInterceptor
 * @Description: 防止重复提交拦截器(用一句话描述该文件做什么)
 */
@Component
public abstract class RepeatSubmitInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            RepeatSubmit annotation = method.getAnnotation(RepeatSubmit.class);
            if (annotation != null) {
                if (this.isRepeatSubmit(request, annotation)) {
                    ServletUtils.renderString(response, JSON.marshal(Result.fail("请勿重复提交，稍后再试~")));
                    return false;
                }
            }
            return true;
        } else {
            return true;
        }
    }

    /**
     * 验证是否重复提交由子类实现具体的防重复提交的规则
     *
     * @param request    请求对象
     * @param annotation 防复注解
     * @return 结果
     */
    public abstract boolean isRepeatSubmit(HttpServletRequest request, RepeatSubmit annotation) throws Exception;

}
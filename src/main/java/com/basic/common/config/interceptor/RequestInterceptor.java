package com.basic.common.config.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 页面请求前拦截器
 */
@Component
public class RequestInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        String path = request.getContextPath();
        request.setAttribute("ctx", path);
        return HandlerInterceptor.super.preHandle(request,response,handler);
	}


}

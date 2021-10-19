package com.basic.controller.common;

import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Controller
class CustomErrorController extends BasicErrorController {
    public CustomErrorController(ServerProperties serverProperties) {
        super(new DefaultErrorAttributes(), serverProperties.getError());
    }

    //通过浏览器访问的url 如果发生异常全部会被浏览并跳转到指定页面
    @Override
    public ModelAndView errorHtml(HttpServletRequest request, HttpServletResponse response) {
        //请求的状态
        HttpStatus status = getStatus(request);
        response.setStatus(getStatus(request).value());

        Map<String, Object> model = Collections.unmodifiableMap(this.getErrorAttributes(request, this.getErrorAttributeOptions(request, MediaType.TEXT_HTML)));
        ModelAndView modelAndView = resolveErrorView(request, response, status, model);
        //指定自定义的视图
        model.put("code", "404");
        model.put("msg", "请求地址错误或页面不存在");
        return (modelAndView == null ? new ModelAndView("errorPage", model) : modelAndView);
    }

    //通过http client访问的接口如果发生异常会调用这个方法
    @Override
    public ResponseEntity<Map<String, Object>> error(HttpServletRequest request) {
        HttpStatus status = getStatus(request);

        //输出自定义的Json格式
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", false);
        map.put("code", "10001");
        map.put("message", "请求地址错误或页面不存在");

        return new ResponseEntity<>(map, status);
    }
}
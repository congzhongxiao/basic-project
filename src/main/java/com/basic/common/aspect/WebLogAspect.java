package com.basic.common.aspect;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.basic.common.config.Global;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

@Slf4j
@Aspect
@Component
public class WebLogAspect {

    private static final ThreadLocal<Long> START_TIME_MILLIS = new ThreadLocal<>();
    @Autowired
    HttpServletRequest request;

    /**
     * 以 controller 包下定义的所有请求为切入点
     */
    @Pointcut("execution(public * com.basic.controller..*.*(..))")
    public void webLog() {
    }

    /**
     * 前置通知:在某连接点之前执行的通知，但这个通知不能阻止连接点之前的执行流程（除非它抛出一个异常）。
     *
     * @param joinPoint 参数
     */
    @Before("webLog()")
    public void before(JoinPoint joinPoint) {
        START_TIME_MILLIS.set(System.currentTimeMillis());
    }

    /**
     * 后置通知:在某连接点正常完成后执行的通知，通常在一个匹配的方法返回的时候执行。
     *
     * @param joinPoint 参数
     */
    @AfterReturning(value = "webLog()", returning = "result")
    public void afterReturning(JoinPoint joinPoint, Object result) {
        if (Global.isRequestLog()) {
            String logTemplate = "请求响应正常->URL:{}, Method:{}, IP:{}, Params:{}, Class:{}.{}, time:{}ms, Response: {}";
            log.info(logTemplate, request.getRequestURL(), request.getMethod(), request.getRemoteAddr(), getParameterInfo(joinPoint), joinPoint.getSignature().getDeclaringTypeName(), joinPoint.getSignature().getName(), (System.currentTimeMillis() - START_TIME_MILLIS.get()), JSON.toJSONString(result));
        }
        START_TIME_MILLIS.remove();
    }

    private String getParameterInfo(JoinPoint joinPoint) {
        String parameter = "";
        try {
            Object[] args = joinPoint.getArgs();
            Object[] arguments = new Object[args.length];
            for (int i = 0; i < args.length; i++) {
                if (args[i] instanceof ServletRequest || args[i] instanceof ServletResponse || args[i] instanceof MultipartFile) {
                    continue;
                }
                arguments[i] = args[i];
            }

            if (arguments != null) {
                try {
                    parameter = JSONObject.toJSONString(arguments);
                } catch (Exception e) {
                    parameter = arguments.toString();
                }
            }
        } catch (Exception e) {
            parameter = "参数异常";
        }
        return parameter;
    }

    /**
     * 异常通知:在方法抛出异常退出时执行的通知。
     *
     * @param joinPoint 参数
     */
    @AfterThrowing(value = "webLog()", throwing = "ex")
    public void afterThrowing(JoinPoint joinPoint, Throwable ex) {
        if (Global.isRequestLog()) {
            String logTemplate = "请求响应异常->URL:{}, Method:{}, IP:{}, Params:{}, Class:{}.{}, time:{}ms,ExInfo: {}";
            log.error(logTemplate, request.getRequestURL(), request.getMethod(), request.getRemoteAddr(), getParameterInfo(joinPoint), joinPoint.getSignature().getDeclaringTypeName(), joinPoint.getSignature().getName(), (System.currentTimeMillis() - START_TIME_MILLIS.get()), ex.getMessage());
        }
        START_TIME_MILLIS.remove();
    }

    /**
     * 最终通知。当某连接点退出的时候执行的通知（不论是正常返回还是异常退出）。
     *
     * @param joinPoint
     */
    @After("webLog()")
    public void after(JoinPoint joinPoint) {
    }
}

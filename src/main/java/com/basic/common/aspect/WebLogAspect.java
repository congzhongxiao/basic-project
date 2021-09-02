package com.basic.common.aspect;

import com.basic.common.json.JSON;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Slf4j
@Aspect
@Component
public class WebLogAspect {
    /**
     * 以 controller 包下定义的所有请求为切入点
     */
    @Pointcut("execution(public * com.basic.controller..*.*(..))")
    public void webLog() {
    }

    /**
     * 在切点之前
     *
     * @param joinPoint
     */
    @Before("webLog()")
    public void doBefore(JoinPoint joinPoint){
        try{
            // 开始打印请求日志
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();

            // 打印请求相关参数
            log.info("========================================== Start ==========================================");
            // 打印请求 url
            log.info("URL            : {}", request.getRequestURL().toString());
            // 打印 Http method
            log.info("HTTP Method    : {}", request.getMethod());
            // 打印调用 controller 的全路径以及执行方法
            log.info("Class Method   : {}.{}", joinPoint.getSignature().getDeclaringTypeName(), joinPoint.getSignature().getName());
            // 打印请求的 IP
            log.info("IP             : {}", request.getRemoteAddr());
            // 打印请求入参
            Map<String, String[]> map = request.getParameterMap();
            String params = JSON.marshal(map);
            log.info("params             : {}", params);
        }catch (Exception e){

        }
    }

    /**
     * 在切点之后
     */
    @After("webLog()")
    public void doAfter() {
        log.info("=========================================== End ===========================================");
    }

    /**
     * 环绕
     *
     * @param proceedingJoinPoint
     * @throws Throwable
     */
    @Around("webLog()")
    public Object doAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        return proceedingJoinPoint.proceed();
    }
}

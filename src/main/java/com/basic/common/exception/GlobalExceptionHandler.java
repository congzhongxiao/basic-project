package com.basic.common.exception;

import com.basic.common.domain.Result;
import com.basic.common.utils.ServletUtils;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.validation.BindException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;

@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * post请求参数校验抛出的异常
     * @param e
     * @return
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result methodArgumentNotValidExceptionHandler(MethodArgumentNotValidException e){
        //获取异常中随机一个异常信息
        String defaultMessage = e.getBindingResult().getFieldError().getDefaultMessage();
        return  Result.fail(defaultMessage);
    }

    /**
     * 请求方法中校验抛出的异常
     * @param e
     * @return
     */
    @ExceptionHandler(ConstraintViolationException.class)
    public Result constraintViolationExceptionHandler(ConstraintViolationException e){
        //获取异常中第一个错误信息
        String message = e.getConstraintViolations().iterator().next().getMessage();
        return  Result.fail(message);
    }


    /**
     * 权限校验失败 如果请求为ajax返回json，普通请求跳转页面
     */
    @ExceptionHandler(AuthorizationException.class)
    public Object handleAuthorizationException(HttpServletRequest request, AuthorizationException e)
    {
        if (ServletUtils.isAjaxRequest(request))
        {
            return Result.fail("抱歉，您没有操作权限");
        }
        else
        {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("/unauthorized");
            return modelAndView;
        }
    }

    @ExceptionHandler(UnauthorizedException.class)
    public Object handleUnauthorizedException(HttpServletRequest request, AuthorizationException e)
    {
        if (ServletUtils.isAjaxRequest(request))
        {
            return Result.fail("抱歉，您没有操作权限");
        }
        else
        {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("/unauthorized");
            return modelAndView;
        }
    }

    /**
     * 请求方式不支持
     */
    @ExceptionHandler({ HttpRequestMethodNotSupportedException.class })
    public Result handleException(HttpRequestMethodNotSupportedException e)
    {
        return Result.fail("不支持' " + e.getMethod() + "'请求");
    }

    /**
     * 拦截未知的运行时异常
     */
    @ExceptionHandler(RuntimeException.class)
    public Result notFount(RuntimeException e)
    {
        return Result.fail("运行时异常:" + e.getMessage());
    }

    /**
     * 系统异常
     */
    @ExceptionHandler(Exception.class)
    public Result handleException(Exception e)
    {
        return Result.fail("服务器错误，请联系管理员");
    }

    /**
     * 自定义验证异常
     */
    @ExceptionHandler(BindException.class)
    public Result validatedBindException(BindException e)
    {
        String message = e.getAllErrors().get(0).getDefaultMessage();
        return Result.fail(message);
    }


}
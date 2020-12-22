package com.basic.controller;

import com.basic.common.annotation.Log;
import com.basic.common.config.Global;
import com.basic.common.domain.Result;
import com.basic.common.enums.BusinessType;
import com.basic.common.utils.ServletUtils;
import com.basic.common.utils.StringUtils;
import com.google.code.kaptcha.Constants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/login")
public class LoginController {
    @GetMapping("")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
        if (ServletUtils.isAjaxRequest(request)) {
            return ServletUtils.renderString(response, "{\"success\":\"false\",\"message\":\"未登录或登录超时。请重新登录\"}");
        }
        model.addAttribute("isCaptchaLogin", Global.isCaptchaLogin());
        model.addAttribute("captchaType", Global.getCaptchaType());
        return "/login";
    }

    @Log(name = "系统登录",type = BusinessType.LOGIN)
    @PostMapping("")
    @ResponseBody
    public Result doLogin(String username, String password, String validateCode) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            if (Global.isCaptchaLogin()) {
                String captchaCode = (String) subject.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
                if (StringUtils.isNotBlank(validateCode) && StringUtils.equals(validateCode, captchaCode)) {
                    subject.login(token);
                    return Result.success("登录成功");
                } else {
                    return Result.fail("验证码不正确");
                }
            } else {
                subject.login(token);
                return Result.success("登录成功");
            }
        } catch (AuthenticationException e) {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage())) {
                msg = e.getMessage();
            }
            return Result.fail(msg);
        }
    }
}

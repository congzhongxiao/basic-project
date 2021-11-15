package com.basic.controller;

import com.basic.common.config.Global;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.ServletUtils;
import com.basic.common.utils.StringUtils;
import com.google.code.kaptcha.Constants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.LinkedHashMap;

@Controller
@RequestMapping("/login")
public class LoginController {
    @GetMapping("")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {

        if (ServletUtils.isAjaxRequest(request)) {
            return ServletUtils.renderString(response, "{\"success\":\"false\",\"code\":\"" + ResultCode.COMMON_NO_LOGIN.getCode() + "\",\"message\":\"未登录或登录超时。请重新登录\"}");
        }

        Subject subject = SecurityUtils.getSubject();
        if (subject != null && subject.getPrincipal() != null) {
            return "redirect:/";
        }
        model.addAttribute("isCaptchaLogin", Global.isCaptchaLogin());
        model.addAttribute("captchaType", Global.getCaptchaType());
        return "/login";
    }

    @PostMapping("")
    @ResponseBody
    public Result doLogin(String username, String pwd, String validateCode) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, pwd);
        Subject subject = SecurityUtils.getSubject();
        try {
            Session session = subject.getSession();
            final LinkedHashMap<Object, Object> attributes = new LinkedHashMap<Object, Object>();
            final Collection<Object> keys = session.getAttributeKeys();
            for (Object key : keys) {
                final Object value = session.getAttribute(key);
                if (value != null) {
                    attributes.put(key, value);
                }
            }
            if (Global.isCaptchaLogin()) {
                String captchaCode = (String) subject.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
                if (StringUtils.isNotBlank(validateCode) && StringUtils.equals(validateCode, captchaCode)) {
                    session.stop();
                    subject.login(token);
                    // 登录成功后复制session数据
                    session = subject.getSession();
                    for (final Object key : attributes.keySet()) {
                        session.setAttribute(key, attributes.get(key));
                    }
                    return Result.success("登录成功");
                } else {
                    return Result.fail("验证码不正确");
                }
            } else {
                session.stop();
                subject.login(token);
                // 登录成功后复制session数据
                session = subject.getSession();
                for (final Object key : attributes.keySet()) {
                    session.setAttribute(key, attributes.get(key));
                }
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

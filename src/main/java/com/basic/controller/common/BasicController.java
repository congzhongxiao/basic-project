package com.basic.controller.common;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.PageResult;
import com.basic.common.utils.StringUtils;
import com.basic.entity.User;
import lombok.Data;
import org.apache.shiro.SecurityUtils;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Data
public class BasicController {
    protected HttpServletRequest request;
    protected HttpServletResponse response;

    @ModelAttribute
    public void init(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    protected User getCurrentUser() {
        User user = (User)SecurityUtils.getSubject().getPrincipal();
        return user;
    }
    //跳转错误页面
    protected String ErrorPage(String code, String msg, Model model) {
        model.addAttribute("code",code);
        model.addAttribute("msg",msg);
        return "/error";
    }
    //跳转错误页面
    protected String ErrorPage(String msg,Model model) {
        model.addAttribute("code","404");
        model.addAttribute("msg",msg);
        return "/error";
    }
    //跳转错误页面
    protected String ErrorPage(Model model) {
        model.addAttribute("code","404");
        model.addAttribute("msg","页面不存在或已被删除。");
        return "/error";
    }

    /**
     * 页面跳转
     */
    protected String redirect(String url)
    {
        return StringUtils.format("redirect:{}", url);
    }
}

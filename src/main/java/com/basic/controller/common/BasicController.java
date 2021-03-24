package com.basic.controller.common;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.PageResult;
import com.basic.common.utils.StringUtils;
import com.basic.entity.User;
import lombok.Data;
import org.apache.shiro.SecurityUtils;
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
    //跳转404页面
    protected String redirectNoPage() {
        return "redirect:/404";
    }
    //组装分页列表页面返回数据
    protected PageResult installPageData(IPage<Map<String, Object>> page) {
        PageResult result = new PageResult();
        if (page != null) {
            result.setRows(page.getRecords());
            result.setTotal(page.getTotal());
        }
        return result;
    }

    /**
     * 页面跳转
     */
    protected String redirect(String url)
    {
        return StringUtils.format("redirect:{}", url);
    }
}

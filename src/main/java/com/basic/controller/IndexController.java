package com.basic.controller;

import com.basic.common.domain.server.Server;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {
    @GetMapping({"", "index"})
    public String index() {
        return "/index";
    }

    @GetMapping("home")
    public String home() {
        return "/home";
    }

    @RequestMapping("404")
    public String pageNotFound(Model model) {
        model.addAttribute("code","404");
        model.addAttribute("msg","页面不存在或已被删除。");
        return "errorPage";
    }

    @GetMapping("server")
    public String server(Model model) throws Exception {
        Server server = new Server();
        server.copyTo();
        model.addAttribute("server", server);
        return "/system/server";
    }
}

package com.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/unauthorized")
public class UnauthorizedController {
    @RequestMapping("")
    public String unauthorized(){
        return "/unauthorized";
    }
}

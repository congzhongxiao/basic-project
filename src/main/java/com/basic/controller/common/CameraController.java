package com.basic.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/camera")
public class CameraController {
    String prefix = "camera";

    //添加页面跳转
    @GetMapping("cameraImage")
    public String cameraImage() {
        return prefix + "/camera_image";
    }

    //添加页面跳转
    @GetMapping("cameraPdf")
    public String cameraPdf() {
        return prefix + "/camera_pdf";
    }
}

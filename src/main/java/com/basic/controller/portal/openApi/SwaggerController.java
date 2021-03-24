package com.basic.controller.portal.openApi;

import com.basic.controller.common.BasicController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/swagger")
public class SwaggerController extends BasicController {
    @GetMapping("")
    public String index() {
        return redirect("/swagger-ui.html");
    }
}

package com.basic.controller.system.log;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.controller.common.BasicController;
import com.basic.entity.SysOperateLog;
import com.basic.service.SysOperateLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 系统日志控制器
 */
@Controller
@RequestMapping("/operateLog")
public class OperateLogController extends BasicController {
    @Autowired
    SysOperateLogService operateLogService;
    String prefix = "system/log";

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/operate_log_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return operateLogService.getPageInfo(map);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

    @GetMapping("view/{id}")
    public String view(@PathVariable String id, Model model) {
        SysOperateLog operateLog = operateLogService.getById(id);
        if (operateLog != null) {
            model.addAttribute("operateLog",operateLog);
        } else {
            return ErrorPage(model);
        }
        return prefix + "/operate_log_view";
    }

}

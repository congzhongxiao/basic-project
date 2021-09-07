package com.basic.controller.system.log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import com.basic.entity.SysLoginLog;
import com.basic.service.SysLoginLogService;

import java.util.List;
import java.util.Map;


/**
*登录信息控制器
*@author: lee
*@time: 2021-09-07 15:38:51
*/

@Controller
@RequestMapping("/loginLog")
public class SysLoginLogController extends BasicController{
    String prefix = "system/log";
    @Autowired
    SysLoginLogService sysLoginLogService;
    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/sys_login_log_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return sysLoginLogService.getPageInfo(map);
        } catch (Exception e) {
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

}
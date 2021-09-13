package com.basic.controller.system.config;

import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;
import com.basic.controller.common.BasicController;
import com.basic.entity.SysConfig;
import com.basic.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


/**
*系统配置控制器
*@author: lee
*@time: 2021-09-11 15:36:32
*/

@Controller
@RequestMapping("/system/config")
public class SysConfigController extends BasicController {
    String prefix = "system/config";
    @Autowired
    SysConfigService sysConfigService;

    @GetMapping("basic")
    public String basic(Model model) {
        List<SysConfig> settingList = sysConfigService.findListByModel("basic");
        Map<String, String> basicMap = settingList.stream().collect(Collectors.toMap(SysConfig::getCode, SysConfig::getValue));
        model.addAttribute("basicMap", basicMap);
        return prefix + "/system_config_basic";
    }
    @PostMapping("basic/save")
    @ResponseBody
    public Result webSave() {
        List<SysConfig> configList = sysConfigService.findListByModel("basic");
        Map<String, SysConfig> basicMap = configList.stream().collect(Collectors.toMap(SysConfig::getCode, setting -> setting));
        List<SysConfig> updateList = new ArrayList<>();
        List<SysConfig> addList = new ArrayList<>();
        Enumeration enu = request.getParameterNames();
        while (enu.hasMoreElements()) {
            String paraName = (String) enu.nextElement();
            String value = request.getParameter(paraName);
            if (StringUtils.isNotBlank(paraName)) {
                if (basicMap.containsKey(paraName)) {
                    SysConfig systemConfig = basicMap.get(paraName);
                    if (systemConfig != null) {
                        systemConfig.setValue(value);
                        updateList.add(systemConfig);
                    }
                } else {
                    SysConfig systemConfig = new SysConfig();
                    systemConfig.setCode(paraName);
                    systemConfig.setModel("basic");
                    systemConfig.setValue(value);
                    addList.add(systemConfig);
                }
            }

        }
        try {
            sysConfigService.saveAndUpdate(addList, updateList,configList);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR, e);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadSysConfig")
    public SysConfig preloadSysConfig(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return sysConfigService.getById(id.trim());
        }
        return null;
    }
}
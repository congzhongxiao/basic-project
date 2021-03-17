package com.basic.controller.system.area;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;
import com.basic.controller.common.BasicController;
import com.basic.entity.SysArea;
import com.basic.service.SysAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Date;


/**
*行政区划控制器
*@author: lee
*@time: 2020-11-12 10:07:45
*/

@Controller
@RequestMapping("/area")
public class SysAreaController extends BasicController {
    String prefix = "area";
    @Autowired
    SysAreaService sysAreaService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/sys_area_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestParam(name = "pid",defaultValue = "0",required = false)String pid) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if(StringUtils.isNotBlank(pid)) {
            queryWrapper.eq("pid",pid);
        } else {
            queryWrapper.eq("pid","0");
        }
        queryWrapper.orderByDesc("sort");
        queryWrapper.orderByAsc("code");
        queryWrapper.orderByDesc("id");

        return Result.success(sysAreaService.list(queryWrapper));
    }

    //添加根页面跳转
    @GetMapping("addRoot")
    public String addRoot() {
        return prefix + "/sys_area_root_add";
    }
    //添加页面数据提交
    @PostMapping("addRoot")
    @ResponseBody
    public Result doAddRoot(@Validated SysArea sysArea) {
        try {
            if(sysAreaService.isCodeExist(sysArea)) {
                return Result.fail("行政区划编码已存在。");
            }
            sysArea.setPid("0");
            sysAreaService.addArea(sysArea);
            return Result.success(sysArea);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加根页面跳转
    @GetMapping("addChild/{pid}")
    public String addChild(@PathVariable String pid,Model model) {
        SysArea parent = sysAreaService.getById(pid);
        if(parent == null) {
            return redirectNoPage();
        }
        model.addAttribute("parent",parent);
        return prefix + "/sys_area_child_add";
    }
    //添加页面数据提交
    @PostMapping("addChild")
    @ResponseBody
    public Result doAdd(@Validated SysArea sysArea) {
        try {
            if(sysAreaService.isCodeExist(sysArea)) {
                return Result.fail("行政区划编码已存在");
            }
            sysAreaService.addArea(sysArea);
            return Result.success(sysArea);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        SysArea sysArea = sysAreaService.getById(id);
        if (sysArea != null) {
            SysArea parent = sysAreaService.getById(sysArea.getPid());
            model.addAttribute("parent",parent);
            model.addAttribute("sysArea", sysArea);
        } else {
            return redirectNoPage();
        }
        return prefix +"/sys_area_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadSysArea") SysArea sysArea) {
        try {
            sysAreaService.updateArea(sysArea);
            return Result.success(sysArea);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //删除根据ids数组删除数据
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "id") String id) {
        try {
            SysArea area = sysAreaService.getById(id);
            if(area != null) {
                sysAreaService.removeById(id);
                return Result.success(area);
            } else {
                return Result.fail("数据不存在或已被删除，请刷新后重试");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadSysArea")
    public SysArea preloadSysArea(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return sysAreaService.getById(id.trim());
        }
        return null;
    }
}
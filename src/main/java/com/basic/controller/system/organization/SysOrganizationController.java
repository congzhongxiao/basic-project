package com.basic.controller.system.organization;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import com.basic.entity.SysOrganization;
import com.basic.service.SysOrganizationService;

import java.util.List;
import java.util.Map;


/**
 * 组织架构控制器
 *
 * @author: lee
 * @time: 2021-03-17 15:22:02
 */

@Controller
@RequestMapping("/organization")
public class SysOrganizationController extends BasicController {
    String prefix = "system/organization";
    @Autowired
    SysOrganizationService sysOrganizationService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/sys_organization_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestParam(name = "pid", defaultValue = "0", required = false) String pid) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if (StringUtils.isNotBlank(pid)) {
            queryWrapper.eq("pid", pid);
        } else {
            queryWrapper.eq("pid", "0");
        }
        queryWrapper.orderByDesc("sort");
        queryWrapper.orderByDesc("id");

        return Result.success(sysOrganizationService.list(queryWrapper));
    }

    //添加根页面跳转
    @GetMapping("addRoot")
    public String addRoot() {
        return prefix + "/sys_organization_root_add";
    }

    //添加页面数据提交
    @PostMapping("addRoot")
    @ResponseBody
    public Result doAddRoot(@Validated SysOrganization organization) {
        try {
            organization.setPid("0");
            sysOrganizationService.addOrganization(organization);
            return Result.success(organization);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加根页面跳转
    @GetMapping("addChild/{pid}")
    public String addChild(@PathVariable String pid, Model model) {
        SysOrganization parent = sysOrganizationService.getById(pid);
        if (parent == null) {
            return redirectNoPage();
        }
        model.addAttribute("parent", parent);
        return prefix + "/sys_organization_child_add";
    }

    //添加页面数据提交
    @PostMapping("addChild")
    @ResponseBody
    public Result doAdd(@Validated SysOrganization organization) {
        try {
            sysOrganizationService.addOrganization(organization);
            return Result.success(organization);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        SysOrganization sysOrganization = sysOrganizationService.getById(id);
        if (sysOrganization != null) {
            SysOrganization parent = sysOrganizationService.getById(sysOrganization.getPid());
            model.addAttribute("parent", parent);
            model.addAttribute("sysOrganization", sysOrganization);
        } else {
            return redirectNoPage();
        }
        return prefix + "/sys_organization_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadSysOrganization") SysOrganization sysOrganization) {
        try {
            sysOrganizationService.updateOrganization(sysOrganization);
            return Result.success(sysOrganization);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }


    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "id") String id) {
        try {
            SysOrganization organization = sysOrganizationService.getById(id);
            if (organization != null) {
                int result = sysOrganizationService.deleteById(id);
                if (result == -1) {
                    return Result.fail("存在下级组织，无法删除");
                } else {
                    return Result.success(organization);
                }
            } else {
                return Result.fail("数据不存在或已被删除，请刷新后重试");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadSysOrganization")
    public SysOrganization preloadSysOrganization(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return sysOrganizationService.getById(id.trim());
        }
        return null;
    }
}
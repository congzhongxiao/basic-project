package com.basic.controller.system.userDuty;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.basic.common.annotation.Log;
import com.basic.common.enums.BusinessType;
import com.basic.entity.SysDuty;
import com.basic.entity.SysOrganization;
import com.basic.entity.UserDuty;
import com.basic.service.SysDutyService;
import com.basic.service.SysOrganizationService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import com.basic.service.UserDutyService;

import java.util.Date;
import java.util.List;
import java.util.Map;


/**
*用户职务表控制器
*@author: djy
*@time: 2022-01-21 14:26:49
*/

@Controller
@RequestMapping("/userDuty")
public class SysUserDutyController extends BasicController{
    String prefix = "system/userDuty";
    @Autowired
    UserDutyService userDutyService;
    @Autowired
    SysDutyService sysDutyService;
    @Autowired
    SysOrganizationService sysOrganizationService;

    //加载列表分页数据
    @PostMapping("findList/{id}")
    @ResponseBody
    public Result findList(@PathVariable String id, @RequestBody Map map) {
        try {
            //筛选条件中加入所选用户的id
            map.put("user_id", id);

            //筛选条件中确定用户职务类型为兼职， 0为主要职务， 1 为兼职。 因为主要职务需要在用户信息中编辑
            map.put("is_main", 1);
            return userDutyService.getPageInfo(map);
        } catch (Exception e) {
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add/{userId}")
    public String add(@PathVariable String userId, Model model) {
        model.addAttribute("userId", userId);
        model.addAttribute("dutyList", sysDutyService.list());
        model.addAttribute("companyList",sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                .eq("org_type", 0)));
        return prefix + "/user_duty_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated UserDuty userDuty) {
        try {

            if(!userDutyService.ifUserDutyValid(userDuty)){
                return Result.fail("该用户已有相同职务！");
            }

            //根据主要职务id填充职务名称
            SysDuty duty = sysDutyService.getById(userDuty.getDutyId());
            userDuty.setCode(duty.getCode());
            userDuty.setIsMain(1);
            //获取到公司部门信息
            SysOrganization company = sysOrganizationService.getById(userDuty.getCompanyId());
            userDuty.setCompanyCode(company.getCode());
            SysOrganization dept = sysOrganizationService.getById(userDuty.getDeptId());
            userDuty.setDeptCode(dept.getCode());
            userDuty.setCreateId(getCurrentUser().getId());
            userDuty.setCreateName(getCurrentUser().getNickname());
            userDuty.setCreateTime(new Date());
            userDutyService.save(userDuty);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        UserDuty userDuty = userDutyService.getById(id);
        if (userDuty != null) {

            //获取公司列表
            List<SysOrganization> companyList = sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                    .eq("org_type", 0));
            model.addAttribute("companyList",companyList);

            //获取部门列表
            List<SysOrganization> deptList = sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                    .eq("org_type", 1)
                    .eq("pid", userDuty.getCompanyId()));
            model.addAttribute("departmentList", deptList);
            model.addAttribute("dutyList", sysDutyService.list());
            model.addAttribute("userDuty", userDuty);
        } else {
            return redirectNoPage();
        }
        return prefix +"/user_duty_update";
    }

    //修改数据提交
    @Log(name = "用户管理设置兼职编辑",type = BusinessType.UPDATE)
    @RequiresPermissions("fun_user_job_update")
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadUserDuty") UserDuty userDuty) {
        try {

            //判断编辑后的的用户职务是否与其他用户职务重复
            if(!userDutyService.ifUpdateUserDutyValid(userDuty)){
                return Result.fail("已有相同职务！");
            }

            userDuty.setUpdateId(getCurrentUser().getId());
            userDuty.setUpdateName(getCurrentUser().getNickname());
            userDuty.setUpdateTime(new Date());
            userDutyService.updateById(userDuty);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //删除根据ids数组删除数据
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "ids") List<String> ids) {
        try {
            for (String id : ids) {
                userDutyService.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadUserDuty")
    public UserDuty preloadUserDuty(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return userDutyService.getById(id.trim());
        }
        return null;
    }
}
package com.basic.controller.system.duty;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.basic.common.annotation.Log;
import com.basic.common.enums.BusinessType;
import com.basic.entity.Dictionary;
import com.basic.entity.UserDuty;
import com.basic.service.DictionaryService;
import com.basic.service.UserDutyService;
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

import com.basic.entity.SysDuty;
import com.basic.service.SysDutyService;

import java.util.Date;
import java.util.List;
import java.util.Map;


/**
*职务控制器
*@author: djy
*@time: 2022-01-21 14:24:47
*/

@Controller
@RequestMapping("/sysDuty")
public class SysDutyController extends BasicController{
    String prefix = "system/duty";
    @Autowired
    SysDutyService sysDutyService;
    @Autowired
    DictionaryService dictionaryService;
    @Autowired
    UserDutyService userDutyService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/sys_duty_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return sysDutyService.getPageInfo(map);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add")
    public String add(Model model) {
        List<Dictionary> dList = dictionaryService.findEnableListByType("duty_limit");
        model.addAttribute("dutyLimitList", dList);
        return prefix + "/sys_duty_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated SysDuty sysDuty) {
        try {
            //判断新添加的信息是否与数据库中的兼职重复
            QueryWrapper<SysDuty> queryWrapper = new QueryWrapper();
            queryWrapper.lambda()
                    .eq(SysDuty::getDutyName,sysDuty.getDutyName())
                    .orderByDesc(SysDuty::getId);
            queryWrapper.last(" limit 1");

            SysDuty oldDuty= sysDutyService.getOne(queryWrapper);
            if(oldDuty!=null){
                return Result.fail("职务已经存在！");
            }

            QueryWrapper<SysDuty> queryWrapper2 = new QueryWrapper();
            queryWrapper2.lambda()
                    .eq(SysDuty::getCode, sysDuty.getCode())
                    .orderByDesc(SysDuty::getId);
            queryWrapper2.last(" limit 1");

            oldDuty= sysDutyService.getOne(queryWrapper2);
            if(oldDuty!=null){
                return Result.fail("职务编码已经存在！");
            }
            sysDuty.setCreateId(getCurrentUser().getId());
            sysDuty.setCreateName(getCurrentUser().getNickname());
            sysDuty.setCreateTime(new Date());
            sysDutyService.save(sysDuty);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        SysDuty sysDuty = sysDutyService.getById(id);
        if (sysDuty != null) {
            model.addAttribute("sysDuty", sysDuty);
            List<Dictionary> dList = dictionaryService.findEnableListByType("duty_limit");
            model.addAttribute("dutyLimitList", dList);
        } else {
            return redirectNoPage();
        }
        return prefix +"/sys_duty_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadSysDuty") SysDuty sysDuty) {
        try {
            //判断新添加的信息是否与数据库中的兼职重复
            QueryWrapper<SysDuty> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda()
                    .eq(SysDuty::getDutyName, sysDuty.getDutyName())
                    .orderByDesc(SysDuty::getId);
            queryWrapper.last(" limit 1");
            SysDuty oldDuty= sysDutyService.getOne(queryWrapper);
            if(oldDuty!=null&&!oldDuty.getId().equals(sysDuty.getId())){
                return Result.fail("职务已经存在！");
            }

            QueryWrapper<SysDuty> queryWrapper2 = new QueryWrapper<>();
            queryWrapper2.lambda()
                    .eq(SysDuty::getCode,sysDuty.getCode())
                    .orderByDesc(SysDuty::getId);
            queryWrapper2.last(" limit 1");

            oldDuty= sysDutyService.getOne(queryWrapper2);
            if(oldDuty!=null&&!oldDuty.getId().equals(sysDuty.getId())){
                return Result.fail("职务编码已经存在！");
            }

            sysDuty.setUpdateId(getCurrentUser().getId());
            sysDuty.setUpdateName(getCurrentUser().getNickname());
            sysDuty.setUpdateTime(new Date());
            sysDutyService.updateDuty(sysDuty);
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
                //根据dutyid返回一个用户职务集合
                List<UserDuty> userDutyList = userDutyService.findListByDutyId(id);

                //若集合不为空，则不允许删除
                if(userDutyList!=null&&userDutyList.size()>0){
                    return Result.fail("该职务仍有用户关联无法删除！");
                }
                sysDutyService.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadSysDuty")
    public SysDuty preloadSysDuty(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return sysDutyService.getById(id.trim());
        }
        return null;
    }
}
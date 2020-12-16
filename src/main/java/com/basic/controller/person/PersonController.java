package com.basic.controller.person;

import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.poi.ExcelUtil;
import com.basic.common.utils.StringUtils;
import com.basic.controller.common.BasicController;
import com.basic.entity.Person;
import com.basic.service.PersonService;
import com.basic.service.SysAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * 人员信息控制器
 *
 * @author: lee
 * @time: 2020-05-07 10:03:33
 */

@Controller
@RequestMapping("/person")
public class PersonController extends BasicController {
    String prefix = "person";
    @Autowired
    PersonService personService;
    @Autowired
    SysAreaService sysAreaService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/person_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return personService.getPageInfo(map);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add")
    public String add(Model model) {
        model.addAttribute("areaList",sysAreaService.list());
        return prefix + "/person_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated Person person) {
        try {
            person.setCreateBy(getCurrentUser().getUsername());
            person.setCreateTime(new Date());
            boolean result = personService.add(person);
            if (result) {
                return Result.success();
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
        return Result.fail();
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        Person person = personService.getById(id);
        if (person != null) {
            model.addAttribute("person", person);
        } else {
            return redirectNoPage();
        }
        return prefix + "/person_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadPerson") Person person) {
        try {
            personService.updateById(person);
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
                personService.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    @PostMapping("export")
    @ResponseBody
    public Result export() {
        List<Person> list = personService.list();
        ExcelUtil<Person> util = new ExcelUtil<>(Person.class);
        return util.exportExcel(list, "个人信息数据");
    }

    @PostMapping("/importData")
    @ResponseBody
    public Result importData(MultipartFile file) throws Exception {
        ExcelUtil<Person> util = new ExcelUtil<>(Person.class);
        List<Person> personList = util.importExcel(file.getInputStream());
        return personService.importPerson(personList, getCurrentUser().getUsername());
    }

    @GetMapping("importTemplate")
    @ResponseBody
    public Result importTemplate() {
        ExcelUtil<Person> personExcelUtil = new ExcelUtil<>(Person.class);
        return personExcelUtil.importTemplateExcel("人员信息");
    }

    //预加载对象数据
    @ModelAttribute("preloadPerson")
    public Person preloadPerson(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return personService.getById(id.trim());
        }
        return null;
    }
}
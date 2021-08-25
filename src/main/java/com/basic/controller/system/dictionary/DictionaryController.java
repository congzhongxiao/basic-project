package com.basic.controller.system.dictionary;

import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;
import com.basic.controller.common.BasicController;
import com.basic.entity.Dictionary;
import com.basic.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


/**
 * 字典控制器
 *
 * @author: lee
 * @time: 2020-05-14 11:44:10
 */

@Controller
@RequestMapping("/dictionary")
public class DictionaryController extends BasicController {
    String prefix = "system/dictionary";
    @Autowired
    DictionaryService dictionaryService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/dictionary_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return dictionaryService.getPageInfo(map);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

    //添加页面跳转
    @GetMapping("add")
    public String add() {
        return prefix + "/dictionary_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated Dictionary dictionary) {
        try {
            boolean result = dictionaryService.add(dictionary);
            if (result) {
                return Result.success();
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
        return Result.fail();
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        Dictionary dictionary = dictionaryService.getById(id);
        if (dictionary != null) {
            model.addAttribute("dictionary", dictionary);
        } else {
            return ErrorPage(model);
        }
        return prefix + "/dictionary_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadDictionary") Dictionary dictionary) {
        try {
            dictionaryService.updateById(dictionary);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

    //删除根据ids数组删除数据
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "ids") List<String> ids) {
        try {
            for (String id : ids) {
                dictionaryService.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadDictionary")
    public Dictionary preloadDictionary(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return dictionaryService.getById(id.trim());
        }
        return null;
    }
}
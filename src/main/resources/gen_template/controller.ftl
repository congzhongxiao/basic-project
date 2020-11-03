package ${pageInfo.parentPage}.${pageInfo.controllerPage};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.common.base.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import ${pageInfo.parentPage}.${pageInfo.entityPage}.${entityName};
import ${pageInfo.parentPage}.${pageInfo.servicePage}.${serviceName};

import java.util.List;
import java.util.Map;


/**
*${functionName}控制器
*@author: ${author}
*@time: ${createDate}
*/

@Controller
@RequestMapping("/${varName}")
public class ${controllerName} extends BasicController{
    String prefix = "${htmlFolder}";
    @Autowired
    ${serviceName} ${varName}Service;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/${tableName}_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return ${varName}Service.getPageInfo(map);
        } catch (Exception e) {
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add")
    public String add() {
        return prefix + "/${tableName}_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated ${entityName} ${varName}) {
        try {
            ${varName}Service.save(${varName});
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        ${entityName} ${varName} = ${varName}Service.getById(id);
        if (${varName} != null) {
            model.addAttribute("${varName}", ${varName});
        } else {
            return redirectNoPage();
        }
        return prefix +"/${tableName}_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preload${entityName}") ${entityName} ${varName}) {
        try {
            ${varName}Service.updateById( ${varName});
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
                ${varName}Service.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preload${entityName}")
    public ${entityName} preload${entityName}(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return ${varName}Service.getById(id.trim());
        }
        return null;
    }
}
package com.basic.controller.system.permission;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.domain.Ztree;
import com.basic.common.utils.StringUtils;
import com.basic.controller.common.BasicController;
import com.basic.entity.Permission;
import com.basic.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController extends BasicController {
    @Autowired
    PermissionService permissionService;
    String prefix = "system/permission";

    @GetMapping("")
    public String list() {
        return prefix + "/permission_list";
    }

    //列表数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestParam(name = "pid", defaultValue = "0", required = false) String pid) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if (StringUtils.isNotBlank(pid)) {
            queryWrapper.eq("pid", pid);
        } else {
            queryWrapper.eq("pid", "0");
        }
        queryWrapper.orderByDesc("id");
        return Result.success(permissionService.list(queryWrapper));
    }

    //添加根页面跳转
    @GetMapping("addRoot")
    public String addRoot() {
        return prefix + "/permission_root_add";
    }

    @PostMapping("addRoot")
    @ResponseBody
    public Result doAddRoot(@Validated Permission permission) {
        try {
            if (permissionService.isCodeExist(permission)) {
                return Result.fail("权限编码已存在。");
            }
            permission.setPid("0");
            permissionService.save(permission);
            return Result.success(permission);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

    //添加根页面跳转
    @GetMapping("addChild/{pid}")
    public String addChild(@PathVariable String pid, Model model) {
        Permission parent = permissionService.getById(pid);
        if (parent == null) {
            return ErrorPage(model);
        }
        model.addAttribute("parent", parent);
        return prefix + "/permission_child_add";
    }

    //添加页面数据提交
    @PostMapping("addChild")
    @ResponseBody
    public Result doAddChild(@Validated Permission permission) {
        try {
            if (permissionService.isCodeExist(permission)) {
                return Result.fail("权限编码已存在");
            }
            permissionService.save(permission);
            return Result.success(permission);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }


    @GetMapping("selectPermissionTree/{id}")
    public String selectPermissionTree(@PathVariable("id") String id, Model model) {

        Permission permission = permissionService.getById(id);
        if (permission == null) {
            permission = new Permission();
            permission.setId("0");
        }
        model.addAttribute("permission", permission);
        return prefix + "/permission_tree";
    }

    //ztree加载数据
    @GetMapping("findAllTree")
    @ResponseBody
    public List<Ztree> findTreeList() {
        return permissionService.getAllTree();
    }

    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        Permission permission = permissionService.getById(id);
        if (permission != null) {
            Permission parent = permissionService.getById(permission.getPid());
            model.addAttribute("parent", parent);
            model.addAttribute("permission", permission);
        } else {
            return ErrorPage(model);
        }
        return prefix + "/permission_update";
    }

    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadPermission") Permission permission) {
        List<Permission> exists = permissionService.getPermissionListByCode(permission.getCode());
        if (exists != null && exists.size() > 0) {
            if (exists.size() != 1) {
                return Result.fail("权限编码已存在");
            } else {
                if (!(exists.get(0).getId()).equals(permission.getId())) {
                    return Result.fail("权限编码已存在");
                }
            }
        }
        permissionService.updateById(permission);
        return Result.success(permission);
    }

    @ModelAttribute("preloadPermission")
    public Permission preloadPermission(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return permissionService.getById(id.trim());
        }
        return null;
    }

    //删除根据ids数组删除数据
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "id") String id) {
        try {
            Permission permission = permissionService.getById(id);
            if (permission != null) {
               int result = permissionService.deleteById(id);
               if(result == -1) {
                   return Result.fail("该权限存在子权限，无法删除");
               } else {
                   return Result.success(permission);
               }
            } else {
                return Result.fail("数据不存在或已被删除，请刷新后重试");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

    //ztree加载数据
    @GetMapping("getPermissionTreeForRole")
    @ResponseBody
    public List<Ztree> getPermissionTreeForRole() {
        String roleId = request.getParameter("roleId");
        return permissionService.getPermissionTreeForRole(roleId);
    }
}

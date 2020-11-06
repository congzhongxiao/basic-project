package com.basic.controller.system.permission;

import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.Ztree;
import com.basic.common.utils.StringUtils;
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
    public Result findList() {

        return Result.success(permissionService.list());
    }

    @GetMapping("add/{pid}")
    public String add(@PathVariable("pid") String pid, Model model) {
        Permission parent = permissionService.getById(pid);
        if (parent == null) {
            parent = new Permission();
            parent.setId("0");
        }
        model.addAttribute("parent", parent);
        return prefix + "/permission_add";
    }

    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated Permission permission) {
        String pid = request.getParameter("pid");
        if (StringUtils.isEmpty(pid)) {
            pid = "0";
        }
        permission.setPid(pid);
        List<Permission> exists =  permissionService.getPermissionListByCode(permission.getCode());
        if(exists != null && exists.size() > 0) {
            return Result.fail("权限编码已存在");
        }
        boolean isSuccess = permissionService.save(permission);
        if (isSuccess) {
            return Result.success(permission);
        }
        return Result.fail();
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
        if(permission != null) {
            Permission parent = permissionService.getById(permission.getPid());
            if(parent == null) {
                parent = new Permission();
                parent.setId("0");
            }
            model.addAttribute("parent", parent);
            model.addAttribute("permission", permission);
        } else {
            return redirectNoPage();
        }
        return prefix + "/permission_update";
    }

    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadPermission") Permission permission) {
        List<Permission> exists =  permissionService.getPermissionListByCode(permission.getCode());
        if(exists != null && exists.size() > 0) {
            if(exists.size() != 1) {
                return Result.fail("权限编码已存在");
            } else {
                if(!(exists.get(0).getId()).equals(permission.getId())){
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

    @GetMapping("delete/{id}")
    @ResponseBody
    public Result delete(@PathVariable("id") String id) {
        try {
            int result = permissionService.deleteById(id);
            if (result == -1) {
                return Result.fail("存在子权限，删除失败！");
            }
            return Result.success();
        } catch (Exception e) {
            return Result.fail("权限删除异常！");
        }
    }

    /**
     * 根据编码和id判断是否存在
     * id默认值-1  新增情况
     *
     * @param code
     * @param id
     * @return
     */
    @PostMapping("checkCode")
    @ResponseBody
    public boolean checkCode(@RequestParam(value = "code") String code, @RequestParam(value = "id", defaultValue = "-1") String id) {
        List<Permission> permissionList = permissionService.getPermissionListByCode(code);
        if (permissionList != null && permissionList.size() > 0) {
            if ("-1".equals(id)) {
                return false;
            } else {
                for (Permission per : permissionList) {
                    if (per.getId().equals(id)) {
                        return true;
                    }
                }
            }
        } else {
            return true;
        }
        return false;
    }

    //ztree加载数据
    @GetMapping("getPermissionTreeForRole")
    @ResponseBody
    public List<Ztree> getPermissionTreeForRole() {
        String roleId = request.getParameter("roleId");
        return permissionService.getPermissionTreeForRole(roleId);
    }
}

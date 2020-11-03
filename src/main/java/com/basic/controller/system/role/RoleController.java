package com.basic.controller.system.role;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.base.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.utils.StringUtils;
import com.basic.entity.Role;
import com.basic.entity.RolePermission;
import com.basic.service.PermissionService;
import com.basic.service.RolePermissionService;
import com.basic.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController extends BasicController {
    @Autowired
    RoleService roleService;
    @Autowired
    PermissionService permissionService;
    @Autowired
    RolePermissionService rolePermissionService;

    String prefix = "system/role";
    @GetMapping("")
    public String list(){
        return prefix + "/role_list";
    }

    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map){
        return roleService.getPageInfo(map);
    }

    @GetMapping("add")
    public String add(){
        return prefix + "/role_add";
    }
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated Role role){
        try{
            roleService.save(role);
            return Result.success();
        } catch (Exception e) {
            return Result.fail();
        }
    }

    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model){
        Role role = roleService.getById(id);
        if(role != null) {
            model.addAttribute("role",role);
        } else {
            return redirectNoPage();
        }
        return prefix + "/role_update";
    }
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadRole")Role role){
        try {
            roleService.updateById(role);
            return Result.success();
        } catch (Exception e) {
            return Result.fail();
        }
    }

    @GetMapping("authorize/{id}")
    public String authorize(@PathVariable String id, Model model){
        Role role = roleService.getById(id);
        model.addAttribute("role",role) ;
        return prefix + "/role_authorize";
    }

    @PostMapping("authorize")
    @ResponseBody
    public Result doAuthorize(@ModelAttribute(value = "preloadRole")Role role){
        try {
            if(role != null) {
                String roleId = role.getId();
                String strPermissionIds = request.getParameter("permissionIds");
                //先把关系删除
                rolePermissionService.deleteRolePermissionByRoleId(roleId);
                if(!StringUtils.isEmpty(strPermissionIds)) {//如果有选中的权限
                    String [] strIds = strPermissionIds.split(",");
                    List<RolePermission> saveRecords = new ArrayList<>();
                    for(String strId : strIds) {
                        RolePermission temp = new RolePermission();
                        temp.setRoleId(roleId);
                        if(permissionService.getById(strId) != null) {
                            temp.setPermId(strId);
                            saveRecords.add(temp);
                        }
                    }
                    if(saveRecords.size() > 0) {
                        rolePermissionService.saveBatch(saveRecords);
                        return Result.success();
                    }
                } else {
                    return Result.success();

                }
            }
        }catch (Exception e) {

        }
        return Result.fail();
    }

    @ModelAttribute("preloadRole")
    public Role preloadRole(@RequestParam(value = "id",required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return roleService.getById(id.trim());
        }
        return null;
    }
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "ids") List<String> ids){
        try {
            for (String id :ids) {
                roleService.removeById(id);
            }
            return Result.success();
        } catch (Exception e){
            return Result.fail();
        }
    }
}

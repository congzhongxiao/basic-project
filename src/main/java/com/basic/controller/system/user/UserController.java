package com.basic.controller.system.user;

import com.basic.common.annotation.Log;
import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.enums.BusinessType;
import com.basic.common.utils.EncryptionUtil;
import com.basic.common.utils.StringUtils;
import com.basic.entity.Role;
import com.basic.entity.User;
import com.basic.entity.UserRole;
import com.basic.service.RoleService;
import com.basic.service.UserRoleService;
import com.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController extends BasicController {
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Autowired
    UserRoleService userRoleService;

    String prefix = "system/user";

    //列表页面
    @GetMapping("")
    public String list() {
        return prefix + "/user_list";
    }

    @Log(name = "用户列表",type = BusinessType.INSERT)
    @RequestMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        return userService.getPageInfo(map);
    }
    //加载列表分页数据
    //新增页面
    @GetMapping("add")
    public String add() {

        return prefix + "/user_add";
    }
    //新增数据保存
    @Log(name = "新增用户",type = BusinessType.INSERT)
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated User user) {
        try {
            String confirmPassword = request.getParameter("confirmPassword");
            if (userService.getByUsername(user.getUsername()) != null) {
                return Result.fail("用户名已存在！");
            }
            if (!confirmPassword.equals(user.getPassword())) {
                return Result.fail("密码和确认密码不一致！");
            }
            boolean result = userService.add(user);
            if (result) {
                return Result.success("用户创建成功！");
            } else {
                return Result.fail("创建保存异常！");
            }
        } catch (Exception e) {
            return Result.fail("创建保存异常！");
        }
    }


    //用户名唯一检查
    @PostMapping("checkUserName")
    @ResponseBody
    public boolean checkUserName(@RequestParam String username) {
        if (StringUtils.isEmpty(username)) {
            return false;
        }
        if (userService.getByUsername(username) != null) {
            return false;
        }
        return true;
    }

    @PostMapping("state")
    @ResponseBody
    public Result status(@RequestParam String id) {
        try {
            User user = userService.getById(id);
            if (user != null) {
                String message = user.getState() == 1 ? "用户禁用成功！" : "用户启用成功！";
                user.setState(user.getState() == 0 ? 1 : 0);
                userService.updateById(user);
                return Result.success(message);
            } else {
                return Result.fail("信息不存在或已被删除！");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //用户授权
    @GetMapping("empower/{id}")
    public String empower(@PathVariable String id, Model model) {
        User user = userService.getById(id);
        if (user != null) {
            model.addAttribute("userInfo", user);
            List<Role> userRoles = roleService.getRoleListByUserId(id);
            String userRoleIds = "";
            if (userRoles != null && userRoles.size() > 0) {
                for (Role role : userRoles) {
                    userRoleIds += "".equals(userRoleIds) ? role.getId() + "" : "," + role.getId();
                }
            }
            model.addAttribute("userRoleIds", userRoleIds);
            List<Role> roleList = roleService.getAllRoles();
            model.addAttribute("roleList", roleList);
        } else {
           return redirectNoPage();
        }
        return prefix + "/user_empower";
    }
    @GetMapping("resetPassword")
    public String resetPassword(Model model){
        model.addAttribute("user",getCurrentUser());
        return prefix + "/user_reset_password";
    }

    @PostMapping("resetPassword")
    @ResponseBody
    public Result resetPassword(){
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        if(StringUtils.isBlank(oldPassword)) {
            return Result.fail("请输入原密码");
        }
        if(StringUtils.isBlank(newPassword)) {
            return Result.fail("请输入新密码");
        }
        User user = getCurrentUser();
        if(!StringUtils.equals(EncryptionUtil.encryption(user.getUsername(),oldPassword,user.getSalt()),user.getPassword())) {
            return Result.fail("原密码不正确");
        }
        user.setSalt(EncryptionUtil.getRandomString(10));
        user.setPassword(EncryptionUtil.encryption(user.getUsername(),newPassword,user.getSalt()));
        userService.updateById(user);
        return Result.success("密码重置成功");
    }


    @PostMapping("empower")
    @ResponseBody
    public Result doEmpower(@ModelAttribute("preloadUser") User user, @RequestParam(value = "role_id", required = false) List<String> roleIds) {
        try {
            String userId = user.getId();
            userRoleService.deleteByUserId(user.getId());
            if (roleIds != null && roleIds.size() > 0) {
                List<UserRole> userRoleList = new ArrayList<>();
                for (String roleId : roleIds) {
                    if (roleService.getById(roleId) != null) {
                        UserRole userRole = new UserRole();
                        userRole.setUserId(userId);
                        userRole.setRoleId(roleId);
                        userRoleList.add(userRole);
                    }
                }
                if (userRoleList.size() > 0) {
                    userRoleService.saveBatch(userRoleList);
                    return Result.success();
                }
            }
            return Result.success();
        } catch (Exception e) {
            return Result.fail();
        }
    }

    /**
     * 修改页面跳转
     */
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        User user = userService.getById(id);
        if (user != null) {
            model.addAttribute("userInfo", user);
        } else {
            return redirectNoPage();
        }
        return prefix + "/user_update";
    }

    /**
     * 管理员修改数据提交
     *
     * @param user
     * @return
     */
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadUser") User user) {
        try {
            User userInfo = userService.getById(user.getId());
            if (userInfo != null) {
                userInfo.setNickname(user.getNickname());
                userInfo.setEmail(user.getEmail());
                userInfo.setMobile(user.getMobile());
                userInfo.setUpdateTime(new Date());
                userService.updateById(userInfo);
                return Result.success("信息修改成功");
            } else {
                return Result.fail("信息不存在或已被删除");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }


    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "ids") List<String> ids) {
        try {
            for (String id : ids) {
                userService.removeById(id);
            }
            return Result.success("删除成功");
        } catch (Exception e) {
            return Result.fail("删除异常！");
        }
    }

    @ModelAttribute("preloadUser")
    public User getUser(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return userService.getById(id.trim());
        }
        return null;
    }
}

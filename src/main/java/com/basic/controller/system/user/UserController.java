package com.basic.controller.system.user;

import com.basic.common.annotation.Log;
import com.basic.common.constants.UserConstant;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.enums.BusinessType;
import com.basic.common.utils.DateUtils;
import com.basic.common.utils.EncryptionUtil;
import com.basic.common.utils.StringUtils;
import com.basic.controller.common.BasicController;
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

    @ModelAttribute
    public void userInit(Model model) {
        model.addAttribute("nameMin", UserConstant.USER_NAME_LENGTH_MIN);
        model.addAttribute("nameMax", UserConstant.USER_NAME_LENGTH_MAX);
        model.addAttribute("passwordMin", UserConstant.USER_PASSWORD_LENGTH_MIN);
        model.addAttribute("passwordMax", UserConstant.USER_PASSWORD_LENGTH_MAX);
    }

    //列表页面
    @GetMapping("")
    public String list() {
        return prefix + "/user_list";
    }

    @RequestMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return userService.getPageInfo(map);
        } catch (Exception e) {
            return Result.fail("查询数据获取异常", e);
        }

    }

    //加载列表分页数据
    //新增页面
    @GetMapping("add")
    public String add(Model model) {
        List<Role> roleList = roleService.getAllRoles();
        model.addAttribute("roleList", roleList);
        return prefix + "/user_add";
    }

    //新增数据保存
    @Log(name = "新增用户", type = BusinessType.INSERT)
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated User user, @RequestParam(value = "role_id", required = false) List<String> roleIds) {
        try {
            if (userService.getByUsername(user.getUsername()) != null) {
                return Result.fail("登录帐号已存在！");
            }
            Result validate = userService.validateUserNameAndPassword(user.getUsername(), user.getPassword());
            if (!validate.isSuccess()) {
                return Result.fail(validate.getMessage());
            }
            userService.createUser(user, roleIds);
            return Result.success("用户创建成功！");
        } catch (Exception e) {
            return Result.fail("用户创建发生异常！", e);
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

    @Log(name = "用户状态变更", type = BusinessType.UPDATE)
    @PostMapping("state")
    @ResponseBody
    public Result status(@RequestParam String id) {
        try {
            User user = userService.getById(id);
            if (user != null) {
                String message = user.getStatus() == 1 ? "用户禁用成功！" : "用户启用成功！";
                user.setStatus(user.getStatus() == 0 ? 1 : 0);
                userService.updateById(user);
                return Result.success(message);
            } else {
                return Result.fail("信息不存在或已被删除！");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR, e);
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
            return ErrorPage(model);
        }
        return prefix + "/user_empower";
    }

    @PostMapping("resetPassword")
    @ResponseBody
    public Result resetPassword(@RequestParam(value = "id") String id) {
        User user = userService.getById(id);
        if (user == null) {
            return Result.fail("用户不存在或已被删除");
        }
        user.setSalt(EncryptionUtil.getRandomString(10));
        user.setPassword(EncryptionUtil.encryption(UserConstant.USER_RESET_DEFAULT_PASSWORD, user.getSalt()));
        user.setPasswordTime(new Date());
        user.setPasswordStatus(1);
        userService.updateById(user);
        return Result.success("密码重置成功，初始密码为：" + UserConstant.USER_RESET_DEFAULT_PASSWORD);
    }

    //检查密码重置情况
    @GetMapping("checkPasswordReset")
    @ResponseBody
    public Result checkPassword() {
        User currentUser = getCurrentUser();
        if (currentUser.getPasswordStatus() == 1) {//用户密码需要初始化
            return Result.fail("系统检测您的密码已长时间未更新，为保障您的帐号安全，请先修改密码后再继续操作。");
        }
        if (UserConstant.USER_PASSWORD_INVALID_CHECK && currentUser.getPasswordTime() != null) {//用户密码重置时间不存在的情况不进行过期检查
            long resetTimeDiff = DateUtils.getDateDiff(DateUtils.getNowDate(), currentUser.getPasswordTime());
            //当前时间与密码重置时间差大于设置数值时，要求用户修改密码
            if (resetTimeDiff > UserConstant.USER_PASSWORD_INVALID_TIME) {
                return Result.fail("系统检测您的密码已长时间未更新，为保障您的帐号安全，请先修改密码后再继续操作。");
            }
        }
        return Result.success();
    }

    @GetMapping("changePassword")
    public String changePassword(Model model) {
        model.addAttribute("user", getCurrentUser());
        return prefix + "/user_change_password";
    }

    @Log(name = "用户修改密码", type = BusinessType.UPDATE)
    @PostMapping("changePassword")
    @ResponseBody
    public Result changePassword() {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        if (StringUtils.isBlank(oldPassword)) {
            return Result.fail("请输入原密码");
        }
        if (StringUtils.isBlank(newPassword)) {
            return Result.fail("请输入新密码");
        }
        if (StringUtils.isBlank(confirmPassword)) {
            return Result.fail("请输入确认密码");
        }
        if (!StringUtils.equals(confirmPassword, newPassword)) {
            return Result.fail("确认密码和新密码不一致");
        }

        User user = getCurrentUser();
        if (!StringUtils.equals(EncryptionUtil.encryption(oldPassword, user.getSalt()), user.getPassword())) {
            return Result.fail("原密码不正确");
        }
        Result validate = userService.validateUserNameAndPassword(user.getUsername(), newPassword);
        if (!validate.isSuccess()) {
            return Result.fail(validate.getMessage());
        }
        user.setSalt(EncryptionUtil.getRandomString(10));
        user.setPassword(EncryptionUtil.encryption(newPassword, user.getSalt()));
        user.setPasswordTime(new Date());
        user.setPasswordStatus(0);
        userService.updateById(user);
        return Result.success("密码修改成功");
    }

    @Log(name = "用户授权", type = BusinessType.GRANT)
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
            return ErrorPage(model);
        }
        return prefix + "/user_update";
    }

    /**
     * 管理员修改数据提交
     *
     * @param user
     * @return
     */
    @Log(name = "用户信息修改", type = BusinessType.UPDATE)
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadUser") User user) {
        try {
            User userInfo = userService.getById(user.getId());
            if (userInfo != null) {
                userInfo.setNickname(user.getNickname());
                userInfo.setEmail(user.getEmail());
                userInfo.setMobile(user.getMobile());
                userInfo.setRemark(user.getRemark());
                userInfo.setStatus(user.getStatus());
                userService.updateById(userInfo);
                return Result.success("信息修改成功");
            } else {
                return Result.fail("信息不存在或已被删除");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR, e);
        }
    }

    @Log(name = "用户信息删除", type = BusinessType.DELETE)
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

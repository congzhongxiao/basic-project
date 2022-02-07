package com.basic.controller.system.user;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.annotation.Log;
import com.basic.common.constants.UserConstant;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.domain.Ztree;
import com.basic.common.enums.BusinessType;
import com.basic.common.utils.DateUtils;
import com.basic.common.utils.EncryptionUtil;
import com.basic.common.utils.StringUtils;
import com.basic.controller.common.BasicController;
import com.basic.entity.*;
import com.basic.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
    @Autowired
    SysDutyService sysDutyService;
    @Autowired
    UserDutyService userDutyService;
    @Autowired
    SysOrganizationService sysOrganizationService;

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
    public String list(Model model) {
        model.addAttribute("dutyList", sysDutyService.list());
        model.addAttribute("companyList",sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                .eq("org_type", 0)));
        return prefix + "/user_list";
    }

    @RequestMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            IPage<Map<String, Object>> page = userService.getUserPageInfo(map, getCurrentUser());
            return Result.success(installPageData(page));
        }catch (Exception e) {
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //新增页面
    @GetMapping("addUser")
    public String add(Model model) {
        model.addAttribute("dutyList", sysDutyService.list());
        List<SysOrganization> companyList = userDutyService.findAccessibleCompanyWithMainCompany(getCurrentUser());
        model.addAttribute("companyList",companyList);
        String orgId = request.getParameter("orgId");
        if(StringUtils.isNotBlank(orgId)){
            SysOrganization selectedOrg = sysOrganizationService.getById(orgId);

            //若选中的为公司
            if("0".equals(selectedOrg.getOrgType())){
                //若选中了公司节点，则根据选中节点返回公司，属于公司的部门
                List<SysOrganization> deptList = sysOrganizationService.findDirectChildrenDeptByCompanyId(orgId);
                model.addAttribute("selectCompanyId", orgId);
                if(deptList!=null&& deptList.size()>0){
                    model.addAttribute("deptList", deptList);
                }

            }
            //若选中的为部门
            if("1".equals(selectedOrg.getOrgType())){
                //若选中了部门节点， 则找到部门所属的公司
                SysOrganization parentCompany = sysOrganizationService.getUpperCompany(orgId);
                if(parentCompany!=null){
                    List<SysOrganization> deptList = sysOrganizationService.findDirectChildrenDeptByCompanyId(parentCompany.getId());
                    model.addAttribute("selectCompanyId", parentCompany.getId());
                    model.addAttribute("selectDeptId", orgId);

                    if(deptList!=null&& deptList.size()>0){
                        model.addAttribute("deptList", deptList);
                    }
                }
            }

        }
        return prefix + "/user_add";
    }

    //新增数据保存
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated User user) {
        try {
            String confirmPassword = request.getParameter("confirmPassword");
            User sysUser = userService.getByUsername(user.getUsername());
            if (sysUser != null) {
                return Result.fail("用户名已存在！");
            }
            if (!confirmPassword.equals(user.getPassword())) {
                return Result.fail("密码和确认密码不一致！");
            }

            // 校验用户显示顺序
            if (!validUserSort(user)) {
                return Result.fail("同一部门下显示顺序不允许重复！");
            }

            user.setStatus(1);
            user.setSalt(EncryptionUtil.getRandomString(10));
            user.setPassword(EncryptionUtil.encryption(user.getPassword(),user.getSalt()));
            //获取到公司信息
            SysOrganization company = sysOrganizationService.getById(user.getCompanyId());
            user.setCompanyCode(company.getCode());
            SysOrganization dept = sysOrganizationService.getById(user.getDeptId());
            user.setDeptCode(dept.getCode());
            userService.save(user);
            //保存主要职务到兼职表
            user.setUserDutyId(userDutyService.insertNewUserDuty(user));
            userService.updateById(user);
            return Result.success("操作成功！");
        } catch (Exception e) {
            System.out.println("error:"+e.getMessage());
            return Result.fail("创建保存异常！"+e.getMessage());
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

    //用户启用禁用状态
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
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //用户授权（设置角色）
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

    @GetMapping("changePassword")
    public String changePassword(Model model) {
        model.addAttribute("user", getCurrentUser());
        return prefix + "/user_change_password";
    }

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
        if(!StringUtils.equals(confirmPassword,newPassword)) {
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
        if(currentUser.getPasswordStatus() == 1) {//用户密码需要初始化
            return Result.fail("系统检测您的密码已长时间未更新，为保障您的账号安全，请先修改密码后再继续操作。");
        }
        if(UserConstant.USER_PASSWORD_INVALID_CHECK && currentUser.getPasswordTime() != null) {//用户密码重置时间不存在的情况不进行过期检查
            long resetTimeDiff = DateUtils.getDateDiff(DateUtils.getNowDate(), currentUser.getPasswordTime());
            //当前时间与密码重置时间差大于设置数值时，要求用户修改密码
            if(resetTimeDiff > UserConstant.USER_PASSWORD_INVALID_TIME){
                return Result.fail("系统检测您的密码已长时间未更新，为保障您的账号安全，请先修改密码后再继续操作。");
            }
        }
        return Result.success();
    }


    //设置角色
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
            List<SysOrganization> companyList = userDutyService.findAccessibleCompanyWithMainCompany(getCurrentUser());
            model.addAttribute("companyList",companyList);
            List<SysOrganization> departmentList = sysOrganizationService.findDirectChildrenDeptByCompanyId(user.getCompanyId());
            model.addAttribute("departmentList",departmentList);
            model.addAttribute("dutyList", sysDutyService.list());
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
            UserDuty mainDuty = userDutyService.findMainDuty(userInfo);
            if (userInfo != null) {
                // 校验用户显示顺序
                if (!validUserSort(user)) {
                    return Result.fail("同一部门下显示顺序不允许重复！");
                }

                userInfo.setNickname(user.getNickname());
                userInfo.setEmail(user.getEmail());
                userInfo.setMobile(user.getMobile());
                userInfo.setCompanyId(user.getCompanyId());
                userInfo.setCompanyName(user.getCompanyName());
                userInfo.setDeptId(user.getDeptId());
                userInfo.setDeptName(user.getDeptName());
                userInfo.setSort(user.getSort());
                //获取到公司信息
                SysOrganization company = sysOrganizationService.getById(user.getCompanyId());
                userInfo.setCompanyCode(company.getCode());
                SysOrganization dept = sysOrganizationService.getById(user.getDeptId());
                userInfo.setDeptCode(dept.getCode());
                userInfo.setDutyId(user.getDutyId());
                userInfo.setDutyName(user.getDutyName());
                userInfo.setRemark(user.getRemark());

                if(mainDuty==null){
                    userInfo.setUserDutyId(userDutyService.insertNewUserDuty(userInfo));
                }else{
                    //变更主要职务到兼职表
                    boolean result = userDutyService.updateMainDuty(userInfo);
                    if(!result){
                        return Result.fail("用户更新失败!");
                    }
                }

                userService.updateById(userInfo);
                return Result.success("信息修改成功");
            } else {
                return Result.fail("信息不存在或已被删除");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //删除
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "ids") List<String> ids) {
        try {
            for (String id : ids) {
                userService.removeById(id);
                userDutyService.deleteByUserId(id);
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
    //编辑兼职
    @GetMapping("userDuty/{id}")
    public String userDuty(@PathVariable String id, Model model) {
        User user = userService.getById(id);
        if (user != null) {
            model.addAttribute("userId", user.getId());
            model.addAttribute("dutyList", sysDutyService.list());
            model.addAttribute("companyList",sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                    .eq("org_type", 0)));
        } else {
            return redirectNoPage();
        }
        return "system/userDuty/user_duty_list";
    }



    /**
     * 用户树，包含兼职、主职的用户信息
     */
    @GetMapping("userTree")
    public String userTree(Model model) {
        model.addAttribute("currentUser",getCurrentUser());

        return prefix + "/all_user_tree";
    }



    /**
     * 用户树，包含兼职、主职的用户信息, 只允许单选
     */
    @GetMapping("userRadioTree")
    public String userRadioTree(Model model) {
        model.addAttribute("currentUser",getCurrentUser());

        return prefix + "/all_user_radio_tree";
    }

    /**
     * 根据组织架构节点，查询当前节点下的用户及下级组织架构节点
     * @param orgId
     * @return
     */
    @PostMapping("findUserAndOrgTree")
    @ResponseBody
    public List<Ztree> findUserTree(@RequestParam(value = "orgId", required = false) String orgId) {
        if (StringUtils.isBlank(orgId)) {
            return sysOrganizationService.getAllGroupTree();
        }

        List<Ztree> treeList = new ArrayList<>();
        SysOrganization currentOrg = sysOrganizationService.getById(orgId);
        // 查询出错的情况
        if (currentOrg == null) {
            return new ArrayList<>();
        }
        // 企业节点、部门节点下都可能有下级组织架构
        List<Ztree> orgTrees = sysOrganizationService.getChildTreeByPid(orgId);
        // 只有部门下才会有用户数据
        if ("1".equals(currentOrg.getOrgType())) {
            List<Ztree> userTrees = userService.findUserTreeByDeptId(orgId);
            treeList.addAll(userTrees);
        }
        treeList.addAll(orgTrees);

        return treeList;
    }

    /**
     * 校验用户显示顺序，同一部门下不允许重复的顺序
     * @param user
     * @return
     */
    private boolean validUserSort(User user) {

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(User::getDeptId, user.getDeptId())
                .eq(User::getSort, user.getSort())
                .ne(StringUtils.isNotBlank(user.getId()), User::getId, user.getId());
        int count = userService.count(queryWrapper);
        if (count > 0) {
            return false;
        }
        return true;
    }
}

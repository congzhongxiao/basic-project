package com.basic.controller.system.organization;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.basic.common.annotation.Log;
import com.basic.common.domain.Ztree;
import com.basic.common.enums.BusinessType;
import com.basic.entity.User;
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

import com.basic.entity.SysOrganization;
import com.basic.service.SysOrganizationService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 组织架构控制器
 *
 * @author: lee
 * @time: 2021-03-17 15:22:02
 */

@Controller
@RequestMapping("/organization")
public class SysOrganizationController extends BasicController {
    String prefix = "system/organization";
    @Autowired
    SysOrganizationService sysOrganizationService;
    @Autowired
    UserDutyService userDutyService;
    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/sys_organization_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestParam(name = "pid", defaultValue = "0", required = false) String pid) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if (StringUtils.isNotBlank(pid)) {
            queryWrapper.eq("pid", pid);
        } else {
            queryWrapper.eq("pid", "0");
        }
        queryWrapper.orderByAsc("sort");
        queryWrapper.orderByDesc("id");
        return Result.success(sysOrganizationService.list(queryWrapper));
    }

    //添加根页面跳转
    @GetMapping("addRoot")
    public String addRoot() {
        return prefix + "/sys_organization_root_add";
    }

    //添加页面数据提交
    @RequiresPermissions("fun_organization_top_add")
    @PostMapping("addRoot")
    @ResponseBody
    public Result doAddRoot(@Validated SysOrganization organization) {
        try {
            SysOrganization org = sysOrganizationService.findByCode(organization.getCode());
            if(org != null){
                return Result.fail("组织编码不允许重复!");
            }
            organization.setPid("0");
            sysOrganizationService.addOrganization(organization);
            return Result.success(organization);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加根页面跳转
    @GetMapping("addChild/{pid}")
    public String addChild(@PathVariable String pid, Model model) {
        SysOrganization parent = sysOrganizationService.getById(pid);
        if (parent == null) {
            return redirectNoPage();
        }
        model.addAttribute("parent", parent);
        return prefix + "/sys_organization_child_add";
    }

    //添加页面数据提交
    @PostMapping("addChild")
    @ResponseBody
    public Result doAdd(@Validated SysOrganization organization) {
        try {
            SysOrganization org = sysOrganizationService.findByCode(organization.getCode());
            if(org != null){
                return Result.fail("组织编码不允许重复!");
            }
            sysOrganizationService.addOrganization(organization);
            return Result.success(organization);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        SysOrganization sysOrganization = sysOrganizationService.getById(id);
        if (sysOrganization != null) {
            SysOrganization parent = sysOrganizationService.getById(sysOrganization.getPid());
            model.addAttribute("parent", parent);
            model.addAttribute("sysOrganization", sysOrganization);
        } else {
            return redirectNoPage();
        }
        return prefix + "/sys_organization_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadSysOrganization") SysOrganization sysOrganization) {
        try {
            sysOrganizationService.updateOrganization(sysOrganization);
            return Result.success(sysOrganization);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //删除
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "id") String id) {
        try {
            SysOrganization organization = sysOrganizationService.getById(id);
            if (organization != null) {
                int result = sysOrganizationService.deleteById(id);
                if (result == -1) {
                    return Result.fail("存在下级组织，无法删除");
                }
                if (result == -2){
                    return Result.fail("该组织下存在用户,请清空用户信息再进行删除！");
                }
                return Result.success(organization);
            } else {
                return Result.fail("数据不存在或已被删除，请刷新后重试");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }
    //选择部门页面
    @GetMapping("selectOrganizationTree/{id}/{orgId}")
    public String selectOrganizationTree(@PathVariable("id") String id,@PathVariable("orgId") String orgId, Model model){
        SysOrganization parentOrg = sysOrganizationService.getById(id);
        SysOrganization childOrg = sysOrganizationService.getById(orgId);
        model.addAttribute("organization",parentOrg);
        model.addAttribute("childOrg",childOrg);
        return prefix + "/organization_tree";
    }
    //ztree加载数据
    @GetMapping("findAllTree")
    @ResponseBody
    public List<Ztree> findTreeList() {
        User user = getCurrentUser();
        return sysOrganizationService.getAllTree(user);
    }


    /**
     * ztree加载数据， 只查询本公司企业树，不包含子企业
     * @return
     */
    @GetMapping("findCurrentCompanyTree")
    @ResponseBody
    public List<Ztree> findCurrentCompanyTree() {
        User user = getCurrentUser();
        return sysOrganizationService.getCurrentCompanyTree(user);
    }

    //根据组织的主键ID查询出其类型
    @GetMapping("getOrganizationTypeById")
    @ResponseBody
    public Map<String,Object> getOrganizationTypeById(){
        String organizationId = getRequest().getParameter("organizationId");
        Map<String,Object> map=new HashMap<>();
        map.put("type","1");
        if(StringUtils.isNotBlank(organizationId)){
            String type=sysOrganizationService.getById(organizationId).getOrgType();
            map.put("type",type);
        }
        return map;
    }
    //预加载对象数据
    @ModelAttribute("preloadSysOrganization")
    public SysOrganization preloadSysOrganization(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return sysOrganizationService.getById(id.trim());
        }
        return null;
    }

    /**
     * 根据公司id查询部门id
     ** @return
     */
    @GetMapping("getDepartmentListByCompany/{companyId}")
    @ResponseBody
    public Result getDeptListByCompany(@PathVariable("companyId") String companyId) {
        try{
            List<SysOrganization>deptList = sysOrganizationService.findDirectChildrenDeptByCompanyId(companyId);
            return Result.success(deptList);
        }catch(Exception e){
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    /**
     * 根据国资委用户，查询所属组织下的所有组织架构以及企业， 以及部门
     * @return
     */
    @GetMapping("findUserControlTree")
    @ResponseBody
    public List<Ztree> findUserControlTree() {
        User currentUser = getCurrentUser();
        return sysOrganizationService.getUserControlTreeByUser(currentUser);
    }


    /**
     * 根据国资委用户，查询所属组织下的所有组织架构以及企业， 排除掉部门
     * @return
     */
    @GetMapping("findCompanyTree")
    @ResponseBody
    public List<Ztree> findCompanyTree() {
        User currentUser = getCurrentUser();
        return sysOrganizationService.getCompanyTreeByUser(currentUser);
    }

    /**
     * 根据用户，返回相应的ztree，包含公司及部门
     * @return
     */
    @GetMapping("findOrganizationTree")
    @ResponseBody
    public List<Ztree> findOrganizationTree() {
        User currentUser = getCurrentUser();
        return sysOrganizationService.getOrganizationTreeByUser(currentUser);
    }

    /**
     * 查询整个集团的树
     * @return
     */
    @PostMapping("findAllGroupTree")
    @ResponseBody
    public List<Ztree> findAllGroupTree() {
        return sysOrganizationService.getAllGroupTree();
    }
}
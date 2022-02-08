package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.constants.UserConstant;
import com.basic.common.domain.Result;
import com.basic.common.domain.Ztree;
import com.basic.common.utils.EncryptionUtil;
import com.basic.common.utils.PageUtil;
import com.basic.common.utils.StringUtils;
import com.basic.entity.SysOrganization;
import com.basic.entity.User;
import com.basic.mapper.SysOrganizationMapper;
import com.basic.mapper.UserMapper;
import com.basic.service.SysOrganizationService;
import com.basic.service.UserDutyService;
import com.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    UserMapper userMapper;
    @Autowired
    UserService userService;
    @Autowired
    SysOrganizationMapper organizationMapper;
    @Autowired
    SysOrganizationService organizationService;
    @Autowired
    UserDutyService userDutyService;
    @Autowired
    SysOrganizationService sysOrganizationService;
    /**
     * 根据查询条件获取管理员列表信息
     * @param queryParam
     * @return
     */
    public Result getPageInfo(Map<String, Object> queryParam) {
        QueryWrapper<User> queryWrapper = new QueryWrapper();
        if (queryParam.get("username") != null) {
            queryWrapper.like("username", queryParam.get("username"));
        }
        if (queryParam.get("nickname") != null) {
            queryWrapper.like("nickname", queryParam.get("nickname"));
        }
        if (queryParam.get("email") != null) {
            queryWrapper.like("email", queryParam.get("email"));
        }
        if (queryParam.get("mobile") != null) {
            queryWrapper.like("mobile", queryParam.get("mobile"));
        }
        if (queryParam.get("dutyId") != null) {
            queryWrapper.like("duty_id", queryParam.get("dutyId"));
        }
        queryWrapper.orderByDesc("create_time");

        Page page = new PageUtil<User>(queryParam).getPage();
        return Result.success(PageUtil.initPage(baseMapper.selectPage(page, queryWrapper)));
    }

    /**
     * 根据用户名查询信息，只取一条
     *
     * @param username
     * @return
     */
    public User getByUsername(String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(User::getUsername, username)
                .orderByDesc(User::getId);
        queryWrapper.last(" limit 1");
        return baseMapper.selectOne(queryWrapper);
    }

    /**
     * 查询用户分页
     * @param queryParam
     * @return
     */
    @Override
    public IPage<User> getUserPageInfo(Map<String, Object> queryParam ,User user) {
        Page<User> tempPage = new PageUtil<User>(queryParam).getPage();
        if (StringUtils.isNotBlank((String) queryParam.get("selectOrgId"))) {

            String orgId = queryParam.get("selectOrgId").toString();
            SysOrganization org = sysOrganizationService.getById(orgId);

            if("0".equals(org.getOrgType())){
                queryParam.put("companyId", orgId);
            }
            else if("1".equals(org.getOrgType())){
                queryParam.put("deptId", orgId);
            }
        }
        List<String> companys = userDutyService.findAccessibleCompanyIdForUserControl(user);
        if(companys!=null && companys.size()>0){
            queryParam.put("companys", companys);
        }
        queryParam.put("currentUser", user.getUsername());
        Page<User> page = tempPage.setRecords(this.userMapper.getUserPageInfo(tempPage,queryParam));
        return page;
    }

    /**
     *
     * 根据变更的组织架构的ID变更其下所有用户的companyId
     * @param deptId
     * @return
     */
    @Override
    public boolean updateUserCompany(String deptId) {
        SysOrganization dept = organizationMapper.selectById(deptId);
        if(dept == null) {
            return false;
        }else{
            if("0".equals(dept.getOrgType())){//如果挪动的是公司则不需要变更
                return true;
            }else{//如果是部门-获取旗下所有子部门
                List<SysOrganization> deptList =  organizationMapper.getChildrenByDepartmentId(dept.getId());
                if(StringUtils.isNotEmpty(deptList)){
                    List<String> deptIds = new ArrayList<>();
                    for(SysOrganization org : deptList){
                        deptIds.add(org.getId());
                    }
                    List<User> userList = userMapper.selectList(new QueryWrapper<User>().in("dept_id",deptIds));
                    SysOrganization deptUpdate = organizationService.getUpperCompany(dept.getId());
                    if(StringUtils.isNotEmpty(userList)){
                        for(User user : userList){
                            user.setCompanyId(deptUpdate.getId());
                            user.setCompanyName(deptUpdate.getName());
                            user.setCompanyCode(deptUpdate.getCode());
                        }
                        userService.updateBatchById(userList);
                    }

                }
            }
            return true;
        }
    }

    /**
     * 根据用户ID集合获取用户集合
     *
     * @param ids
     * @return
     */
    @Override
    public List<User> getUserByIds(List<String> ids) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().in(User::getId, ids);
        return baseMapper.selectList(queryWrapper);
    }

    /**
     * 根据组织架构查询用户树，包含兼职人员信息
     *
     * @param orgId
     * @return
     */
    @Override
    public List<Ztree> findUserTreeByDeptId(String orgId) {
        // 查询当前节点下的正式员工信息
        Map<String, Object> queryParams = new HashMap<>();
        queryParams.put("deptId", orgId);
        queryParams.put("isMain", 0);
        List<User> mainUserList = this.baseMapper.getUserWithDutyInfo(queryParams);
        List<Ztree> mainUserTree = installTree(mainUserList, orgId, false);

        // 查询兼职员工的信息
        queryParams.put("isMain", 1);
        List<User> partJobUserList = this.baseMapper.getUserWithDutyInfo(queryParams);
        List<Ztree> partJobUserTree = installTree(partJobUserList, orgId, true);

        List<Ztree> treeList = new ArrayList<>();
        treeList.addAll(mainUserTree);
        treeList.addAll(partJobUserTree);

        return treeList;
    }

    /**
     * 生成用户树
     * @param userList
     * @param ifPartJob 是否是兼职信息，如果是，则后面加上“（兼）”标识
     * @return
     */
    private List<Ztree> installTree(List<User> userList, String orgId, boolean ifPartJob) {
        List<Ztree> treeList = new ArrayList<Ztree>();
        if (userList != null && userList.size() > 0) {
            Map<String, Object> extData;
            for (User entity : userList) {
                Ztree tree = new Ztree();
                // 为避免兼职导致数据ID重复，树节点的ID改为“用户ID-用户部门ID”的形式
                tree.setId(entity.getId() + "-" + entity.getDeptId());
                tree.setPId(orgId);
                if (ifPartJob) {
                    tree.setTitle(entity.getNickname() + "（兼）");
                    tree.setName(entity.getNickname() + "（兼）");
                } else {
                    tree.setTitle(entity.getNickname());
                    tree.setName(entity.getNickname());
                }

                extData = new HashMap<>();
                extData.put("userId", entity.getId());
                extData.put("nickname", entity.getNickname());
                extData.put("companyId",entity.getCompanyId());
                extData.put("companyName", entity.getCompanyName());
                extData.put("companyCode", entity.getCompanyCode());
                extData.put("deptId", entity.getDeptId());
                extData.put("deptCode", entity.getDeptCode());
                extData.put("deptName", entity.getDeptName());
                extData.put("dutyId", entity.getDutyId());
                extData.put("dutyName", entity.getDutyName());
                tree.setExtData(extData);

                treeList.add(tree);
            }
        }
        return treeList;
    }

    /**
     * 用户账号、密码格式校验校验
     *
     * @return
     */
    public Result validateUserNameAndPassword(String username, String password) {
        if (StringUtils.isBlank(username)) {
            return Result.fail("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
            return Result.fail("密码不能为空");
        }
        if (username.length() > UserConstant.USER_NAME_LENGTH_MAX || username.length() < UserConstant.USER_NAME_LENGTH_MIN) {
            return Result.fail("用户账号需要" + UserConstant.USER_NAME_LENGTH_MIN + "-" + UserConstant.USER_NAME_LENGTH_MAX + "位");
        }
        if (password.length() > UserConstant.USER_PASSWORD_LENGTH_MAX || password.length() < UserConstant.USER_PASSWORD_LENGTH_MIN) {
            return Result.fail("密码需要" + UserConstant.USER_PASSWORD_LENGTH_MIN + "-" + UserConstant.USER_PASSWORD_LENGTH_MAX + "位");
        }

        if (Pattern.matches(UserConstant.USER_PASSWORD_RULE, password)) {
            return Result.success();
        } else {
            return Result.fail("密码必须由大写字母、小写字母和数字组成，且位数需要" + UserConstant.USER_PASSWORD_LENGTH_MIN + "-" + UserConstant.USER_PASSWORD_LENGTH_MAX + "位");
        }
    }

    /**
     * 根据职务id返回主要职务匹配的用户
     * @param dutyId
     * @return
     */
    public List<User> findListByDutyId(String dutyId){
        return this.baseMapper.selectList(new QueryWrapper<User>().eq("duty_id",dutyId ));
    }
}
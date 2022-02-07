package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.utils.StringUtils;
import com.basic.entity.SysDuty;
import com.basic.entity.SysOrganization;
import com.basic.entity.User;
import com.basic.mapper.SysOrganizationMapper;
import com.basic.service.SysDutyService;
import com.basic.service.SysOrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.UserDuty;
import com.basic.service.UserDutyService;
import com.basic.mapper.UserDutyMapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
*用户职务表ServiceImpl
*@author: djy
*@time: 2022-01-21 14:26:49
*/
@Service
public class UserDutyServiceImpl extends ServiceImpl<UserDutyMapper, UserDuty> implements UserDutyService {

    @Autowired
    SysOrganizationMapper sysOrganizationMapper;
    @Autowired
    SysOrganizationService sysOrganizationService;
    @Autowired
    SysDutyService sysDutyService;
    @Autowired
    UserDutyMapper userDutyMapper;

    /**
     * 根据筛筛选条件返回职务列表
     * @param queryParam
     * @return
     */
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<UserDuty> page = new PageUtil<UserDuty>(queryParam).getPage();
        QueryWrapper<UserDuty> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        if (queryParam.get("companyId") != null) {
            queryWrapper.like("company_id", queryParam.get("companyId"));
        }
        if (queryParam.get("deptId") != null) {
            queryWrapper.like("dept_id", queryParam.get("deptId"));
        }
        if (queryParam.get("dutyId") != null) {
            queryWrapper.like("duty_id", queryParam.get("dutyId"));
        }
        queryWrapper.eq("user_id", queryParam.get("user_id"));

        //根据条件确定返回的职务类型 1为兼职 0 为主要职务
        queryWrapper.eq("is_main", queryParam.get("is_main"));
        IPage mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

    /**
     * 添加新用户时创建主要职务
     *@param user
     *@return  Result
     */
    public String insertNewUserDuty(User user) throws Exception{
        try{
            UserDuty userDuty= new UserDuty();

            //填充用户所属公司，部门，主要职务id
            userDuty.setUserId(user.getId());
            userDuty.setCompanyId(user.getCompanyId());
            userDuty.setDeptId(user.getDeptId());
            userDuty.setDutyId(user.getDutyId());

            //获取到公司部门信息
            SysOrganization company = sysOrganizationService.getById(user.getCompanyId());
            userDuty.setCompanyCode(company.getCode());
            SysOrganization dept = sysOrganizationService.getById(user.getDeptId());
            userDuty.setDeptCode(dept.getCode());

            userDuty.setCompanyName(user.getCompanyName());
            userDuty.setDeptName(user.getDeptName());
            userDuty.setDutyName(user.getDutyName());

            //根据主要职务id填充主要职务名称
            SysDuty duty = sysDutyService.getById(user.getDutyId());
            userDuty.setCode(duty.getCode());
            userDuty.setIsMain(0);
            userDuty.setCreateId(user.getId());
            userDuty.setCreateName(user.getNickname());
            userDuty.setCreateTime(new Date());
            this.save(userDuty);
            return userDuty.getId();
        }
        catch(Exception e){
            throw new Exception(e);
        }
    }

    /**
     * 更新主要职务
     *@return  Result
     * @param user
     */
    public boolean updateMainDuty(User user)throws Exception{
        try{
            //验证主要职务不为空
            UserDuty userDuty = findMainDuty(user);
            if(userDuty == null){
                return false;
            }
            //判断修改后的信息是否与数据库中的其他用户职务
            if(!ifUpdateUserDutyValid(userDuty)){
                return false;
            }
            //根据更新后的用户信息，填充公司，职务，部门的id及名称
            userDuty.setCompanyId(user.getCompanyId());
            userDuty.setDeptId(user.getDeptId());
            userDuty.setDutyId(user.getDutyId());
            userDuty.setCompanyName(user.getCompanyName());
            userDuty.setDeptName(user.getDeptName());
            userDuty.setDutyName(user.getDutyName());
            //获取到公司部门信息
            SysOrganization company = sysOrganizationService.getById(user.getCompanyId());
            userDuty.setCompanyCode(company.getCode());
            SysOrganization dept = sysOrganizationService.getById(user.getDeptId());
            userDuty.setDeptCode(dept.getCode());
            //根据主要职务id填充主要职务编码和更新时间
            SysDuty duty = sysDutyService.getById(user.getDutyId());
            userDuty.setCode(duty.getCode());
            userDuty.setUpdateId(user.getId());
            userDuty.setUpdateName(user.getNickname());
            userDuty.setUpdateTime(new Date());
            this.baseMapper.updateById(userDuty);
            return true;
        }
        catch(Exception e){
            throw new Exception(e);
        }

    }

    /**
     * 根据用户信息查询用户的主要职务
     * @param user
     * @return
     */
    @Override
    public UserDuty findMainDuty(User user) {
        try{
            //根据用户的用户id，公司id， 部门id 返回角色职务类型为 0 - 主要职务的用户用户职务
            QueryWrapper<UserDuty> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda()
                    .eq(UserDuty::getUserId,user.getId())
                    .eq(UserDuty::getIsMain,0)
                    .orderByDesc(UserDuty::getId);
            queryWrapper.last(" limit 1");
            return this.baseMapper.selectOne(queryWrapper);
        }catch(Exception e){
            return null;
        }
    }

    /**
     * 组织架构发生变动时更新用户职务中部门的上级公司
     *@param departmentId
     *@return  Result
     */
    public void updateUserDutyCompany(String departmentId) throws Exception{
        try{
            //根据id获取组织架构信息
            SysOrganization department = sysOrganizationMapper.selectById(departmentId);

            //若组织架构的类型为 0 - 公司， 则不需要进行后续操作， 若为1 - 部门则进行后续操作
            if("0".equals(department.getOrgType())){
                return;
            }
            //获取当前部门的上级公司
            SysOrganization company = sysOrganizationService.getUpperCompany(departmentId);

            if(company==null){
                return;
            }
            //获取当前部门的子级部门
            List<SysOrganization> deptList = sysOrganizationMapper.getChildrenByDepartmentId(departmentId);

            if(deptList==null||deptList.size()==0){
                return;
            }

            for(SysOrganization sysOrganization: deptList){

                //获取所所属于当前部门的用户职务
                List<UserDuty> userDutyList = this.list(new QueryWrapper<UserDuty>()
                        .eq("dept_id", sysOrganization.getId()));

                if(userDutyList != null && userDutyList.size() > 0){
                    for(UserDuty userDuty:userDutyList){
                        //更新集合中的用户职务公司信息
                        userDuty.setCompanyId(company.getId());
                        userDuty.setCompanyName(company.getName());
                        userDuty.setCompanyCode(company.getCode());
                    }
                    this.updateBatchById(userDutyList);
                }
            }
        }catch(Exception e){
            throw new Exception(e);
        }
    }

    /**
     * 根据用户返回用户的主要职务及兼职
     *@param user
     *@return  list
     */
    public List<UserDuty> findAllUserDutyByUser(User user){
        return list(new QueryWrapper<UserDuty>().eq("user_id",user.getId()));
    }


    /**
     * 根据用户返回用户权限内可以管理的公司
     *@param user
     *@return  list
     */
    public List<SysOrganization> findAllAccessibleCompanyByUser(User user){

        //查找当前用户所有的用户职务 - 主要职务及兼职
        List<UserDuty> userDutyList = findAllUserDutyByUser(user);
        List<SysOrganization> result = new ArrayList<>();

        //若无职务则不进行操作
        if(userDutyList==null||userDutyList.size()<1){
            return null;
        }

        try{
            //遍历职务列表，根据职务的数据权限，将相应的公司组织架构添加进结果list
            for(UserDuty userDuty:userDutyList){

                //根据职务id 返回数据权限
                int dutyLimit = sysDutyService.findDataPermissionById(userDuty.getDutyId());

                //权限为5时数据权限为可管理所有数据， 直接将返回所有公司
                if(dutyLimit==5){
                    List<SysOrganization> companyList = sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                            .eq("org_type", "0"));

                    return companyList;
                }

                //权限为4时数据权限为可管理所属公司及下属公司
                if(dutyLimit==4){
                    //获取当前用户职务所属公司及所有下级公司
                    List<SysOrganization>childrenCompanyList =
                            sysOrganizationService.findChildrenCompanyByCompanyId(userDuty.getCompanyId());
                    for(SysOrganization company: childrenCompanyList){
                        if(!result.contains(company)){
                            result.add(company);
                        }
                    }
                }

                //权限为3时数据权限为可管理例所属公司
                if(dutyLimit==3){
                    //获取当前用户职务的所属公司
                    SysOrganization company = sysOrganizationService.getById(userDuty.getCompanyId());
                    if(!result.contains(company)){
                        result.add(company);
                    }
                }
                //权限为 1 / 2 时无法时对公司数据权限无影响
            }
            return result;
        }catch(Exception e){
            return null;
        }
    }

    /**
     * 根据用户返回用户权限内可以管理的公司Id
     *@param user
     *@return  list
     */
    public List<String> findAllAccessibleCompanyIdByUser (User user){

        //获取用户权限内所有可管理的公司组织架构
        List<SysOrganization> companyList = findAllAccessibleCompanyByUser(user);
        List<String> companyIds = new ArrayList<>();

        if(companyList!=null && companyList.size()>0){
            //遍历集合，将公司id存入结果
            for(SysOrganization company : companyList){
                companyIds.add(company.getId());
            }
        }
        return companyIds;
    }

    /**
     * 根据用户返回用户权限内可以管理的公司, 特殊判定，用于用户管理
     *@param user
     *@return  list
     */
    public List<SysOrganization> findAccessibleCompanyWithMainCompany(User user){
        //查找当前用户所有的职务
        List<UserDuty> userDutyList = findAllUserDutyByUser(user);
        List<SysOrganization> result = new ArrayList<>();
        if(userDutyList==null||userDutyList.size()<1){
            return null;
        }

        try{
            //遍历职务列表，根据职务的数据权限，将相应的公司添加进结果list
            for(UserDuty userDuty:userDutyList){
                //根据职务id 返回数据权限
                int dutyLimit = sysDutyService.findDataPermissionById(userDuty.getDutyId());

                //权限为5时数据权限为可管理所有公司
                if(dutyLimit==5){
                    List<SysOrganization> companyList = sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                            .eq("org_type", "0"));

                    return companyList;
                }
                //权限为4时数据权限为可管理所属公司及下属公司
                if(dutyLimit==4){

                    //根据当前用户职务的所属公司id，返回该公司的所有子级公司
                    List<SysOrganization>childrenCompanyList =
                            sysOrganizationService.findChildrenCompanyByCompanyId(userDuty.getCompanyId());

                    //将不重复的公司加入集合
                    for(SysOrganization company: childrenCompanyList){
                        if(!result.contains(company)){
                            result.add(company);
                        }
                    }
                }

                //权限低于4时，均可管理自身所属公司数据
                if(dutyLimit<4){

                    //获取当前职务的所属公司并将公司组织架构加入集合
                    SysOrganization company = sysOrganizationService.getById(userDuty.getCompanyId());
                    if(!result.contains(company)){
                        result.add(company);
                    }
                }
            }
            return result;
        }catch (Exception e){
            return null;
        }
    }

    /**
     * 根据用户返回用户权限内可以管理的部门
     *@param user
     *@return  list
     */
    public List<SysOrganization> findAllAccessibleDeptByUser(User user){

        //查找当前用户所有的职务
        List<UserDuty> userDutyList = findAllUserDutyByUser(user);
        List<SysOrganization> result = new ArrayList<>();

        //若职务 为空则不进行操作
        if(userDutyList==null||userDutyList.size()<1){
            return null;
        }

        try{
            //遍历职务列表，根据职务的数据权限，将相应的公司添加进结果list
            for(UserDuty userDuty:userDutyList){

                //根据职务id 返回数据权限
                int dutyLimit = sysDutyService.findDataPermissionById(userDuty.getDutyId());

                //权限为5时数据权限为可管理所有公司的所有部门
                if(dutyLimit==5){
                    List<SysOrganization> deptList = sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                            .eq("org_type", "1"));

                    return deptList;
                }

                //权限为4时数据权限为可管理所属公司及下属公司， 添加当前公司和所有下属公司的部门
                if(dutyLimit==4){
                    List<SysOrganization>childrenDeptList =
                            sysOrganizationService.findAllChildrenDeptByCompanyId(userDuty.getCompanyId());
                    for(SysOrganization dept: childrenDeptList){
                        if(!result.contains(dept)){
                            result.add(dept);
                        }
                    }
                }

                //权限为3时数据权限为可管理所属公司, 添加所有属于该公司的部门
                if(dutyLimit==3){
                    List<SysOrganization>childrenDeptList =
                            sysOrganizationService.findDirectChildrenDeptByCompanyId(userDuty.getCompanyId());
                    for(SysOrganization dept: childrenDeptList){
                        if(!result.contains(dept)){
                            result.add(dept);
                        }
                    }
                }

                //权限为2时数据权限为可管理例所属部门以及子部门, 添加属于此用户职务的部门及其子部门
                if(dutyLimit==2){
                    List<SysOrganization>childrenDeptList =
                            sysOrganizationService.findChildrenDeptByDeptId(userDuty.getDeptId());
                    for(SysOrganization dept: childrenDeptList){
                        if(!result.contains(dept)){
                            result.add(dept);
                        }
                    }
                }

                //权限为1时数据权限为可管理例所属部门, 添加属于此用户职务的部门
                if(dutyLimit == 1){
                    SysOrganization dept = sysOrganizationService.getById(userDuty.getDeptId());
                    if(!result.contains(dept)){
                        result.add(dept);
                    }
                }
                //权限为0 对公司及部门数据权限无影响
            }

            return result;
        }catch(Exception e){
            return null;
        }

    }

    /**
     * 根据用户返回用户权限内可以管理的部门Id
     *@param user
     *@return  list
     */
    public List<String> findAllAccessibleDeptIdByUser (User user){
        List<SysOrganization> deptList = findAllAccessibleDeptByUser(user);
        List<String> deptIds = new ArrayList<>();
        if(deptList!=null && deptList.size()>0){
            for(SysOrganization dept : deptList){
                deptIds.add(dept.getId());
            }
        }
        return deptIds;
    }

    /**
     * 根据用户的所属公司,返回所属公司内，所有可管理的部门
     *@param user
     *@return  list
     */
    public List<SysOrganization> findAccessibleDeptByUserCompany(User user){

        //获取用户的id
        String userId = user.getId();
        //获取用户的所属公司
        String companyId = user.getCompanyId();

        //查找当前用户在所属公司内的所有的职务
        List<UserDuty> userDutyList = list(new QueryWrapper<UserDuty>().lambda()
                .eq(UserDuty::getUserId, userId)
                .eq(UserDuty::getCompanyId , companyId));

        List<SysOrganization> result = new ArrayList<>();
        if(userDutyList==null||userDutyList.size()<1){
            return null;
        }

        try{
            //遍历职务列表，根据职务的数据权限，将相应的公司添加进结果list
            for(UserDuty userDuty:userDutyList){

                //根据职务id 返回数据权限
                int dutyLimit = sysDutyService.findDataPermissionById(userDuty.getDutyId());

                //权限为5, 4 ,3 时，用户可管理公司内的所有部门所属数据
                if(dutyLimit==5||dutyLimit==4||dutyLimit==3){
                    List<SysOrganization> deptList = sysOrganizationService.list(new QueryWrapper<SysOrganization>()
                            .eq("org_type", "1"));

                    return deptList;
                }

                //权限为2时数据权限为可管理例所属部门以及子部门
                if(dutyLimit==2){
                    List<SysOrganization>childrenDeptList =
                            sysOrganizationService.findChildrenDeptByDeptId(userDuty.getDeptId());
                    for(SysOrganization dept: childrenDeptList){
                        if(!result.contains(dept)){
                            result.add(dept);
                        }
                    }
                }

                //权限为1时数据权限为可管理例所属部门
                if(dutyLimit == 1){
                    SysOrganization dept = sysOrganizationService.getById(userDuty.getDeptId());
                    if(!result.contains(dept)){
                        result.add(dept);
                    }
                }
                //权限为0 对公司及部门数据权限无影响
            }

            return result;
        }catch(Exception e){
            return null;
        }
    }

    /**
     * 根据用户的所属公司,返回所属公司内，所有可管理的部门id
     *@param user
     *@return  list
     */
    public List<String> findAccessibleDeptIdByUserCompany (User user){
        List<SysOrganization> deptList = findAccessibleDeptByUserCompany(user);
        List<String> deptIds = new ArrayList<>();
        if(deptList!=null && deptList.size()>0){
            for(SysOrganization dept : deptList){
                deptIds.add(dept.getId());
            }
        }
        return deptIds;
    }

    /**
     * 根据用户的所属公司,返回所属公司及下级公司id, 特殊调整用于用户管理
     *@param user
     *@return  list
     */
    public List<String> findAccessibleCompanyIdForUserControl (User user){
        List<SysOrganization> companyList = findAccessibleCompanyWithMainCompany(user);
        List<String> companyIds = new ArrayList<>();
        if(companyList != null && companyList.size()>0){
            for(SysOrganization company : companyList){
                companyIds.add(company.getId());
            }
        }
        return companyIds;
    }

    /**
     * 根据userId删除该用户所有的用户职务
     * @param userId
     * @return
     */
    public int deleteByUserId(String userId){
        QueryWrapper<UserDuty> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        return this.baseMapper.delete(queryWrapper);
    }

    /**
     * 根据职务id，返回所有关联此职务的用户职务
     * @param dutyId
     * @return
     */
    public List<UserDuty> findListByDutyId(String dutyId){
        return baseMapper.selectList(new QueryWrapper<UserDuty>().lambda().eq(UserDuty::getDutyId, dutyId));
    }

    /**
     * 验证新添加的用户职务是否重复
     * @param userDuty
     * @return
     */
    public boolean ifUserDutyValid(UserDuty userDuty){
        //验证实体类不为空
        if(userDuty==null){
            return false;
        }

        //根据实体类数据检索所有匹配的用户职务
        List<UserDuty> userDutyList = list(new QueryWrapper<UserDuty>()
                .eq("user_id", userDuty.getUserId())
                .eq("company_id", userDuty.getCompanyId())
                .eq("dept_id", userDuty.getDeptId())
                .eq("duty_id", userDuty.getDutyId()));

        //如果集合为空，则用户职务可用 不为空则不可用
        if(userDutyList==null || userDutyList.size()<1){
            return true;
        }
        else{
            return false;
        }
    }

    /**
     * 验证编辑后的用户职务是否可用
     * @return
     */
    public boolean ifUpdateUserDutyValid(UserDuty userDuty){
        //验证实体类不为空
        if(userDuty==null){
            return false;
        }

        //根据实体类数据检索所有匹配的用户职务
        List<UserDuty> userDutyList = list(new QueryWrapper<UserDuty>()
                .eq("user_id", userDuty.getUserId())
                .eq("company_id", userDuty.getCompanyId())
                .eq("dept_id", userDuty.getDeptId())
                .eq("duty_id", userDuty.getDutyId()));

        //集合小于1 时，可用
        if(userDutyList==null || userDutyList.size()<1){
            return true;
        }

        //集合大于1时不可用
        else if(userDutyList.size()>1){
            return false;
        }

        //集合等于1 且检索出的用户职责与传入的用户职责完全匹配时，可用。 反之则不可用
        else if(userDutyList.size()==1 && userDutyList.get(0).getId().equals(userDuty.getId())){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public List<SysOrganization> findAccessibleCompanyByUser(User user) {
        List<SysOrganization> companyList = findAccessibleCompanyWithMainCompany(user);
        return companyList;
    }

    /**
     * 根据部门ID获取所有用户ID
     *
     * @param deptId
     * @param isMain 是否兼职 0：主职；1：兼职； null：全部
     * @return
     */
    @Override
    public List<String> findAllUserIdByDeptId(String deptId, Integer isMain) {
        QueryWrapper<UserDuty> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UserDuty::getDeptId, deptId)
                .eq(StringUtils.isNotBlank(isMain), UserDuty::getIsMain, isMain);
        List<UserDuty> list = list(queryWrapper);
        List<String> userIds = list.stream().map(e->e.getUserId()).collect(Collectors.toList());
        return userIds;
    }

}

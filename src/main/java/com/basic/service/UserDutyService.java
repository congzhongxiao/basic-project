package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.common.domain.Result;
import com.basic.entity.SysOrganization;
import com.basic.entity.User;
import com.basic.entity.UserDuty;

import java.util.List;
import java.util.Map;

/**
*用户职务表 Service
*@author: djy
*@time: 2022-01-21 14:26:49
*/
public interface UserDutyService extends IService<UserDuty> {
    /**
     * 根据筛筛选条件返回职务列表
     * @param queryParam
     * @return
     */
    Result getPageInfo(Map<String, Object> queryParam);
    /**
     * 组织架构发生变动时更新部门的上级公司
     *@param departmentId
     *@return  Result
     */
    void updateUserDutyCompany(String departmentId) throws Exception;

    /**
     * 添加新用户时创建主要职务
     *@param user
     *@return  Result
     */
    String insertNewUserDuty(User user)throws Exception;
    /**
     * 更新主要职务
     *@return  Result
     * @param user
     */
    boolean updateMainDuty(User user) throws Exception;
    /**
     * 根据用户查询用户的主要职务
     * @param user
     * @return
     */
    UserDuty findMainDuty(User user);
    /**
     * 根据用户返回用户的主要职务及兼职
     *@param user
     *@return  list
     */
    List<UserDuty> findAllUserDutyByUser(User user);
    /**
     * 根据用户返回用户权限内可以管理的公司
     *@param user
     *@return  list
     */
    List<SysOrganization> findAllAccessibleCompanyByUser(User user);
    /**
     * 根据用户返回用户权限内可以管理的公司Id
     *@param user
     *@return  list
     */
    List<String> findAllAccessibleCompanyIdByUser (User user);
    /**
     * 根据用户返回用户权限内可以管理的部门Id
     *@param user
     *@return  list
     */
    List<String> findAllAccessibleDeptIdByUser (User user);
    /**
     * 根据用户返回用户权限内可以管理的部门
     *@param user
     *@return  list
     */
    List<SysOrganization> findAllAccessibleDeptByUser (User user);
    /**
     * 根据用户的所属公司,返回所属公司内，所有可管理的部门
     *@param user
     *@return  list
     */
    List<SysOrganization> findAccessibleDeptByUserCompany(User user);
    /**
     * 根据用户的所属公司,返回所属公司内，所有可管理的部门id
     *@param user
     *@return  list
     */
    List<String> findAccessibleDeptIdByUserCompany (User user);
    /**
     * 根据用户返回用户权限内可以管理的公司, 特殊判定，用于用户管理
     *@param user
     *@return  list
     */
    List<SysOrganization> findAccessibleCompanyWithMainCompany(User user);
    /**
     * 根据用户返回用户权限内可以管理的公司Id, 特殊判定，用于用户管理
     *@param user
     *@return  list
     */
    List<String> findAccessibleCompanyIdForUserControl(User user);
    /**
     * 根据职务id，返回所有关联此职务的用户职务
     * @param dutyId
     * @return
     */
    List<UserDuty> findListByDutyId(String dutyId);
    /**
     * 根据userId删除该用户所有的用户职务
     * @param userId
     * @return
     */
    int deleteByUserId(String userId);
    /**
     * 验证新添加的用户职务是否重复
     * @param userDuty
     * @return
     */
    boolean ifUserDutyValid(UserDuty userDuty);
    /**
     * 验证编辑后的用户职务是否可用
     * @return
     */
    boolean ifUpdateUserDutyValid(UserDuty userDuty);
    //根据用户的所属公司,返回所属公司及下级公司
    List<SysOrganization> findAccessibleCompanyByUser(User user);

    /**
     * 根据部门ID获取所有用户ID，包括兼职、非兼职
     * @param deptId
     * @return
     */
    List<String> findAllUserIdByDeptId(String deptId, Integer isMain);
}
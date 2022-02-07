package com.basic.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.common.domain.Result;
import com.basic.common.domain.Ztree;
import com.basic.entity.User;

import java.util.List;
import java.util.Map;

/**
 * @author lee
 * @since 2020-03-10
 */
public interface UserService extends IService<User> {
    Result getPageInfo(Map<String, Object> queryParam);
    User getByUsername(String username);

    /**
     * 查询用户分页
     * @param queryParam
     * @return
     */
    IPage<User> getUserPageInfo(Map<String, Object> queryParam, User user);

    /**
     * 根据变更的组织架构的ID变更其下所有用户的companyId
     * @param deptId
     */
    boolean updateUserCompany(String deptId);

    /**
     * 根据用户ID集合获取用户集合
     * @param ids
     * @return
     */
    List<User> getUserByIds(List<String> ids);

    /**
     * 根据部门架构查询用户树，包含兼职人员信息
     * @param orgId
     * @return
     */
    List<Ztree> findUserTreeByDeptId(String orgId);

    Result validateUserNameAndPassword(String username, String password);

    /**
     * 根据职务id返回主要职务匹配的用户
     * @param dutyId
     * @return
     */
    List<User> findListByDutyId(String dutyId);
}

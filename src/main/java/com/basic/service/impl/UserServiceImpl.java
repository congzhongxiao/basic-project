package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.constants.UserConstant;
import com.basic.common.domain.Result;
import com.basic.common.utils.EncryptionUtil;
import com.basic.common.utils.PageUtil;
import com.basic.common.utils.StringUtils;
import com.basic.entity.User;
import com.basic.entity.UserRole;
import com.basic.mapper.UserMapper;
import com.basic.service.RoleService;
import com.basic.service.UserRoleService;
import com.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    RoleService roleService;
    @Autowired
    UserRoleService userRoleService;

    @Transactional(rollbackFor = Exception.class)
    public User createUser(User user, List<String> roleIds) {
        user.setSalt(EncryptionUtil.getRandomString(10));
        user.setPassword(EncryptionUtil.encryption(user.getPassword(), user.getSalt()));
        user.setPasswordTime(new Date());
        user.setPasswordStatus(0);
        baseMapper.insert(user);
        if (roleIds != null && roleIds.size() > 0) {
            List<UserRole> userRoleList = new ArrayList<>();
            for (String roleId : roleIds) {
                if (roleService.getById(roleId) != null) {
                    UserRole userRole = new UserRole();
                    userRole.setUserId(user.getId());
                    userRole.setRoleId(roleId);
                    userRoleList.add(userRole);
                }
            }
            if (userRoleList.size() > 0) {
                userRoleService.saveBatch(userRoleList);
            }
        }
        return user;
    }


    /**
     * 根据查询条件获取管理员列表信息
     *
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
        return baseMapper.selectOne(new QueryWrapper<User>().eq("username", username));
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
            return Result.fail("用户帐号需要" + UserConstant.USER_NAME_LENGTH_MIN + "-" + UserConstant.USER_NAME_LENGTH_MAX + "位");
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

}
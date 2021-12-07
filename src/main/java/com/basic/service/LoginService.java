package com.basic.service;

import com.basic.common.constants.UserConstant;
import com.basic.common.exception.user.*;
import com.basic.common.manager.AsyncManager;
import com.basic.common.manager.factory.AsyncFactory;
import com.basic.common.utils.*;
import com.basic.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Base64Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component
public class LoginService {
    @Value("#{ @environment['csrf.enabled'] ?: false }")
    private boolean csrfEnabled;

    @Autowired
    private UserService userService;

    /**
     * 登录
     */
    public User login(String username, String pwd) {
        // 用户名或密码为空 错误
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(pwd)) {
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, 0, "用户名或密码为空"));
            throw new UserNotExistsException();
        }
        try {
            username = RSAUtil.decrypt(username, UserConstant.LOGIN_RSA_PRIVATE_KEY);
            pwd = RSAUtil.decrypt(pwd, UserConstant.LOGIN_RSA_PRIVATE_KEY);
        } catch (Exception e) {
//            e.printStackTrace();
        }
        // 查询用户信息
        User user = userService.getByUsername(username);
        if (user == null) {
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, 0, "用户不存在"));
            throw new UserPasswordNotMatchException();
        }
        if (user.getStatus() == 0) {
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, 0, "用户被禁用"));
            throw new UserBlockedException();
        }
        if (UserConstant.LOGIN_FAIL_LOCK) {//登录锁定机制开启
            if (user.getLastFailTime() != null) {//最近登录失败时间为null，跳过锁定校验，否则进行登录校验
                //计算上次登录锁定时间差
                long timeDiff = DateUtils.getDateDiff(DateUtils.getNowDate(), user.getLastFailTime());
                //时间差已超过锁定时间，开始密码校验
                if (timeDiff > UserConstant.LOGIN_FAIL_LOCK_TIME) {
                    user.setFailNum(0);
                    if (!validate(user, pwd)) {//登录失败
                        throw new UserPasswordRetryLimitCountException(user.getFailNum());
                    }
                } else {//时间差为超过锁定时间，判断锁定次数
                    if (user.getFailNum() >= UserConstant.LOGIN_FAIL_LOCK_NUM) {//连续失败次数已超过规定次数
                        AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, 0, "用户连续登录失败超过规定次数，账号临时锁定"));
                        throw new UserPasswordRetryLimitExceedException((UserConstant.LOGIN_FAIL_LOCK_TIME - timeDiff) / 1000);
                    } else {
                        if (!validate(user, pwd)) {//登录失败
                            throw new UserPasswordRetryLimitCountException(user.getFailNum());
                        }
                    }
                }
            } else {
                if (!validate(user, pwd)) {
                    throw new UserPasswordRetryLimitCountException(user.getFailNum());
                }
            }
        } else {
            if (!validate(user, pwd)) {
                throw new UserPasswordNotMatchException();
            }
        }

        user.setLastLoginTime(new Date());
        user.setLastLoginIp(ShiroUtils.getIp());
        userService.updateById(user);
        if (csrfEnabled && ShiroUtils.getSubject() != null && ShiroUtils.getSubject().getSession() != null) {
            String sessionId = (String) ShiroUtils.getSubject().getSession().getId();
            ShiroUtils.getSubject().getSession().setAttribute("sys_csrfToken:" + sessionId, Base64Util.encode(Md5Util.hash(sessionId)) + Base64Util.encode(sessionId));
        }
        AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, 1, "登录成功"));
        return user;
    }

    public boolean validate(User user, String password) {
        if (!matches(user, password)) {
            if (UserConstant.LOGIN_FAIL_LOCK) {
                user.setLastFailTime(new Date());
                user.setFailNum(user.getFailNum() + 1);
                userService.updateById(user);
            }
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(user.getUsername(), 0, "用户名密码不正确"));
            return false;
        }
        if (UserConstant.LOGIN_FAIL_LOCK) {
            user.setLastFailTime(null);
            user.setFailNum(0);
            userService.updateById(user);
        }
        return true;
    }

    public boolean matches(User user, String newPassword) {
        return user.getPassword().equals(EncryptionUtil.encryption(newPassword, user.getSalt()));
    }
}

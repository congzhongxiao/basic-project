package com.basic.service;

import com.basic.common.exception.user.UserBlockedException;
import com.basic.common.exception.user.UserDeleteException;
import com.basic.common.exception.user.UserNotExistsException;
import com.basic.common.exception.user.UserPasswordNotMatchException;
import com.basic.common.utils.EncryptionUtil;
import com.basic.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class LoginService {

    @Autowired
    private UserService userService;

    /**
     * 登录
     */
    public User login(String username, String password) {
        // 用户名或密码为空 错误
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            throw new UserNotExistsException();
        }
        // 查询用户信息
        User user = userService.getByUsername(username);
        if (user == null) {
            throw new UserNotExistsException();
        }
        if ("1".equals(user.getIsdel())) {
            throw new UserDeleteException();
        }
        if ("0".equals(user.getState())) {
            throw new UserBlockedException();
        }
        validate(user, password);
        return user;
    }

    public void validate(User user, String password) {
        if (!matches(user, password)) {
            throw new UserPasswordNotMatchException();
        }
    }

    public boolean matches(User user, String newPassword) {
        return user.getPassword().equals(EncryptionUtil.encryption(user.getUsername(), newPassword, user.getSalt()));
    }
}

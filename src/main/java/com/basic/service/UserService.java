package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.common.domain.Result;
import com.basic.entity.User;

import java.util.Map;

/**
 * @author lee
 * @since 2020-03-10
 */
public interface UserService extends IService<User> {
    Result getPageInfo(Map<String, Object> queryParam);
    User getByUsername(String username);
    Result validateUserNameAndPassword(String username, String password);
}

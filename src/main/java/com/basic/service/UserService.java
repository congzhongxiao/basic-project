package com.basic.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.basic.entity.User;

import java.util.Map;

/**
 * @author lee
 * @since 2020-03-10
 */
public interface UserService extends IService<User> {
    IPage<Map<String, Object>> getPageInfo(Map<String, Object> queryParam);
    User getByUsername(String username);
    boolean add(User user);
}

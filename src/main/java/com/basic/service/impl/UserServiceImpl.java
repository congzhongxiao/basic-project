package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.utils.EncryptionUtil;
import com.basic.common.utils.PageUtil;
import com.basic.entity.User;
import com.basic.mapper.UserMapper;
import com.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    /**
     * 根据查询条件获取管理员列表信息
     * @param queryParam
     * @return
     */
    public IPage<Map<String, Object>> getPageInfo(Map<String, Object> queryParam) {
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

        Page<User> page = new PageUtil<User>(queryParam).getPage();
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return mapIPage;
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

    public boolean add(User user) {
        try {
            user.setState(1);
            user.setIsdel(0);
            user.setSalt(EncryptionUtil.getRandomString(10));
            user.setPassword(EncryptionUtil.encryption(user.getUsername(),user.getPassword(),user.getSalt()));
            user.setCreateTime(new Date());
            this.baseMapper.insert(user);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
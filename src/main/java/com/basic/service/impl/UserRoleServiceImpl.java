package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.entity.UserRole;
import com.basic.mapper.UserRoleMapper;
import com.basic.service.UserRoleService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lee
 * @since 2020-03-10
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {
    public boolean deleteByUserId(String userId){
        try {
            baseMapper.delete(new QueryWrapper<UserRole>().eq("user_id",userId));
            return true;
        } catch (Exception e) {

        }
        return false;
    }
    public boolean deleteByRoleId(String roleId){
        try {
            baseMapper.delete(new QueryWrapper<UserRole>().eq("role_id",roleId));
            return true;
        } catch (Exception e) {

        }
        return false;
    }
}

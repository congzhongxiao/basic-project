package com.basic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.basic.entity.Role;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author lee
 * @since 2020-03-10
 */
@Component
public interface RoleMapper extends BaseMapper<Role> {
    List<Role> getRoleListByUserId(String userId);
}

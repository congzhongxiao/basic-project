package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.utils.PageUtil;
import com.basic.entity.Role;
import com.basic.mapper.RoleMapper;
import com.basic.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lee
 * @since 2020-03-10
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
    @Autowired
    RoleMapper roleMapper;

    //查询分页列表
    public IPage<Map<String, Object>> getPageInfo(Map<String,Object> queryParam) {
        Page<Role> page = new PageUtil<Role>(queryParam).getPage();
        IPage<Map<String, Object>> mapIPage = roleMapper.selectMapsPage(page, new QueryWrapper<>());
        return mapIPage;
    }

    public List<Role> getRoleListByUserId(String userId) {
        return this.roleMapper.getRoleListByUserId(userId);
    }

    public List<Role> getAllRoles(){
        return this.roleMapper.selectList(new QueryWrapper<>());
    }
}

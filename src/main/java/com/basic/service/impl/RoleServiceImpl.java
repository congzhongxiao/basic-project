package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;
import com.basic.common.utils.StringUtils;
import com.basic.entity.Role;
import com.basic.mapper.RoleMapper;
import com.basic.service.RolePermissionService;
import com.basic.service.RoleService;
import com.basic.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lee
 * @since 2020-03-10
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
    @Autowired
    UserRoleService userRoleService;
    @Autowired
    RolePermissionService rolePermissionService;

    //查询分页列表
    public Result getPageInfo(Map<String, Object> queryParam) {
        Page<Role> page = new PageUtil<Role>(queryParam).getPage();
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, new QueryWrapper<>());
        return Result.success(PageUtil.initPage(mapIPage));
    }

    public List<Role> getRoleListByUserId(String userId) {
        return this.baseMapper.getRoleListByUserId(userId);
    }

    public List<Role> getAllRoles() {
        return this.baseMapper.selectList(new QueryWrapper<>());
    }

    public boolean isCodeExist(Role role) {
        List<Role> exist = baseMapper.selectList(new QueryWrapper<Role>().eq("code", role.getCode()));
        if (exist != null && exist.size() > 0) {
            if (StringUtils.isNotBlank(role.getId())) {
                if (!(exist.size() == 1 && StringUtils.equals(exist.get(0).getId(), role.getId()))) {
                    return true;
                }
            } else {
                return true;
            }
        }
        return false;
    }

    public void deleteRole(String id) {
        userRoleService.deleteByRoleId(id);
        rolePermissionService.deleteByRoleId(id);
        baseMapper.deleteById(id);
    }
}

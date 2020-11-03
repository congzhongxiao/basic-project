package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.domain.Ztree;
import com.basic.entity.Permission;
import com.basic.mapper.PermissionMapper;
import com.basic.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lee
 * @since 2020-03-10
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

    public List<Permission> getPermissionListByRoleId(String roleId) {
        return baseMapper.getPermissionListByRoleId(roleId);
    }

    public List getPermissionListByCode(String code) {
        return baseMapper.selectList(new QueryWrapper<Permission>().eq("code", code));
    }

    public int deleteById(String id) {
        Permission permission = baseMapper.selectById(id);
        if (permission != null) {
            List<Permission> childs = baseMapper.selectList(new QueryWrapper<Permission>().eq("pid", id));
            if (childs != null && childs.size() > 0) {
                return -1;//存在子权限
            } else {
                baseMapper.deleteById(id);
            }
        }
        return 1;
    }

    public List<Ztree> getAllTree() {
        List<Permission> permissionList = baseMapper.selectList(Wrappers.emptyWrapper());
        return installTree(permissionList,null);
    }

    private List<Ztree> installTree(List<Permission> permissionList,List<Permission> checkedList) {
        List<Ztree> treeList = new ArrayList<Ztree>();
        if (permissionList != null && permissionList.size() > 0) {
            for (Permission permission : permissionList) {
                Ztree tree = new Ztree();
                tree.setId(permission.getId());
                tree.setPId(permission.getPid());
                tree.setTitle(permission.getName());
                tree.setName(permission.getName());
                if(checkedList != null && checkedList.size() > 0) {
                    for(Permission check : checkedList) {
                        if(check.getId().equals(permission.getId())) {
                            tree.setChecked(true);
                        }
                    }
                }

                treeList.add(tree);
            }
        }
        return treeList;
    }

    public List<Ztree> getPermissionTreeForRole(String roleId) {
        List<Permission> checkedList =  getPermissionListByRoleId(roleId);
        List<Permission> allList = baseMapper.selectList(Wrappers.emptyWrapper());
        return installTree(allList,checkedList);
    }


}

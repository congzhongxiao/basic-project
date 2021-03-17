package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.entity.SysArea;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.SysOrganization;
import com.basic.service.SysOrganizationService;
import com.basic.mapper.SysOrganizationMapper;

import java.util.List;
import java.util.Map;
/**
*组织架构ServiceImpl
*@author: lee
*@time: 2021-03-17 15:22:02
*/
@Service
public class SysOrganizationServiceImpl extends ServiceImpl<SysOrganizationMapper, SysOrganization> implements SysOrganizationService {

    public int addOrganization(SysOrganization organization){
        SysOrganization parent = baseMapper.selectById(organization.getPid());
        if(parent != null) {
            organization.setAncestors(parent.getAncestors() + "," + organization.getPid());
        } else {
            organization.setAncestors("0");
        }
        return baseMapper.insert(organization);
    }

    public int updateOrganization(SysOrganization organization) {
        SysOrganization currentParent = baseMapper.selectById(organization.getPid());
        String oldAncestors =baseMapper.selectById(organization.getId()).getAncestors();
        if(currentParent != null) {
            String newAncestors = currentParent.getAncestors() + "," + currentParent.getId();
            organization.setAncestors(newAncestors);
            updateChildrenAncestors(organization.getId(),newAncestors,oldAncestors);
        }
        return baseMapper.updateById(organization);
    }

    /**
     * 更新所有子部门的祖先数据
     * @param parentId
     * @param newAncestors
     * @param oldAncestors
     */
    private void updateChildrenAncestors(String parentId,String newAncestors,String oldAncestors){
        List<SysOrganization> children = baseMapper.getChildrenById(parentId);
        if(children != null && children.size() >0){
            for(SysOrganization child:children) {
                child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
                baseMapper.updateById(child);
            }
        }
    }


    public int deleteById(String id) {
        SysOrganization organization = baseMapper.selectById(id);
        if (organization != null) {
            List<SysOrganization> children = baseMapper.selectList(new QueryWrapper<SysOrganization>().eq("pid", id));
            if (children != null && children.size() > 0) {
                return -1;//存在子信息
            } else {
                baseMapper.deleteById(id);
            }
        }
        return 1;
    }

}

package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.utils.StringUtils;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.SysArea;
import com.basic.service.SysAreaService;
import com.basic.mapper.SysAreaMapper;

import java.util.List;
import java.util.Map;
/**
*行政区划ServiceImpl
*@author: lee
*@time: 2020-11-12 10:07:45
*/
@Service
public class SysAreaServiceImpl extends ServiceImpl<SysAreaMapper, SysArea> implements SysAreaService {

    public boolean isCodeExist(SysArea area){
        List<SysArea> exist = baseMapper.selectList(new QueryWrapper<SysArea>().eq("code",area.getCode()));
        if(exist != null && exist.size() > 0) {
            if(StringUtils.isNotBlank(area.getId())) {
                if(!(exist.size() == 1 && StringUtils.equals(exist.get(0).getId(),area.getId()))) {
                    return true;
                }
            } else {
                return true;
            }
        }
        return false;

    }
    public int addArea(SysArea area){
        SysArea parent = baseMapper.selectById(area.getPid());
        if(parent != null) {
            area.setAncestors(parent.getAncestors() + "," + area.getPid());
        } else {
            area.setAncestors("0");
        }
        return baseMapper.insert(area);
    }

    public int updateArea(SysArea area) {
        SysArea currentParent = baseMapper.selectById(area.getPid());
        String oldAncestors =baseMapper.selectById(area.getId()).getAncestors();
        if(currentParent != null) {
            String newAncestors = currentParent.getAncestors() + "," + currentParent.getId();
            area.setAncestors(newAncestors);
            updateChildrenAncestors(area.getId(),newAncestors,oldAncestors);
        }
        return baseMapper.updateById(area);
    }

    /**
     * 更新所有子部门的祖先数据
     * @param parentId
     * @param newAncestors
     * @param oldAncestors
     */
    private void updateChildrenAncestors(String parentId,String newAncestors,String oldAncestors){
        List<SysArea> children = baseMapper.getChildrenById(parentId);
        if(children != null && children.size() >0){
            for(SysArea child:children) {
                child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
                baseMapper.updateById(child);
            }
        }
    }


}

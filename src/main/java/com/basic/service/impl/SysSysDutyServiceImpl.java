package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.entity.User;
import com.basic.entity.UserDuty;
import com.basic.service.UserDutyService;
import com.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.SysDuty;
import com.basic.service.SysDutyService;
import com.basic.mapper.SysDutyMapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
/**
*职务ServiceImpl
*@author: djy
*@time: 2022-01-21 14:24:47
*/
@Service
public class SysSysDutyServiceImpl extends ServiceImpl<SysDutyMapper, SysDuty> implements SysDutyService {

    @Autowired
    UserService userService;

    @Autowired
    UserDutyService userDutyService;

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<SysDuty> page = new PageUtil<SysDuty>(queryParam).getPage();
        QueryWrapper<SysDuty> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        if (queryParam.get("duty_name") != null) {
            queryWrapper.like("duty_name", queryParam.get("duty_name"));
        }
        if (queryParam.get("code") != null) {
            queryWrapper.like("code", queryParam.get("code"));
        }
        IPage mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

    /**
     * 根据职务id返回数据权限
     *@param dutyId
     *@return  int
     */
    public int findDataPermissionById(String dutyId){
        SysDuty duty = baseMapper.selectById(dutyId);
        if(duty==null){
            return -1;
        }
        return duty.getDutyLimit();
    }

    /**
     * 根据职务编码返回数据权限
     *@param code
     *@return  int
     */
    public int findDataPermissionByCode(String code){
        QueryWrapper<SysDuty> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(SysDuty::getCode, code)
                .orderByDesc(SysDuty::getId);
        queryWrapper.last(" limit 1");

        SysDuty duty = baseMapper.selectOne(queryWrapper);
        if(duty==null){
            return -1;
        }
        return duty.getDutyLimit();
    }

    /**
     * 将职务的更新同步至与此职务匹配的用户表及用户职务关系表
     * @param sysDuty
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateDuty(SysDuty sysDuty){
        this.baseMapper.updateById(sysDuty);
        List<User> userList = userService.findListByDutyId(sysDuty.getId());
        if(userList!=null && userList.size()>0){
            for(User user:userList){
                user.setDutyName(sysDuty.getDutyName());
                userService.updateById(user);
            }
        }
        List<UserDuty> userDutyList = userDutyService.findListByDutyId(sysDuty.getId());
        if(userDutyList!=null && userDutyList.size()>0){
            for(UserDuty userDuty:userDutyList){
                userDuty.setDutyName(sysDuty.getDutyName());
                userDutyService.updateById(userDuty);
            }
        }
    }
}

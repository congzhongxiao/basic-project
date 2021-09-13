package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.utils.StringUtils;
import com.basic.entity.SysConfig;
import com.basic.mapper.SysConfigMapper;
import com.basic.service.SysConfigService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
*系统配置ServiceImpl
*@author: lee
*@time: 2021-09-11 15:36:32
*/
@Service
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig> implements SysConfigService {

    public List<SysConfig> findListByModel(String model) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("model", model);
        queryWrapper.orderByDesc("id");
        return baseMapper.selectList(queryWrapper);
    }


    @Transactional(rollbackFor = Exception.class)
    public void saveAndUpdate(List<SysConfig> addList, List<SysConfig> updateList, List<SysConfig> allList) {
        Map<String,String> keyMap = new HashMap<>();
        if (addList != null && addList.size() > 0) {
            for (SysConfig config : addList) {
                baseMapper.insert(config);
                keyMap.put(config.getCode(),null);
            }
        }
        if (updateList != null && updateList.size() > 0) {
            for (SysConfig config : updateList) {
                baseMapper.updateById(config);
                keyMap.put(config.getCode(),null);
            }
        }
        if(allList != null && allList.size() > 0) {
            for(SysConfig rec : allList) {
                if(!keyMap.containsKey(rec.getCode())) {
                    baseMapper.deleteById(rec);
                }
            }
        }

    }

    /**
     * 根据code返回系统设置储存值
     *
     * @param code
     * @return value
     */
    public String findValueByCode(String code) {

        //验证code是否为空
        if (StringUtils.isBlank(code)) {
            return null;
        }

        //根据code值检索相应的系统设置
        List<SysConfig> configList = this.baseMapper.selectList(new QueryWrapper<SysConfig>().eq("code", code));

        if(configList==null||configList.size()==0){
            return null;
        }

        SysConfig setting = configList.get(0);

        //验证系统设置实体类是否为空
        if (setting == null) {
            return null;
        }

        return setting.getValue();
    }


}

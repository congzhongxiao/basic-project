package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.domain.Result;
import com.basic.common.utils.StringUtils;
import org.springframework.stereotype.Service;

import com.basic.common.utils.PageUtil;

import com.basic.entity.Person;
import com.basic.service.PersonService;
import com.basic.mapper.PersonMapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 人员信息ServiceImpl
 *
 * @author: lee
 * @time: 2020-05-07 10:03:33
 */
@Service
public class PersonServiceImpl extends ServiceImpl<PersonMapper, Person> implements PersonService {

    @Transactional(rollbackFor = Exception.class )
    public Result importPerson(List<Person> personList, String currentUser) {
        if (personList != null && personList.size() > 0) {
            int successNum = 0;
            int failNum = 0;
            StringBuffer successMsg = new StringBuffer();
            StringBuffer failMsg = new StringBuffer();
            for (Person person : personList) {
                try {
                    String gender = person.getStrGender();
                    if ("男".equals(gender)) {
                        person.setGender(1);
                    } else if ("女".equals(gender)) {
                        person.setGender(2);
                    } else {
                        person.setGender(0);
                    }
                    person.setCreateBy(currentUser);
                    person.setCreateTime(new Date());
                    this.baseMapper.insert(person);
                    successNum ++;
                    successMsg.append("<br />" + successNum + "、(" + person.getName() + ")信息数据导入成功！");

                } catch (Exception e) {
                    failNum ++;
                    failMsg.append("<br />" + failNum + "、(" + person.getName() + ")信息数据导入失败！");
                }

            }
            if(failNum > 0) {
                failMsg.insert(0, "很抱歉，导入失败！共 " + failNum + " 条数据格式不正确，错误如下：");
                return Result.fail(failMsg.toString());
            } else {
                successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
                return Result.success(successMsg.toString());
            }
        } else {
            return Result.fail("导入数据不能为空！");
        }
    }

    //添加
    public boolean add(Person person) {
        try {
            baseMapper.insert(person);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    //分页查询
    public IPage<Map<String, Object>> getPageInfo(Map<String, Object> queryParam) {
        Page<Person> page = new PageUtil<Person>(queryParam).getPage();
        QueryWrapper<Person> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return mapIPage;
    }

    public Page<Person> getPageInfo2(Map<String, Object> queryParam) {
        Page<Person> tempPage = new PageUtil<Person>(queryParam).getPage();
        String[] ids = {"1258670326279045121","1258670326245490690"};
        queryParam.put("ids",ids);
        Page<Person> page =tempPage.setRecords(this.baseMapper.getPersonPage(tempPage,queryParam));
        return page;
    }

}

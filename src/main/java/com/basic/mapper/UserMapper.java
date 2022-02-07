package com.basic.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.basic.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface UserMapper extends BaseMapper<User> {
    /**
     * 查询
     * @param queryParam
     * @return
     */
    List<User> getUserPageInfo(Page<User> tempPage, @Param("queryParam") Map<String, Object> queryParam);
    List<User> getUserWithDutyInfo(@Param("queryParams") Map<String, Object> queryParams);
}


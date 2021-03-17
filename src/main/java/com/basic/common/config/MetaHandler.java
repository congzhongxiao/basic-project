package com.basic.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.basic.common.utils.ShiroUtils;
import com.basic.entity.User;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class MetaHandler implements MetaObjectHandler {
    /**
     * 配置保存时自动插入创建时间和创建账号
     * @param metaObject
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        User currentUser = ShiroUtils.getCurrentUser();
        this.setFieldValByName("createTime", new Date(), metaObject);
        if (currentUser != null) {
            this.setFieldValByName("createBy", currentUser.getUsername(), metaObject);
            this.setFieldValByName("updateBy", currentUser.getUsername(), metaObject);
        }
        this.setFieldValByName("updateTime", new Date(), metaObject);
    }
    /**
     * 配置更新时自动插入更新时间和更新账号
     * @param metaObject
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        User currentUser = ShiroUtils.getCurrentUser();
        if (currentUser != null) {
            this.setFieldValByName("updateBy", currentUser.getUsername(), metaObject);
        }
        this.setFieldValByName("updateTime", new Date(), metaObject);
    }
}

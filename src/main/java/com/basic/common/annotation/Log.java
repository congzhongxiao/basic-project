package com.basic.common.annotation;


import com.basic.common.enums.BusinessType;
import com.basic.common.enums.OperatorType;

import java.lang.annotation.*;

/**
 * 自定义操作日志记录注解
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**
     * 模块
     */
    String name() default "";

    /**
     * 功能
     */
    BusinessType type() default BusinessType.OTHER;

    /**
     * 操作人类别
     */
    OperatorType operType() default OperatorType.MANAGE;

    /**
     * 是否保存请求的参数
     */
    boolean isSaveRequestData() default true;
}

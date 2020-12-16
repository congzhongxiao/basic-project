package com.basic.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
*操作日志实体类
*@author: lee
*@time: 2020-11-03 15:36:44
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_operate_log")
public class SysOperateLog extends Model<SysOperateLog> {
    private static final long serialVersionUID = 1L;
    /**
    *主键
    */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
    *模块名称
    */
    private String name;

    /**
    *业务类型0其他1新增2修改3删除
    */
    private Integer type;

    /**
    *方法名称
    */
    private String method;

    /**
    *请求类型
    */
    private String requestType;

    /**
    *操作类型0其他1后台2移动端
    */
    private Integer operType;

    /**
    *操作用户id
    */
    private String operUserId;

    /**
    *操作用户名称
    */
    private String operUserName;

    /**
    *操作用户账号
    */
    private String operUserAccount;

    /**
    *操作时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date operTime;

    /**
    *请求url
    */
    private String operUrl;

    /**
    *操作ip
    */
    private String operIp;

    /**
    *操作地点
    */
    private String operLocation;

    /**
    *请求参数
    */
    private String operParam;

    /**
    *返回参数
    */
    private String resultParam;

    /**
    *操作状态0正常1异常
    */
    private Integer state;

    /**
    *错误消息
    */
    private String errorMsg;


}

package com.basic.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.basic.common.constants.UserConstant;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * @author lee
 * @since 2020-03-10
 */
@Data
@TableName("sys_user")
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 用户名
     */
    @NotEmpty(message = "用户名不能为空")
    private String username;

    /**
     * 密码
     */
    @NotEmpty(message = "密码不能为空")
    private String password;

    private String salt;

    /**
     * 密码强度
     * 0初始 1很弱 2弱 3安全 4很安全
     */
    private Integer passwordLevel;

    /**
     * 密码重置状态 0正常，1重置
     */
    private Integer passwordStatus;

    /**
     * 密码重置时间
     */
    @TableField(value = "password_time")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date passwordTime;

    /**
     * 昵称
     */
    @NotEmpty(message = "昵称不能为空")
    private String nickname;
    /**
     * 电子邮箱
     */
    @Email(message = "邮箱格式不正确")
    private String email;

    /**
     * 手机号码
     */
    private String mobile;

    /**
     * 头像地址
     */
    private String icon;

    /**
     * 用户状态，0禁用，1启用
     */
    private Integer status;

    /**
     * 连续登录失败次数
     */
    private Integer failNum;


    /**
     * 最近登录失败时间
     */
    @TableField(value = "last_fail_time")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date lastFailTime;

    /**
     * 最近登录IP
     */
    private String lastLoginIp;

    /**
     * 最近登录时间
     */
    @TableField(value = "last_login_time")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date lastLoginTime;

    /**
     * 创建账号
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新账号
     */
    @TableField(value = "update_by", fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    /**
     * 备注
     */
    private String remark;

    /**
     * 所属公司id
     */
    String companyId;

    /**
     * 所属公司名称
     */
    String companyName;

    /**
     * 公司编码
     */
    String companyCode;

    /**
     * 所属部门id
     */
    String deptId;

    /**
     * 所属部门名称
     */
    String deptName;

    /**
     * 部门编码
     */
    String deptCode;

    /**
     * 主要职务id
     */
    String dutyId;

    /**
     * 主要职务名称
     */
    String dutyName;

    /**
     * 主要职务用户职务关系表
     */
    String userDutyId;

    /**
     * 显示顺序，同一部门下不允许重复
     */
    private int sort;
}

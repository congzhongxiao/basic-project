package com.basic.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

/**
 * 权限实体类
 * @author lee
 * @since 2020-03-10
 */
@TableName("sys_permission")
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Permission extends Model<Permission> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 权限名
     */
    @NotEmpty(message = "权限名称不能为空")
    private String name;

    /**
     * 权限类型
     */
    private Integer type;

    /**
     * 权限编码
     */
    @NotEmpty(message = "权限编码不能为空")
    private String code;

    /**
     * 父权限id
     */
    private String pid;

    /**
     * 权限值
     */
    private String value;

    /**
     * 备注
     */
    private String comment;

}

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
 * @author lee
 * @since 2020-03-10
 */
@TableName("sys_role")
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
     * 角色名称
     */
    @NotEmpty(message = "角色名称不能为空")
    private String name;
    /**
     * 角色编码
     */
    @NotEmpty(message = "角色编码不能为空")
    private String code;

    /**
     * 备注
     */
    private String comment;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}

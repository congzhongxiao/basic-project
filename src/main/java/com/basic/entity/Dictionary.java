package com.basic.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

/**
 * 字典实体类
 *
 * @author: lee
 * @time: 2020-05-14 11:44:10
 */

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_dictionary")
public class Dictionary extends Model<Dictionary> {
    private static final long serialVersionUID = 1L;
    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
     * 字典名称
     */
    @NotEmpty(message = "字典名称不能为空")
    private String name;

    /**
     * 字典值
     */
    @NotEmpty(message = "字典值不能为空")
    private String value;

    /**
     * 字典分类
     */
    @NotEmpty(message = "字典分类不能为空")
    private String type;

    /**
     * 说明
     */
    private String remark;

    /**
     * 状态 0正常 1禁用
     */
    private Integer status;

    /**
     * 排序
     */
    @Min(value = 0,message = "排序必须为正整数")
    private Integer sort;


}

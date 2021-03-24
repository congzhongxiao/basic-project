package com.basic.controller.portal.core;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class BaseResponse implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 用来定义响应结果状态
     */
    @ApiModelProperty(value = "响应结果状态code")
    private int responseCode = 200;
    @ApiModelProperty(value = "响应结果状态message")
    private String responseMessage = "操作成功";
}

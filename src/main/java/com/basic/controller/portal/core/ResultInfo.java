package com.basic.controller.portal.core;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ResultInfo<T> extends BaseResponse {
    @ApiModelProperty("返回结果")
    private T data;
}


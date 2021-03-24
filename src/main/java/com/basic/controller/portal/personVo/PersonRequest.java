package com.basic.controller.portal.personVo;

import com.basic.controller.portal.core.BaseRequest;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import javax.validation.constraints.NotNull;

/**
 * 请求参数
 */
@Data
public class PersonRequest extends BaseRequest {
    @ApiModelProperty(value = "姓名")
    @NotNull(message = "姓名不能为空")
    private String name;
}

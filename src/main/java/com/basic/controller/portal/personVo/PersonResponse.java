package com.basic.controller.portal.personVo;

import com.basic.entity.Person;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.io.Serializable;
import java.util.List;

/**
 * 返回值
 */
@Data
public class PersonResponse implements Serializable {

    /**
     * 人员集合
     */
    @ApiModelProperty(value = "人员集合")
    private List<Person> personList;
}

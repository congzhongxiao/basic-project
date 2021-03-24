package com.basic.controller.portal.openApi;

import com.basic.controller.portal.core.ResultInfo;
import com.basic.controller.portal.personVo.PersonRequest;
import com.basic.controller.portal.personVo.PersonResponse;
import com.basic.controller.portal.utils.ResultInfoUtils;
import com.basic.entity.Person;
import com.basic.service.PersonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 接口控制器
 */
@Api(tags = "人员接口")
@RestController
@RequestMapping("/openApi/person")
public class PersonApiController {

    @Autowired
    private PersonService personService;

    @ApiOperation("根据姓名查询人员集合")
    @PostMapping("/getPersonListByName")
    public ResultInfo<PersonResponse> getPersonListByName(@RequestBody PersonRequest request) {
        List<Person> personList = personService.list();
        PersonResponse result = new PersonResponse();
        result.setPersonList(personList);
        return ResultInfoUtils.success(result);
    }
}

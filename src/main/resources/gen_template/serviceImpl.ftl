package ${pageInfo.parentPage}.${pageInfo.serviceImplPage};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import ${pageInfo.parentPage}.${pageInfo.entityPage}.${entityName};
import ${pageInfo.parentPage}.${pageInfo.servicePage}.${serviceName};
import ${pageInfo.parentPage}.${pageInfo.mapperPage}.${mapperName};

import java.util.Map;
/**
*${functionName}ServiceImpl
*@author: ${author}
*@time: ${createDate}
*/
@Service
public class ${serviceImplName} extends ServiceImpl<${mapperName}, ${entityName}> implements ${serviceName} {

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<${entityName}> page = new PageUtil<${entityName}>(queryParam).getPage();
        QueryWrapper<${entityName}> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<${entityName}> mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

}

package ${pageInfo.parentPage}.${pageInfo.servicePage};

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import ${pageInfo.parentPage}.${pageInfo.entityPage}.${entityName};

import java.util.Map;

/**
*${functionName} Service
*@author: ${author}
*@time: ${createDate}
*/
public interface ${serviceName} extends IService<${entityName}> {
    Result getPageInfo(Map<String, Object> queryParam);
}
package ${pageInfo.parentPage}.${pageInfo.servicePage};

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import ${pageInfo.parentPage}.${pageInfo.entityPage}.${entityName};

import java.util.Map;

/**
*${functionName} Service
*@author: ${author}
*@time: ${createDate}
*/
public interface ${serviceName} extends IService<${entityName}> {
    boolean add(${entityName} ${varName});
    IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam);
}
package ${pageInfo.parentPage}.${pageInfo.mapperPage};

import ${pageInfo.parentPage}.${pageInfo.entityPage}.${entityName};
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Component;
/**
*${functionName} Mapper
*@author: ${author}
*@time: ${createDate}
*/
@Component
public interface ${mapperName} extends BaseMapper<${entityName}> {

}
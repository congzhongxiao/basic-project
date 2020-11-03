package com.basic.common.manager.factory;

import com.basic.common.utils.AddressUtils;
import com.basic.common.utils.SpringUtils;
import com.basic.entity.SysOperateLog;
import com.basic.service.SysOperateLogService;

import java.util.TimerTask;

/**
 * 异步工厂（产生任务用）
 */
public class AsyncFactory {

    /**
     * 操作日志记录
     * @param operLog 操作日志信息
     * @return 任务task
     */
    public static TimerTask recordOper(final SysOperateLog operLog)
    {
        return new TimerTask()
        {
            @Override
            public void run()
            {
                // 远程查询操作地点
                operLog.setOperLocation(AddressUtils.getRealAddressByIP(operLog.getOperIp()));
                SpringUtils.getBean(SysOperateLogService.class).save(operLog);
            }
        };
    }
}

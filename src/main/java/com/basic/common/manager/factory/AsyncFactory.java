package com.basic.common.manager.factory;

import com.basic.common.utils.AddressUtils;
import com.basic.common.utils.ServletUtils;
import com.basic.common.utils.ShiroUtils;
import com.basic.common.utils.SpringUtils;
import com.basic.entity.SysLoginLog;
import com.basic.entity.SysOperateLog;
import com.basic.service.SysLoginLogService;
import com.basic.service.SysOperateLogService;
import eu.bitwalker.useragentutils.UserAgent;

import java.util.Date;
import java.util.TimerTask;

/**
 * 异步工厂（产生任务用）
 */
public class AsyncFactory {

    /**
     * 操作日志记录
     *
     * @param operLog 操作日志信息
     * @return 任务task
     */
    public static TimerTask recordOper(final SysOperateLog operLog) {
        return new TimerTask() {
            @Override
            public void run() {
                // 远程查询操作地点
                operLog.setOperLocation(AddressUtils.getRealAddressByIP(operLog.getOperIp()));
                SpringUtils.getBean(SysOperateLogService.class).save(operLog);
            }
        };
    }

    /**
     * 记录登陆信息
     *
     * @param username 用户名
     * @param status   状态
     * @param message  消息
     * @param args     列表
     * @return 任务task
     */
    public static TimerTask recordLoginLog(final String username, final int status, final String message, final Object... args) {
        final UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        final String ip = ShiroUtils.getIp();
        return new TimerTask() {
            @Override
            public void run() {
//                String address = AddressUtils.getRealAddressByIP(ip);
                // 获取客户端操作系统
                String os = userAgent.getOperatingSystem().getName();
                // 获取客户端浏览器
                String browser = userAgent.getBrowser().getName();
                // 封装对象
                SysLoginLog loginLog = new SysLoginLog();
                loginLog.setUsername(username);
                loginLog.setLoginIp(ip);
                loginLog.setBrowser(browser);
                loginLog.setOs(os);
                loginLog.setMsg(message);
                loginLog.setStatus(status);
                loginLog.setLoginTime(new Date());
                // 插入数据
                SpringUtils.getBean(SysLoginLogService.class).save(loginLog);
            }
        };
    }
}

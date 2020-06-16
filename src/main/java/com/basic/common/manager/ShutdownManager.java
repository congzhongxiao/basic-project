package com.basic.common.manager;

import net.sf.ehcache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PreDestroy;

/**
 * 确保应用退出时能关闭后台线程
 */
@Component
public class ShutdownManager {

    @Autowired(required = false)
    private EhCacheManager ehCacheManager;

    @PreDestroy
    public void destroy() {
        shutdownAsyncManager();
        shutdownEhCacheManager();
    }

    /**
     * 停止异步执行任务
     */
    private void shutdownAsyncManager() {
        try {
            AsyncManager.me().shutdown();
        } catch (Exception e) {
        }
    }

    private void shutdownEhCacheManager() {
        try {
            if (ehCacheManager != null) {
                CacheManager cacheManager = ehCacheManager.getCacheManager();
                cacheManager.shutdown();
            }
        } catch (Exception e) {
        }
    }
}

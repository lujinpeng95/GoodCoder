package com.baidu.miee.ilog.client.core.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 读Properties文件工具类
 *
 * @author liuyunhang
 *
 */
public class PropertiesUtils {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(PropertiesUtils.class);
    
    /**
     * 读取 Classpath上的配置文件
     *
     * @param propertiesFileName
     * @return
     */
    public static Properties readPropertiesFile(String propertiesFileName) {
        Properties prop = new Properties();
        InputStream is = getResourceAsStream(propertiesFileName);
        if (is != null) {
            try {
                prop.load(is);
            } catch (IOException e) {
                LOGGER.error("exception", e);
            } finally {
                try {
                    is.close();
                } catch (IOException e) {
                    LOGGER.error("exception", e);
                }
            }
        }
        return prop;
    }
    
    public static InputStream getResourceAsStream(String name) {
        return Thread.currentThread().getContextClassLoader().getResourceAsStream(name);
    }
}

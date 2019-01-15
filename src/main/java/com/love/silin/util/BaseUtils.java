package com.love.silin.util;

import java.util.Properties;

/**
 * @program: silin
 * @description: 常用工具类
 * @author: siming.wang
 * @create: 2019-01-10 18:00
 **/

public class BaseUtils {

    public static boolean isOSLinux() {
        Properties prop = System.getProperties();
        String os = prop.getProperty("os.name");
        System.out.println(os);
        if (os != null && os.toLowerCase().indexOf("linux") > -1) {
            return true;
        } else if (os != null && os.toLowerCase().indexOf("mac") > -1){
            return true;
        }else {
            return false;
        }
    }
}

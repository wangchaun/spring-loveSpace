package com.love.silin.constant;

import com.love.silin.util.BaseUtils;

/**
 * @program: silin
 * @description: 一些常量
 * @author: siming.wang
 * @create: 2019-01-15 12:48
 **/

public class SystemConstants {

    private static final String linuxFilePath = "/silin/memory/";
    private static final String windowsFilePath = "D://silin//memory//";

    public static String getPhotoPath(String userName){

        String filePath = windowsFilePath + userName + "//";; // 上传后的路径
        if(BaseUtils.isOSLinux()){
            filePath = linuxFilePath + userName + "/";
        }

        return filePath;
    }

    public static final String LOGO_PATH = "/resources/img/logo.png";

}

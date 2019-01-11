package com.love.silin.config;

/**
 * @program: silin
 * @description: 配置资源映射路径
 * @author: siming.wang
 * @create: 2019-01-10 18:05
 **/

import com.love.silin.util.BaseUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 资源映射路径
 */
@Configuration
public class MyWebAppConfigurer extends WebMvcConfigurerAdapter {
    private final String linuxFilePath = "/silin/memory/";
    private final String windowsFilePath = "D://silin//memory";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if(BaseUtils.isOSLinux()){
            registry.addResourceHandler("/silin/memory/**").addResourceLocations("file:/silin/memory/");

        }else {
            registry.addResourceHandler("/silin/memory/**").addResourceLocations("file:D://silin//memory");
        }
    }
}
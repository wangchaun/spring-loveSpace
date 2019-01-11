package com.love.silin.base;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2019-01-11 14:44
 **/
@Controller
public class BaseController {
    /**
     * 成功消息
     *
     * @param errorCode 成功消息编码
     * @param request
     * @return
     */
    public String returnSuccess(String message,  HttpServletRequest request)
    {
        return "{\"result\":\"success\", \"message\":\"" + message + "\", \"level\":\"" + "info" + "\""+ "}";
    }
    /**
     * 成功消息
     *
     * @param errorCode 成功消息编码
     * @param request
     * @return
     */
    public String handlerException(String message, HttpServletRequest request)
    {
        return "{\"result\":\"error\", \"message\":\"" + message + "\", \"level\":\"" + "error" + "\" " + "}";
    }
}

package com.love.silin.web;

import com.love.silin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2018-11-05 15:02
 **/
@Controller
public class RegisterController {

    @Resource
    UserService userService;

    @RequestMapping("/registerList")
    public String registerList(){
        return "/login/register";
    }

    @RequestMapping("/registerServlet")
    public String register(HttpServletRequest request, String name, String password, String passwordConfirm){

        if(!password.equals(passwordConfirm)) {
            String errorMessage = "注册错误：两次输入密码不一致！";
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("name", name);

            return "/login/register";
        }

        if(password.equals("")){
            String errorMessage = "注册错误：密码为空！";
            request.setAttribute("errorMessage",errorMessage);
            request.setAttribute("name",name);

            return "/login/register";
        }

        Boolean successFlag = userService.register(name, password);

        if(!successFlag){
            String errorMessage = "注册错误：用户名已存在！";
            request.setAttribute("errorMessage",errorMessage);
            request.setAttribute("name",name);

            return "/login/register";
        }

        return "/common/success";
    }

}

package com.love.silin.web;

import com.love.silin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2018-11-05 14:53
 **/
@Controller
public class LoginController {

    @Resource
    UserService userService;

    @RequestMapping("/loginServlet")
    public String login(String name, String password, HttpServletRequest request){


        if(userService.checkUserExits(name, password)){
            HttpSession se = request.getSession();
            se.setAttribute("user", name);
            return "/show/loading";
        }

        String errorMessage = "登入错误：账号密码不一致或不存在该账号！<br> 请重新输入！";
        request.setAttribute("errorMessage", errorMessage);

        return "/login/login";

    }
}

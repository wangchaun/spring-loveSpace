package com.love.silin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2018-11-05 14:19
 **/
@Controller
public class FirstController {

    @RequestMapping("/firstServlet")
    public String firstServlet(String firstPassword){
        if("5201314".equals(firstPassword)){
            return "/login/login";
        }

        return "/common/error";
    }

}

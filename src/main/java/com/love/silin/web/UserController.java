package com.love.silin.web;

import com.love.silin.dao.user.BaseUserDO;
import com.love.silin.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2018-11-05 11:37
 **/

@RestController
@RequestMapping(value = "/user", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@Api(value = "Web - UserController", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    UserService userService;



    @GetMapping("/insert")
    @ApiOperation(httpMethod = "GET", value = "test 用户列表")
    public void test(){
        logger.info("begin");
        BaseUserDO baseUserDO = new BaseUserDO();
        baseUserDO.setCreateTime(new Date());
        baseUserDO.setLoverId(123);
        baseUserDO.setUserName("wangsm");
        baseUserDO.setPassWord("123123");
        userService.insertUser(baseUserDO);
        logger.info("end");

    }


}

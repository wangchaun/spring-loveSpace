package com.love.silin.service;

import com.love.silin.dao.user.BaseUserDO;
import com.love.silin.dao.user.UserDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2018-11-05 11:39
 **/
@Service
public class UserService {

    @Resource
    UserDAO userDAO;


    public void insertUser(BaseUserDO baseUserDO){
        userDAO.insert(baseUserDO);
    }
    public boolean register(String name, String password){

        BaseUserDO baseUserDOc = new BaseUserDO();
        baseUserDOc.setUserName(name);

        BaseUserDO baseUserDOFind = userDAO.selectByEO(baseUserDOc);

        if(baseUserDOFind != null){
            return false;
        }

        BaseUserDO baseUserDO = new BaseUserDO();
        baseUserDO.setCreateTime(new Date());
        baseUserDO.setLoverId(null);
        baseUserDO.setUserName(name);
        baseUserDO.setPassWord(password);
        baseUserDO.setYn("Y");
        userDAO.insert(baseUserDO);

        return true;
    }


    public Boolean checkUserExits(String name, String password){

        BaseUserDO baseUserDO = new BaseUserDO();
        baseUserDO.setUserName(name);

        BaseUserDO baseUserDOFind = userDAO.selectByEO(baseUserDO);

        if(baseUserDOFind == null){
            return false;
        }

        if(!baseUserDOFind.getPassWord().equals(password)){
            return false;
        }

        return true;
    }

}

package com.love.silin.service;

import com.love.silin.base.Constants;
import com.love.silin.dao.user.BaseUserDO;
import com.love.silin.dao.user.UserDAO;
import com.love.silin.util.RSAUtils;
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
    public boolean register(String name, String password) throws Exception{

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
        baseUserDO.setPassWord(RSAUtils.publicEncrypt(password, RSAUtils.getPublicKey(Constants.RSA_ENCRYPT.PUBLIC_KEY)));
        baseUserDO.setYn("Y");
        userDAO.insert(baseUserDO);

        return true;
    }


    public Boolean checkUserExits(String name, String password) throws Exception{

        BaseUserDO baseUserDO = new BaseUserDO();
        baseUserDO.setUserName(name);

        BaseUserDO baseUserDOFind = userDAO.selectByEO(baseUserDO);

        if(baseUserDOFind == null){
            return false;
        }
        String passwordDb = RSAUtils.privateDecrypt(baseUserDOFind.getPassWord(), RSAUtils.getPrivateKey(Constants.RSA_ENCRYPT.PRIVATE_KEY));

        if(!passwordDb.equals(password)){
            return false;
        }

        return true;
    }

}

package com.love.silin.service;

import com.love.silin.base.SiLinException;
import com.love.silin.dao.user.BaseUserDO;
import com.love.silin.dao.user.UserDAO;
import com.love.silin.util.BaseUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2019-01-11 16:48
 **/
@Service
public class FileService {

    @Resource
    UserDAO userDAO;

    private final String linuxFilePath = "/silin/memory/";
    private final String windowsFilePath = "D://silin//memory";


    private static final Logger logger = LoggerFactory.getLogger(FileService.class);


    /**
     *
     * 功能描述: 上传文件
     *
     * @param:
     * @return: 
     * @auther: siming.wang
     * @date: 19/1/11 下午4:49
     */
    public void uploadFileByUser(String userName, MultipartFile file) throws SiLinException{

        if (StringUtils.isBlank(userName)){
            throw new SiLinException("请先登陆");
        }

        BaseUserDO baseUserDO = new BaseUserDO();
        baseUserDO.setUserName(userName);
        BaseUserDO baseUserDOFind = userDAO.selectByEO(baseUserDO);

        if(baseUserDOFind == null){
            throw new SiLinException("请先登陆");
        }

        if (file.isEmpty()) {
            throw new SiLinException("请上传文件");
        }
        String fileName = file.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        String filePath = windowsFilePath; // 上传后的路径
        if(BaseUtils.isOSLinux()){
            filePath = linuxFilePath;
        }
        fileName = baseUserDOFind.getId().toString() + "name:" +UUID.randomUUID() + suffixName; // 新文件名
        File dest = new File(filePath + fileName);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String filename = linuxFilePath + fileName;
        logger.info(fileName);
    }

}

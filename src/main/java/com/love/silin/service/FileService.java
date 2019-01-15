package com.love.silin.service;

import com.love.silin.base.SiLinException;
import com.love.silin.constant.SystemConstants;
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
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

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

    private static final Logger logger = LoggerFactory.getLogger(FileService.class);


    public List<String> getMemoryPhotosByUserId(String userName) throws Exception{

        if (StringUtils.isBlank(userName)){
            throw new SiLinException("请先登陆");
        }

        BaseUserDO baseUserDO = new BaseUserDO();
        baseUserDO.setUserName(userName);
        BaseUserDO baseUserDOFind = userDAO.selectByEO(baseUserDO);

        if(baseUserDOFind == null){
            throw new SiLinException("请先登陆");
        }

        //查找对象id，这样可以展示对象上传的照片
        baseUserDO.setUserName(null);
        baseUserDO.setId(baseUserDOFind.getId());
        BaseUserDO loveDo = userDAO.selectByEO(baseUserDO);


        List<String> photos = new ArrayList<>();

        String filePath = SystemConstants.getPhotoPath(baseUserDOFind.getUserName());

        List<File> files = getFiles(filePath);
        ArrayList<String> iconNameList = new ArrayList<String>();//返回文件名数组

        for(int i=0;i<files.size();i++){
            String curName = files.get(i).getPath();//获取文件名字
            if(curName.contains(baseUserDOFind.getId().toString())){
                iconNameList.add(curName);
            }else if (curName.contains(loveDo.getId().toString())){
                iconNameList.add(curName);
            }

        }
        return iconNameList;
    }

    public ArrayList<File> getFiles(String path) throws Exception {
        //目标集合fileList
        ArrayList<File> fileList = new ArrayList<File>();
        File file = new File(path);
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (File fileIndex : files) {
                //如果这个文件是目录，则进行递归搜索
                if (fileIndex.isDirectory()) {
                    getFiles(fileIndex.getPath());
                } else {
                    //如果文件是普通文件，则将文件句柄放入集合中
                    fileList.add(fileIndex);
                }
            }
        }

        ArrayList<File> sortedList = (ArrayList<File>) fileList.stream().sorted((f1, f2)->(int)(f1.lastModified()-f2.lastModified())).collect(Collectors.toList());;
        return sortedList;
    }


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

        String filePath = SystemConstants.getPhotoPath(baseUserDOFind.getUserName());

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
    }

}

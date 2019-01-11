package com.love.silin.web.file;

import com.love.silin.base.BaseController;
import com.love.silin.base.SiLinException;
import com.love.silin.dao.user.BaseUserDO;
import com.love.silin.service.FileService;
import com.love.silin.util.BaseUtils;
import com.love.silin.web.UserController;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.*;
import java.util.UUID;


/**
 * @program: silin
 * @description: 文件相关
 * @author: siming.wang
 * @create: 2019-01-10 17:58
 **/
@Controller
public class FileController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);

    @Resource
    FileService fileService;

    @GetMapping(value = "/file")
    public String file() {
        return "/file/uploadFile";
    }

    @PostMapping(value = "/fileUpload")
    @ResponseBody
    public String fileUpload(@RequestParam(value = "file") MultipartFile file, Model model, HttpServletRequest request) {
        String userName = (String)request.getSession().getAttribute("user");
        try {
            fileService.uploadFileByUser(userName, file);
            return returnSuccess("处理成功", request);
        }catch (SiLinException e){
            return handlerException(e.getMessage(), request);
        }

    }
}
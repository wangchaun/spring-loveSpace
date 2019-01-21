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
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
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

    /**
     *
     * 功能描述: 照片墙
     *
     * @param: 
     * @return: 
     * @auther: siming.wang
     * @date: 19/1/21 下午4:34
     */
    @RequestMapping("/photoList")
    public String diaryServletList(Model model, HttpServletRequest request){
        String userName = (String)request.getSession().getAttribute("user");
        int pageNum = (int)request.getSession().getAttribute("pageNum");

        try {
            List<String> photos = fileService.getMemoryPhotosByUserId(userName, pageNum);
            model.addAttribute("photos", photos);
        }catch (Exception e){
            logger.error("photoList={}",e);
            model.addAttribute("errorMessqge", e.getMessage());
            return "/common/error";
        }
        return "/file/photos";
    }
    /**
     *
     * 功能描述: 照片墙前一页
     *
     * @param: 
     * @return: 
     * @auther: siming.wang
     * @date: 19/1/21 下午4:34
     */
    @RequestMapping("/prePhotoList")
    public String prePhotoList(Model model, HttpServletRequest request){
        String userName = (String)request.getSession().getAttribute("user");
        int pageNum = (int)request.getSession().getAttribute("pageNum");
        HttpSession se = request.getSession();
        se.setAttribute("pageNum", --pageNum);
        if(pageNum < 1){
            pageNum = 1;
            se.setAttribute("pageNum", 1);
        }

        try {
            List<String> photos = fileService.getMemoryPhotosByUserId(userName, pageNum);
            model.addAttribute("photos", photos);
        }catch (Exception e){
            logger.error("photoList={}",e);
            model.addAttribute("errorMessqge", e.getMessage());
            return "/common/error";
        }
        return "/file/photos";
    }
    /**
     *
     * 功能描述: 照片墙后一页
     *
     * @param: 
     * @return: 
     * @auther: siming.wang
     * @date: 19/1/21 下午4:34
     */
    @RequestMapping("/nextPhotoList")
    public String nextPhotoList(Model model, HttpServletRequest request){
        String userName = (String)request.getSession().getAttribute("user");
        int pageNum = (int)request.getSession().getAttribute("pageNum");
        HttpSession se = request.getSession();
        se.setAttribute("pageNum", ++pageNum);
        try {
            List<String> photos = fileService.getMemoryPhotosByUserId(userName, pageNum);
            model.addAttribute("photos", photos);
        }catch (Exception e){
            logger.error("photoList={}",e);
            model.addAttribute("errorMessqge", e.getMessage());
            return "/common/error";
        }
        return "/file/photos";
    }

    @PostMapping(value = "/fileUpload")
    @ResponseBody
    public String fileUpload(@RequestParam(value = "file") MultipartFile file, Model model, HttpServletRequest request) {
        String userName = (String)request.getSession().getAttribute("user");
        try {
            fileService.uploadFileByUser(userName, file);
            return returnSuccess("处理成功", request);
        }catch (SiLinException e){
            logger.error("photoList={}",e);
            return handlerException(e.getMessage(), request);
        }

    }
}
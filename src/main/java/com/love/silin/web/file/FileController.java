package com.love.silin.web.file;

import com.love.silin.util.BaseUtils;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.UUID;


/**
 * @program: silin
 * @description: 文件相关
 * @author: siming.wang
 * @create: 2019-01-10 17:58
 **/
@Controller
public class FileController {

    private final String linuxFilePath = "/silin/memory/";
    private final String windowsFilePath = "D://silin//memory";

    @GetMapping(value = "/file")
    public String file() {
        return "/file/uploadFile";
    }

    @PostMapping(value = "/fileUpload")
    public String fileUpload(@RequestParam(value = "file") MultipartFile file, Model model, HttpServletRequest request) {
        if (file.isEmpty()) {
            System.out.println("文件为空空");
        }
        String fileName = file.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        String filePath = windowsFilePath; // 上传后的路径
        if(BaseUtils.isOSLinux()){
            filePath = linuxFilePath;
        }
        fileName = UUID.randomUUID() + suffixName; // 新文件名
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
        model.addAttribute("filename", filename);
        return "/file/uploadFile";
    }
}
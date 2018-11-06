package com.love.silin.web;

import com.love.silin.model.DiaryPostData;
import com.love.silin.service.DiaryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2018-11-05 17:54
 **/

@Controller
@Api(value = "Web - UserController", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class DiaryController {

    @Resource
    DiaryService diaryService;

    @RequestMapping("/diaryServlet")
    @ApiOperation(httpMethod = "POST", value = "test insertDiary")
    public String insertDiary(DiaryPostData diaryPostData, HttpServletRequest request) throws Exception{
        String user = (String) request.getSession().getAttribute("user");
        diaryPostData.setUser(user);
        diaryService.insertDiary(diaryPostData);
        return "/common/diarySuccess";
    }

    @RequestMapping("/diaryServletList")
    public String diaryServletList(){
        return "/show/diary/diaryList";
    }

    @RequestMapping("/showDiaryList")
    @ResponseBody
    @ApiOperation(httpMethod = "GET", value = "test showDiaryList")
    public Map<String,Object> showDiaryList(HttpServletRequest request) throws Exception{
        return diaryService.showDiaryList(request);
    }

    @RequestMapping("/showDiary")
    @ApiOperation(httpMethod = "GET", value = "查看日记")
    public void showDiaryList(HttpServletRequest request, HttpServletResponse response) throws Exception{
        diaryService.showDiary(request, response);
    }

}

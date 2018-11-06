package com.love.silin.service;

import com.love.silin.base.Constants;
import com.love.silin.dao.diary.BaseDiaryDO;
import com.love.silin.dao.diary.DiaryDAO;
import com.love.silin.dao.user.BaseUserDO;
import com.love.silin.dao.user.UserDAO;
import com.love.silin.model.DiaryPostData;
import com.love.silin.util.RSAUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2018-11-05 17:09
 **/
@Service
public class DiaryService {

    @Resource
    DiaryDAO diaryDAO;

    @Resource
    UserDAO userDAO;


    public void insertDiary(DiaryPostData diaryPostData) throws Exception{

        //1、查找对应的用户
        BaseUserDO baseUserDOc = new BaseUserDO();
        baseUserDOc.setUserName(diaryPostData.getUser());

        BaseUserDO baseUserDOFind = userDAO.selectByEO(baseUserDOc);

        if(diaryPostData.getIsPublic() == null){
            diaryPostData.setIsPublic("private");
        }

        BaseDiaryDO baseDiaryDO = new BaseDiaryDO();
        baseDiaryDO.setTitle(diaryPostData.getTitle());
        baseDiaryDO.setUserId(baseUserDOFind.getId());
        baseDiaryDO.setLoverId(baseUserDOFind.getLoverId());
        baseDiaryDO.setWeather(diaryPostData.getWeather());
        baseDiaryDO.setUserName(diaryPostData.getUser());
        baseDiaryDO.setMond(diaryPostData.getMood());
        baseDiaryDO.setPrivacy(diaryPostData.getIsPublic());
        baseDiaryDO.setCreateTime(new Date());
        baseDiaryDO.setYn(Constants.YN.YES);
        StringBuilder sb  = new StringBuilder();
        sb.append("## 日记人 ： "+ diaryPostData.getUser());
        sb.append("<br>");
        sb.append("## 日记时间 ： "+ baseDiaryDO.getCreateTime());
        sb.append("<br>");
        sb.append("## 天气 ： "+ diaryPostData.getWeather());
        sb.append("<br>");
        sb.append("## 心情 ： "+ diaryPostData.getMood());
        sb.append("<br>");
        sb.append(diaryPostData.getDiary());

        String encodedData = RSAUtils.publicEncrypt(sb.toString(), RSAUtils.getPublicKey(Constants.RSA_ENCRYPT.PUBLIC_KEY));

        baseDiaryDO.setContent(encodedData);
        diaryDAO.insert(baseDiaryDO);

    }


    public Map<String,Object> showDiaryList(HttpServletRequest request)
            throws ServletException, IOException {

        Map<String,Object> retMap = new HashMap<>();

        Long total = Long.valueOf(0);

        List<Map<String,Object>> rows = new ArrayList<>();


        String userName = (String)request.getSession().getAttribute("user");

        BaseUserDO baseUserDO = new BaseUserDO();
        baseUserDO.setUserName(userName);

        BaseUserDO baseUserDOFind = userDAO.selectByEO(baseUserDO);


        BaseDiaryDO baseDiaryDOCondition = new BaseDiaryDO();
        baseDiaryDOCondition.setLoverId(baseUserDOFind.getLoverId());
        baseDiaryDOCondition.setPrivacy("public");

        List<BaseDiaryDO> baseDiaryDOS = diaryDAO.selectListByEO(baseDiaryDOCondition);

        baseDiaryDOCondition.setUserName(userName);
        baseDiaryDOCondition.setPrivacy("private");

        List<BaseDiaryDO> baseDiaryDOS1 = diaryDAO.selectListByEO(baseDiaryDOCondition);

        baseDiaryDOS.addAll(baseDiaryDOS1);

        for(BaseDiaryDO baseDiaryDO : baseDiaryDOS){
            Map<String, Object> map = new HashMap<>();
            map.put("name", baseDiaryDO.getTitle());
            map.put("dateTime", baseDiaryDO.getCreateTime().toString());
            map.put("author", baseDiaryDO.getUserName());
            map.put("permission", changePrivacy(baseDiaryDO.getPrivacy()));
            map.put("originName", baseDiaryDO.getId());
            total += 1;
            rows.add(map);
        }

        Collections.sort(rows, new Comparator<Map<String, Object>>() {
            @Override
            public int compare(Map<String, Object> o1, Map<String, Object> o2) {
                String date1 = (String)o1.get("dateTime");
                String date2 = (String)o2.get("dateTime");
                return date2.compareTo(date1);
            }
        });


        retMap.put("rows", rows);
        retMap.put("total", total);

        return retMap;
    }

    /*查看日记
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void showDiary(HttpServletRequest request, HttpServletResponse response)
            throws Exception{

        String fileId = request.getParameter("fileName");

        BaseDiaryDO baseDiaryDOCondition = new BaseDiaryDO();
        baseDiaryDOCondition.setId(Integer.valueOf(fileId));

        List<BaseDiaryDO> baseDiaryDOS = diaryDAO.selectListByEO(baseDiaryDOCondition);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();

        String content = baseDiaryDOS.get(0).getContent();

        String decodedData = RSAUtils.privateDecrypt(content, RSAUtils.getPrivateKey(Constants.RSA_ENCRYPT.PRIVATE_KEY));
        for(char c : decodedData.toCharArray()){
            if(c == ' '){
                out.append("&nbsp");
            }else{
                out.append(c);
            }
        }
    }


    private String changePrivacy(String permission){

        if("public".equals(permission)){
            return "公开";
        }else if("private".equals(permission)){
            return "秘密";
        }
        return "无";
    }
}

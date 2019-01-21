<%--
  Created by IntelliJ IDEA.
  User: wangsiming
  Date: 18/2/3
  Time: 上午9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<html>
<head>
    <title>💗${sessionScope.user}的日记本💗</title>

</head>
<body style="background-image: url(/resources/img/back3.png)">

<%--<embed src="/resources/music/2.mp3" loop="11" autostar="true" hidden="true"/>--%>
<%
    String datetime = new SimpleDateFormat("yyyy-MM-dd")
            .format(Calendar.getInstance()
                    .getTime()); //获取系统时间
    request.setAttribute("datetime", datetime);
%>
<div id="div" style="margin-left:5%;margin-top:0%;width:100%; height:100%; border:0px solid #000;">

    <span style="color:midnightblue;font-weight:bolder;font-size:15px;font-weight:900">
        亲爱的${sessionScope.user}:
        <br>
        &nbsp;&nbsp;欢迎来到你的专属日记本空间!(在这里，您可以尽情吐槽您的另一半－－思思先生)
        <br>
        Our goal is to solve all the dissatisfaction!
        <br>
        你还可以浏览或编辑以前日记～<a href="/diaryServletList">点击传送门</a>
        &nbsp;
        &nbsp;
         <a href="/firstServlet?firstPassword=5201314">
            <span style="color:black;font-weight:bolder;">返回首页</span></a>

    </span>
    <br>
    <form action="/diaryServlet" method="post">
        <span style="color:midnightblue;font-weight:bolder;font-size:15px;font-weight:900">

        天气 : <select name="weather" id="idWeather">
                <option value="sun">阳光</option>
                <option value="cloudy">多云</option>
                <option value="rain">雨</option>
                <option value="snow">雪</option>
            </select>
        心情 : <select name="mood" id="idMood">
                <option value="happy">开心</option>
                <option value="anger">愤怒</option>
                <option value="sad">哀伤</option>
                <option value="miss">思念</option>
            </select>
        公开给另一半：<input type="checkbox" name="isPublic" value="public">

        日期 : <input style="width: 7%" name="datetime" value="${requestScope.datetime}" readonly="true">

            日记人 : <input style="width: 5%" name="user" value="${sessionScope.user}" readonly="true">
        <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;title:
            <input type="text" name="title" value="My-Diary">
        <br>
        </span>
        <textarea id="txtDiary" name="diary" style="color:blue;font-weight:bolder;font-size:14px;font-weight:400"
                  name="diaryString" cols="55" rows="25">
        今天我....
        </textarea>
        <input type="submit" value="提交日记！">

    </form>


</div>

<script type="text/javascript">

    if (${sessionScope.user == null}) {
        alert("请重新登陆 baby~~")
        window.location.href = "/firstServlet?firstPassword=5201314";
    }

</script>
</body>

</html>

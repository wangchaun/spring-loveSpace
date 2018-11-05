<%--
  Created by IntelliJ IDEA.
  User: wangsiming
  Date: 18/2/10
  Time: 下午1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>思淋的秘密空间</title>
</head>
<body background="/resources/img/back4.jpeg">
<div id="div" style="margin-left:40%;margin-top:10%;width:30%; height:30%; border:0px solid #000;">
    <span style="color:red;font-weight:bolder;font-size:25px">联系开发人员获取访问密码!
    <br>
    方可访问思淋的秘密空间！
    </span>
    <br>
    <br>

    <form action="/firstServlet" method="post">

        访问密码：<input type="text" name="firstPassword">
        <input type="submit" value="开启访问！">
    </form>

</div>
</body>
</html>

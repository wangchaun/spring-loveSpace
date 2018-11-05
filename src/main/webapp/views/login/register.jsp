<%--
  Created by IntelliJ IDEA.
  User: wangsiming
  Date: 18/2/10
  Time: 上午11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>欢迎注册！</title>

</head>
<body style="background-image: url(/resources/img/back.jpeg)">
<div id="div" style="margin-left:40%;margin-top:10%;width:30%; height:30%; border:0px solid #000;">
    <span style="color:palevioletred;font-weight:bolder;font-size:25px">请填写以下信息注册：</span>
    <br>
    <a href="/views/login/login.jsp">
        <span style="color:palevioletred;font-weight:bolder;font-size:10px">已有账号？返回登录</span></a>

    <br>
    <span style="color:red;font-weight:bolder;font-size:15px">
        <c:if test="${!empty requestScope.errorMessage}">${requestScope.errorMessage}
        <br>
        请重新输入：
        </c:if>
    </span>



    <form action="/registerServlet" method="post">
        <table align="left" cellspacing="10" cellpadding="0">
            <tr>
                <th> 您的账号：</th>
                <td><input type="text" name="name" value="${name}"></td>
            </tr>
            <tr>
                <th> 您的密码：</th>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <th> 请再次输入密码：</th>
                <td><input type="password" name="passwordConfirm"></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="填好信息注册！">
                </td>
            </tr>
        </table>

    </form>

</div>


</body>
</html>

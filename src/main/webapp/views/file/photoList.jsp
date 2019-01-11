<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form id="mainform" action="/fileUpload" method="post" enctype="multipart/form-data">
    <label>回忆墙</label>
    <br>
    <a href="/firstServlet?firstPassword=5201314"><span style="color:black;font-weight:bolder;">返回首页</span></a>

    <img src="${file }"/>
</form>
</body>

</html>


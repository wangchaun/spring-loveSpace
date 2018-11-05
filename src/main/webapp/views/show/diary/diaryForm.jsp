<%--
  Created by IntelliJ IDEA.
  User: wangsiming
  Date: 18/2/13
  Time: 下午1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/baseui.jsp"%>
<html>
<head>
</head>
<body>
<form id="saveForm" action="/handleDiaryServlet?method=saveDiary" method="post">
 <input type="hidden" id="txtFileName" name="fileName" value="${fileName}">
<textarea ${read} name="diary" id="txtDiary" style="width: 350px;height: 450px">
${diary}
</textarea>
</form>
</body>
</html>

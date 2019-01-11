<%--
  Created by IntelliJ IDEA.
  User: wangsiming
  Date: 18/2/12
  Time: 上午9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<head>
<link rel="stylesheet" type="text/css" href="/resources/easyui/css/easyui.css">
<link rel="stylesheet" type="text/css" href="/resources/easyui/css/icon.css">
<link rel="stylesheet" type="text/css" href="/resources/easyui/css/messager.css">
<%--<link rel="stylesheet" type="text/css" href="/resources/css/style.css">--%>

<script type="text/javascript" src="/resources/easyui/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/photo.js"></script>
<script type="text/javascript" src="/resources/js/vegas.min.js"></script>
<script type="text/javascript" src="/resources/easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/resources/easyui/js/jquery.messager.js"></script>
<script type="text/javascript" src="/resources/easyui/js/jquery.dialog.js"></script>
<script language="javascript" type="text/javascript" src="/resources/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
<script>
    function loadMsg(){
        keyControlFlag = true;
        $.messager.progress({
            title:'提示信息',
            msg:'正在处理，请稍后……'
        });
        //load();
    }
    function afterError()
    {
    }

    function showInfo(msg, level)
    {
        if (level == 'error')
        {
            $.messager.alert('错误提醒',msg, 'error', function(){ afterError() });
        }
        else
        {
            $.messager.alert('淋宝',msg,'info');
        }
    }

</script>

</body>
</html>

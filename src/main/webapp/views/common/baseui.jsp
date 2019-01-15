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
<script type="text/javascript" src="/resources/js/jquery.form.js"></script>
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
            msg:'正在处理，请稍后……',
            top:80
        });
        //load();
    }
    function afterError()
    {
    }
    var options = {
        dataType:'json',
        // 处理之后的处理
        success:  showResponse,
//        complete:  showResponse,
        error:  showResponse
    };
    function showResponse(responseText, statusText, xhr, $form) {
        console.log(responseText);
        disLoad();
//        var st = responseText.responseText;
        if (responseText.result == "success")
        {
            showInfo(responseText.message, "success");
            debugger;
            $("#dlg").dialog().panel('close');

        }
        else
        {
            showInfo(responseText.message, "error");
        }
    }
    function strToObj(json){
        return eval("("+json+")");
    }

    //取消加载层
    function disLoad() {
        /*  $(".datagrid-mask").remove();
         $(".datagrid-mask-msg").remove();   */
        $.messager.progress('close');
        keyControlFlag = false;
    }

    function showInfo(msgs, level)
    {
        if (level == 'error')
        {
//            $.messager.alert({
//            title:'错误提醒',
//            msg:msgs,
//            icon: 'error'
//            });
            $.messager.alert("错误提醒", msgs, "error");
        }
        else
        {
            $.messager.alert("提示", msgs, "info");
//            $.messager.alert({
//                title:'提示',
//                msg:msgs,
//                icon: 'info'
//            });
        }
    }


</script>

</body>
</html>

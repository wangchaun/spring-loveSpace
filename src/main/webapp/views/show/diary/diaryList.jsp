<%--
  Created by IntelliJ IDEA.
  User: wangsiming
  Date: 18/2/11
  Time: 下午5:41
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../common/baseui.jsp"%>
<html>
<head>

</head>
<body background="/resources/img/diaryback1.jpg">

    <div id="div" style="text-align:center;display: block; margin-left:10%;margin-top:0%;width:80%; height:100%; border:0px solid #000;">
        <div data-options="region: 'north', split: true, title: ''" style="height: 80px;">
            <form class="formTable" id="formSearch" action="">
                <div style="background-color:#F5F5F5" >
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" id="btnSearch" plain="true" onclick="cx()">
                        查询
                    </a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="downDiary()">
                        下载日记
                    </a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editDiary()">
                        在线编辑日记
                    </a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="showDiary()">
                        查看日记
                    </a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-lock" plain="true" onclick="lockPermission()">
                        更改日记权限
                    </a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="deleDiary()">
                        删除日记
                    </a>
                    <a style="float:right" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-filter" id="btnSetFilter" plain="true" onclick="filter()">
                        过滤
                    </a>
                </div>
                查询条件：
                <br>
                <table border="0" cellspacing="0" class="table-form" cellpadding="2" style="width:100%">
                    <tr>
                        <th style="width: 8%">
                            开始时间
                        </th>
                        <td style="width:12%">
                            <input type="text" name="createTimeFrom" id="txtSearchCreateTimeFrom" class="Wdate easyui-validatebox textbox"
                                   onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"/>
                        </td>
                        <th style="width: 8%">
                            结束时间
                        </th>
                        <td style="width:12%">
                            <input type="text" name="createTimeTo" id="txtSearchCreateTimeTo" class="Wdate easyui-validatebox textbox"
                                   onFocus="WdatePicker({startDate:'%y-%M-01 23:59:59',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"/>
                        </td>
                        <th style="width: 8%">日记人</th>
                        <td style="width:12%">
                            <input type="text" name="author" class="text"/>
                        </td>
                        <th style="width: 8%">日记权限</th>
                        <td style="width:12%">
                            <select name="perimission">
                                <option value="public">公开的</option>
                                <option value="private">隐私的</option>
                            </select>
                        </td>

                    </tr>
                </table>
            </form>
        </div>
        <span style="text-align:center;display: block; color:brown;font-weight:bolder;font-size:25px">${sessionScope.user}的日记列表</span>

        <br>
        <table id="dg" class="easyui-datagrid"
        data-options="
        checkOnSelect:true,singleSelect:true,fitColumns:true,rownumbers:true,url:'/showDiaryList',method:'get'">
            <thead>
                <tr>
                    <th data-options="checkbox:true,field:'originName',width:160,align:'center'"></th>
                    <th data-options="field:'name',width:160,align:'center'">日记名称</th>
                    <th data-options="field:'dateTime',width:160,align:'center'">日记时间</th>
                    <th data-options="field:'author',width:160,align:'center'">日记作者</th>
                    <th data-options="field:'permission',width:160,align:'center'">日记权限</th>
                </tr>
            </thead>
        </table>



        <a href="/views/show/diary/diary.jsp">
            <span style="color:rebeccapurple;font-weight:bolder;font-size:15px">返回继续提交日记</span></a>
        <br>
        <a href="/firstServlet?firstPassword=5201314"><span style="color:rebeccapurple;font-weight:bolder;font-size:15px">返回首页</span></a>
        <br>
        <a href="/views/show/loading.jsp">
            <span style="color:rebeccapurple;font-weight:bolder;font-size:10px">返回旧版主页</span></a>
        <br>
    </div>
<div id="dlg"></div>

<script type="text/javascript">


    //创建查询对象并查询
    function cx(){
        $("#dg").datagrid('load');
    }

    $('#dg').datagrid({
        rowStyler:function (index,row){
            if ((index % 2)==0){
                return 'background-color:#E0F8FF;color:#000000;font-weight:bold;';
            }
            else{
                return 'background-color:#FFFBFD;color:#000000;font-weight:bold;';
            }



        },

    });

    function editDiary() {
        console.log("-----get in----");
        // 如果没有选中行，则报错
        // 获取所有选中的行
        var rows = $("#dg").datagrid("getSelections");

        console.log(rows);
        if(rows==null || rows.length<=0) {
            alert('没有选中要编辑的日记！');
            return;
        }
        var fileName = rows[0].originName;


        d1=$("#dlg").dialog({
            title: rows[0].name,
            width: 350,
            height: 400,
            href:'/handleDiaryServlet?method=editDiary&fileName='+fileName,
            maximizable:true,
            modal: true,
            autoCloseOnEsc: true,
            buttons:[
                {
                    text:'保存',
                    handler:function(){
                       save();
                       d1.panel('close');


                    }
                },
                {
                    text:'关闭',
                    handler:function(){
                        d1.panel('close');
                    }
                }]
        });
    }
    function save() {
        $.ajax({
            type: 'post',
            url: '/handleDiaryServlet?method=saveDiary',
            data: {diary:$('#txtDiary').val(),
            fileName:$('#txtFileName').val()},
            success : function(data) {
                console.log("---data : "+data);
                if (data.result == 'success'){
                    console.log("----result: " + data.message);
                    showInfo(data.message);
                }else{
                    console.log("----result: " + data.message);
                    // 提示错误信息
                    showInfo(data.message, "error");
                }
                cx();
            }
        });
    }

    function lockPermission() {
        console.log("-----get in----");
        // 如果没有选中行，则报错
        // 获取所有选中的行
        var rows = $("#dg").datagrid("getSelections");

        console.log(rows);
        if(rows==null || rows.length<=0) {
            alert('没有选中要改权限的日记！');
            return;
        }
        var fileName = rows[0].originName;
        var permission = rows[0].permission;
        if(permission == '公开'){
            permission = '设为隐私日记？';
        }else{
            permission = '设为公开日记？'
        }

        jQuery.messager.confirm('提示:',
            '确定将该日记'+permission, function(event){
                console.log("--- event : + " + event);
                if (event) {
                    $.ajax({
                        type: 'GET',
                        url: '/handleDiaryServlet?method=pubDiary',
                        data: {fileName:fileName},
                        success : function(data) {
                            console.log("---data : "+data);
                            if (data.result == 'success'){
                                console.log("----result: " + data.message);
                                showInfo(data.message);
                            }else{
                                console.log("----result: " + data.message);
                                // 提示错误信息
                                showInfo(data.message, "error");
                            }
                            cx();
                        }
                    });
                }
            });
    }

    function deleDiary() {
        console.log("-----get in----");
        // 如果没有选中行，则报错
        // 获取所有选中的行
        var rows = $("#dg").datagrid("getSelections");

        console.log(rows);
        if(rows==null || rows.length<=0) {
            alert('没有选中要删除的日记！');
            return;
        }
        var fileName = rows[0].originName;

        jQuery.messager.confirm('提示:',
            '确定要删除该美好回忆嘛？', function(event){
                console.log("--- event : + " + event);
                if (event) {
                    $.ajax({
                        type: 'GET',
                        url: '/handleDiaryServlet?method=deleteDiary',
                        data: {fileName:fileName},
                        success : function(data) {
                            console.log("---data : "+data);
                            if (data.result == 'success'){
                                console.log("----result: " + data.message);
                                showInfo(data.message);
                            }else{
                                console.log("----result: " + data.message);
                                // 提示错误信息
                                showInfo(data.message, "error");
                            }
                            cx();
                        }
                    });
                }
            });
    }

    function showDiary() {
        console.log("-----get in----");
        // 如果没有选中行，则报错
        // 获取所有选中的行
        var rows = $("#dg").datagrid("getSelections");

        console.log(rows);
        if(rows==null || rows.length<=0) {
            alert('没有选中要看的日记！');
            return;
        }
        var fileName = rows[0].originName;



        d=$("#dlg").dialog({
            title: rows[0].name,
            width: 350,
            height: 400,
            href:'/showDiary?fileName='+fileName,
            maximizable:true,
            modal: true,
            autoCloseOnEsc: true,
            buttons:[
                {
                    text:'关闭',
                    handler:function(){
                        d.panel('close');
                    }
                }]
        });



    }

</script>
</body>
</html>

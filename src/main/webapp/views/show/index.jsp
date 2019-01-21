<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@include file="../common/baseui.jsp"%>
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SILIN SPACE</title>
    <link rel="shortcut icon" href="https://www.bbai520.com/favicon.ico" />
    <link rel="bookmark" href="https://www.bbai520.com/favicon.ico" type="image/x-icon"　/>
    <!--[if lte IE 8]><script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="https://pics.bbai520.com/wp-content/themes/sweet/assets/css/main.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="https://pics.bbai520.com/wp-content/themes/sweet/assets/css/ie8.css" /><![endif]-->
    <link rel="stylesheet" href="https://pics.bbai520.com/wp-content/themes/sweet/style.css" type="text/css" media="screen" />
    <link rel="pingback" href="https://www.bbai520.com/xmlrpc.php" />
    <link rel="alternate" type="application/rss+xml" title="RSS 2.0 - 所有文章" href="https://www.bbai520.com/feed" />
    <link rel="alternate" type="application/rss+xml" title="RSS 2.0 - 所有评论" href="https://www.bbai520.com/comments/feed" />
    <link rel='dns-prefetch' href='//push.zhanzhang.baidu.com' />
    <link rel='dns-prefetch' href='//cdnjs.cloudflare.com' />
    <link rel='dns-prefetch' href='//dn-staticfile.qbox.me' />
    <link rel='dns-prefetch' href='//pics.bbai520.com' />
    <link rel='stylesheet' id='contact-form-7-css'  href='https://pics.bbai520.com/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=1529235813' type='text/css' media='all' />
    <link rel='stylesheet' id='vegas-css'  href='https://cdnjs.cloudflare.com/ajax/libs/vegas/2.2.0/vegas.min.css?ver=1529235813' type='text/css' media='all' />
    <link rel='stylesheet' id='wsocial-css'  href='https://pics.bbai520.com/wp-content/plugins/wechat-social-login/assets/css/social.css?ver=1529235813' type='text/css' media='all' />
    <%--<script type='text/javascript' src='//dn-staticfile.qbox.me/jquery/2.1.4/jquery.min.js?ver=1529235813'></script>--%>
    <%--<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/vegas/2.2.0/vegas.min.js?ver=1529235813'></script>--%>
    <%--<script type='text/javascript' src='https://pics.bbai520.com/wp-content/themes/sweet/assets/js/unsplash-background.js?ver=1529235813'></script>--%>
    <meta name="description" content="1314" />
    <meta name="keywords" content="520" />		<style type="text/css" id="wp-custom-css">
    .xh_social_box{
        text-align:center
    }		</style>

</head>
<body class="home blog landing">
<div id="page-wrapper">
    <!-- Header -->
    <header id="header" class="alt">
        <h1><a href="https://www.bbai520.com/"><img src="https://pics.bbai520.com/wp-content/uploads/2017/08/logo32.png" style="position: relative;width:21px;top:4px;right:1px;">思淋空间</a> by silin.wang</h1>
        <nav id="nav">
            <ul>
                <li id="menu-item-36228" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-36228"><a href="/firstServlet?firstPassword=5201314">首页</a></li>
                <li id="menu-item-397" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-397"><a href="/views/show/diary/diary.jsp">告白吧</a></li>
                <li id="menu-item-2625" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2625"><a href="/photoList">查看我们的回忆</a></li>
                <li id="menu-item-2734" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2734"><a onclick="uploadMemory()">上传回忆</a></li>
                <li id="menu-item-36638" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-36638"><a href="/diaryServletList">我们的故事</a></li>
                <li id="menu-item-2732" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-item-2732"><a href="https://www.bbai520.com/documentation">文档</a>
                    <ul class="sub-menu">
                        <li id="menu-item-402" class="menu-item menu-item-type-post_type menu-item-object-post menu-item-402"><a href="https://www.bbai520.com/65.html">制作指南</a></li>
                        <li id="menu-item-36731" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-36731"><a href="https://www.bbai520.com/faq">常见问题FAQ</a></li>
                        <li id="menu-item-36635" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-36635"><a href="https://www.bbai520.com/about">关于&#038;合作</a></li>
                    </ul>
                </li>
                <%--<li id="menu-item-36219" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-36219"><a href="https://www.bbai520.com/app">下载客户端</a></li>--%>
                <li id="menu-item-41678" class="menu-item menu-item-type-post_type menu-item-object-post menu-item-41678"><a href="/views/show/diary/diary.jsp">『你的故事，我想听』</a></li>
                <li>
                    <c:if test="${user eq nul}">
                        <a href="/views/login/login.jsp" class="button">登录</a>
                    </c:if>
                    <c:if test="${user != nul}">
                        欢迎${user}baby
                    </c:if>

                </li>	</ul>
        </nav>
    </header>
    <div id="dlg" class=""></div>
    <!-- Banner -->
    <section id="banner">
        <h2>田心沐木</h2>
        <p>爱你的人，永远爱你</p>
        <ul class="actions">
            <li> <c:if test="${user eq nul}">
                <a href="/views/login/login.jsp" class="button">登录</a>
            </c:if>
                <c:if test="${user != nul}">
                    欢迎${user}baby
                </c:if>
            </li>	<li><a href="/views/show/diary/diary.jsp" class="button">告白</a></li>
            <br>
            <div id="mobileShow" hidden="hidden">
                <li><a onclick="uploadMemory()">上传回忆</a></li>
                <br>
                <li><a href="/photoList">查看我们的回忆</a></li>
            </div>
        </ul>
    </section>

    <!-- Main -->
    <section id="main" class="container">

        <section class="box special">
            <header class="major">
                <!--
            <div class="search d4">
                <form  method="get" id="searchform" action="https://www.bbai520.com/">
                  <input type="text" name="s" placeholder="搜索从这里开始...">
                  <button type="submit"></button>
                </form>
            </div> -->

                <p>我以最真诚的创意和百分百的努力，为你打造出一个集创意、时尚、个性、温馨、惊喜，浪漫于一体的情感空间，<br />
                    你，注定是我今生倾心驻足的风景。</p>
            </header>

            <span class="image featured"><a href="https://img2018.cnblogs.com/blog/1427782/201901/1427782-20190110164940248-1891198163.png"><img src="/resources/img/wx.png"></a></span>
        </section>


    </section>

            <!-- Footer -->
    <footer id="footer">
        <ul class="icons">
            <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=741702321&site=qq&menu=yes" class="icon fa-qq"><span class="label">QQ</span></a></li>
            <li><a target="_blank" href="http://weibo.com/bcdon" class="icon fa-weibo"><span class="label">Weibo</span></a></li>
            <li><div id="wxImg" style="display:none;position:absolute;"><img src="https://pics.bbai520.com/wp-content/uploads/2017/10/gongzhong.png" width="150px" height="150px"></div><a href="javascript:void(0)" onMouseOut="hideImg()" onmouseover="showImg()" class="icon fa-weixin"><span class="label">Weixin</span></a></li>
            <li><a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=f54230108f6e9cc68e36dbce8deace72c5f6508a7a82452b99abab8d29599a72" class="icon fa-users"><span class="label">QQ群</span></a></li>
        </ul>
        <ul class="copyright">
            <li>&copy; 2017&mdash;2019 <a href="https://www.bbai520.com/">思淋驿站</a> All rights reserved</li><li>由 <a href="http://pixeL.net.cn">silin.wang</a> 提供技术支持.</li>

        </ul>
        <ul class="beian">
            <li><a target="_blank" href="http://www.miibeian.gov.cn/" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" title=""><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">沪ICP备15003379号-1</p></a></li><li><a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=52052202522438" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" title=""><img src="https://pics.bbai520.com/wp-content/uploads/2016/06/beian.png" style="width:auto;float:left;"><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">公网安备 52052202522438号</p></a></li>	</ul>
        <ul class="footerlink">
            <li><a href="http://www.baidu.com" title="" target="_blank" >百度一下</a></li>
        </ul>

    </footer>

</div>
<!-- 返回顶部 -->
<%--<div id="moquu_wxin" class="moquu_wxin"><a href="/about"><div class="moquu_wxinh"></div></a></div>--%>
<%--<div id="moquu_wshare" class="moquu_wshare"><a href="javascript:void(0)"><div class="moquu_wshareh"></div></a></div>--%>
<script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/backtop.js"></script>
<!-- 返回顶部结束 -->
<!-- Scripts -->
<%--<script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/jquery.min.js"></script>--%>
<%--<script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/jquery.dropotron.min.js"></script>--%>
<%--<script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/jquery.scrollgress.min.js"></script>--%>
<%--<script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/skel.min.js"></script>--%>
<%--<script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/util.js"></script>--%>
<!--[if lte IE 8]><!--<script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/ie/respond.min.js"></script>--><![endif]-->
<%--<script src="https://pics.bbai520.com/wp-content/themes/sweet/assets/js/main.js"></script>--%>
<!-- 微信二维码事件 -->
<script type="text/javascript">
    function  showImg(){document.getElementById("wxImg").style.display='block';}
    function hideImg(){document.getElementById("wxImg").style.display='none';}

    try{
        var str = navigator.userAgent;

        console.log("navigator.userAgent", str);
        if(str.indexOf("iPhone")!= -1
          || str.indexOf("Android")!= -1
            || str.indexOf("webOS")!= -1
            || str.indexOf("BlackBerry")!= -1){
            console.log("navigator.getin");
            document.getElementById("mobileShow").removeAttribute("hidden");
        }
    }catch(e){}


    //上传回忆
    function uploadMemory() {
        d=$("#dlg").dialog({
            title: '上传照片',
            width: 450,
            height: 150,
            href:'/file',
            maximizable:true,
            modal: true,
            top:120,
            autoCloseOnEsc: true,
            buttons:[{
                text:'上传',
                handler:function(){
                    // 页面form输入Check
                    if ($('#mainform').form('validate'))
                    {
                        loadMsg();
                        //在本页上处理，也就是ajax，如果是非false，则传统的form跳转。
                        $("#mainform").ajaxSubmit(options);
                        d.panel('close');
                    }
                }
            },{
                text:'取消',
                handler:function(){
                    d.panel('close');
                }
            }]
        });
    }

</script>
</body>
</html>
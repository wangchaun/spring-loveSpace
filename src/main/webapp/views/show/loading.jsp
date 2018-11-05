<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>


    <meta charset="UTF-8">

    <title>思淋空间</title>

    <style>
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline
        }

        article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
            display: block
        }

        body {
            line-height: 1
        }

        ol, ul {
            list-style: none
        }

        blockquote, q {
            quotes: none
        }

        blockquote:before, blockquote:after, q:before, q:after {
            content: '';
            content: none
        }

        table {
            border-collapse: collapse;
            border-spacing: 0
        }

    </style>

    <style>
        body {
        }

        img {
            display: block;

            margin: 0 auto;
        }

        canvas {
            display: block;

            margin: 0 auto;

            /* uncomment to test overlay */

            /*
            position: absolute;
            left: 0;
            opacity: .5;
            top: 0;
            */

        }
    </style>

    <style type="text/css">
        .spinnerLin1 {
            width: 60px;
            height: 60px;
            background-color: #00FFFF;
            background-image: url("/resources/img/lin1.jpg");

            margin: 100px auto;
            -webkit-animation: rotateplane 4.2s infinite ease-in-out;
            animation: rotateplane 4.2s infinite ease-in-out;
        }

        @-webkit-keyframes rotateplane {
            0% {
                -webkit-transform: perspective(120px)
            }
            50% {
                -webkit-transform: perspective(120px) rotateY(180deg)
            }
            100% {
                -webkit-transform: perspective(120px) rotateY(180deg) rotateX(180deg)
            }
        }

        @keyframes rotateplane {
            0% {
                transform: perspective(120px) rotateX(0deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg)
            }
            50% {
                transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg)
            }
            100% {
                transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
                -webkit-transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
            }
        }
        .spinnerLin2 {
            width: 60px;
            height: 60px;
            background-color: #00FFFF;
            background-image: url("/resources/img/lin2.jpg");

            margin: 100px auto;
            -webkit-animation: rotateplane 4.2s infinite ease-in-out;
            animation: rotateplane 4.2s infinite ease-in-out;
        }

        @-webkit-keyframes rotateplane {
            0% {
                -webkit-transform: perspective(120px)
            }
            50% {
                -webkit-transform: perspective(120px) rotateY(180deg)
            }
            100% {
                -webkit-transform: perspective(120px) rotateY(180deg) rotateX(180deg)
            }
        }

        @keyframes rotateplane {
            0% {
                transform: perspective(120px) rotateX(0deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg)
            }
            50% {
                transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg)
            }
            100% {
                transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
                -webkit-transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
            }
        }

        .spinnerSi2 {
            width: 60px;
            height: 60px;
            background-color: #00FFFF;
            background-image: url("/resources/img/si2.jpg");

            margin: 100px auto;
            -webkit-animation: rotateplane 4.2s infinite ease-in-out;
            animation: rotateplane 4.2s infinite ease-in-out;
        }

        @-webkit-keyframes rotateplane {
            0% {
                -webkit-transform: perspective(120px)
            }
            50% {
                -webkit-transform: perspective(120px) rotateY(180deg)
            }
            100% {
                -webkit-transform: perspective(120px) rotateY(180deg) rotateX(180deg)
            }
        }

        @keyframes rotateplane {
            0% {
                transform: perspective(120px) rotateX(0deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg)
            }
            50% {
                transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg)
            }
            100% {
                transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
                -webkit-transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
            }
        }
        .spinnerSi1 {
            width: 60px;
            height: 60px;
            background-color: #00FFFF;
            background-image: url("/resources/img/si1.jpg");

            margin: 100px auto;
            -webkit-animation: rotateplane 4.2s infinite ease-in-out;
            animation: rotateplane 4.2s infinite ease-in-out;
        }

        @-webkit-keyframes rotateplane {
            0% {
                -webkit-transform: perspective(120px)
            }
            50% {
                -webkit-transform: perspective(120px) rotateY(180deg)
            }
            100% {
                -webkit-transform: perspective(120px) rotateY(180deg) rotateX(180deg)
            }
        }

        @keyframes rotateplane {
            0% {
                transform: perspective(120px) rotateX(0deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg)
            }
            50% {
                transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg)
            }
            100% {
                transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
                -webkit-transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
            }
        }

        .spinner2 {
            margin: 100px auto;
            width: 50px;
            height: 60px;
            text-align: center;
            font-size: 10px;
        }

        .spinner2 > div {
            background-color: #FF00DE;
            height: 100%;
            width: 6px;
            display: inline-block;

            -webkit-animation: stretchdelay 1.2s infinite ease-in-out;
            animation: stretchdelay 1.2s infinite ease-in-out;
        }

        .spinner2 .rect2 {
            -webkit-animation-delay: -1.1s;
            animation-delay: -1.1s;
        }

        .spinner2 .rect3 {
            -webkit-animation-delay: -1.0s;
            animation-delay: -1.0s;
        }

        .spinner2 .rect4 {
            -webkit-animation-delay: -0.9s;
            animation-delay: -0.9s;
        }

        .spinner2 .rect5 {
            -webkit-animation-delay: -0.8s;
            animation-delay: -0.8s;
        }

        @-webkit-keyframes stretchdelay {
            0%, 40%, 100% {
                -webkit-transform: scaleY(0.4)
            }
            20% {
                -webkit-transform: scaleY(1.0)
            }
        }

        @keyframes stretchdelay {
            0%, 40%, 100% {
                transform: scaleY(0.4);
                -webkit-transform: scaleY(0.4);
            }
            20% {
                transform: scaleY(1.0);
                -webkit-transform: scaleY(1.0);
            }
        }

        .spinner3 {
            margin: 100px auto;
            width: 32px;
            height: 32px;
            position: relative;
        }

        .cube1, .cube2 {
            background-color: #00FFFF;
            width: 30px;
            height: 30px;
            position: absolute;
            top: 0;
            left: 0;

            -webkit-animation: cubemove 1.8s infinite ease-in-out;
            animation: cubemove 1.8s infinite ease-in-out;
        }

        .cube2 {
            -webkit-animation-delay: -0.9s;
            animation-delay: -0.9s;
        }

        @-webkit-keyframes cubemove {
            25% {
                -webkit-transform: translateX(42px) rotate(-90deg) scale(0.5)
            }
            50% {
                -webkit-transform: translateX(42px) translateY(42px) rotate(-180deg)
            }
            75% {
                -webkit-transform: translateX(0px) translateY(42px) rotate(-270deg) scale(0.5)
            }
            100% {
                -webkit-transform: rotate(-360deg)
            }
        }

        @keyframes cubemove {
            25% {
                transform: translateX(42px) rotate(-90deg) scale(0.5);
                -webkit-transform: translateX(42px) rotate(-90deg) scale(0.5);
            }
            50% {
                transform: translateX(42px) translateY(42px) rotate(-179deg);
                -webkit-transform: translateX(42px) translateY(42px) rotate(-179deg);
            }
            50.1% {
                transform: translateX(42px) translateY(42px) rotate(-180deg);
                -webkit-transform: translateX(42px) translateY(42px) rotate(-180deg);
            }
            75% {
                transform: translateX(0px) translateY(42px) rotate(-270deg) scale(0.5);
                -webkit-transform: translateX(0px) translateY(42px) rotate(-270deg) scale(0.5);
            }
            100% {
                transform: rotate(-360deg);
                -webkit-transform: rotate(-360deg);
            }
        }
    </style>

    <script src="/resources/js/prefixfree.min.js"></script>

</head>

<body background="/resources/img/back2.jpeg">

<!-- source image and inspiration from Ramiro Galan on Dribbble: http://dribbble.com/shots/674715-Sparkle-Light-Trail -->
<canvas id="c"></canvas>


<script src='/resources/js/jquery.js'></script>
<%--<embed src="/resources/music/1.mp3" loop="11" autostar="true" hidden="true"/>--%>
<script src="/resources/js/index.js"></script>

<div style="text-align:center;clear:both;width: 100%">
    <div class="spinnerLin1" style="margin-left:8%;float: left;width: 8%;height: 10%"></div>
    <div class="spinner2" style="margin-top: 15%;float: left;width: 5%">
        <div class="rect1"></div>
        <div class="rect2"></div>
        <div class="rect3"></div>
        <div class="rect4"></div>
        <div class="rect5"></div>
    </div>
    <div class="spinner3" style="margin-top: 15%;float: left;width: 5%">
        <div class="cube1"></div>
        <div class="cube2"></div>
    </div>
    <div class="spinnerSi1" style="margin-top: 25%;float: left;width: 8%;height: 10%"></div>
    <div style="text-align: center;display: block; margin-top: 0%;float: left;width: 30%">
        <span style="color:wheat;font-weight:bold;font-size:45px">淋 宝</span>
        <br><br><br>
        <span style="color:wheat;font-weight:bold;font-size:20px">静下心来先听首歌吧～</span>
        <br><br><br>
        <span style="color:blueviolet;font-weight:bold;font-size:50px">开心快乐!</span>
        <br><br><br><br><br><br><br><br>
        <a href="https://ai.bbai520.com/love.php?123&id=16009"><span style="color:cornflowerblue;font-weight:bolder;font-size:15px"><--点击进入我们的世界--></span></a>
        <br>
        <br>
        <a href="/views/show/photos.html"><span style="color:cornflowerblue;font-weight:bolder;font-size:15px"><--点击进入我们的相册--></span></a>
        <br>
        <br>
        <a href="/views/show/diary/diary.jsp"><span style="color:cornflowerblue;font-weight:bolder;font-size:15px"><--💗&nbsp;Love Diary/Story--></span></a>
    </div>
    <div class="spinnerLin2" style="margin-top: 25%;float: left;width: 8%;height: 10%"></div>
    <div class="spinner2" style="margin-top: 15%;float: left;width: 5%">
        <div class="rect1"></div>
        <div class="rect2"></div>
        <div class="rect3"></div>
        <div class="rect4"></div>
        <div class="rect5"></div>
    </div>
    <div class="spinner3" style="margin-top: 15%;float: left;width: 5%">
        <div class="cube1"></div>
        <div class="cube2"></div>
    </div>
    <div class="spinnerSi2" style="float: left;width: 8%;height: 10%"></div>
</div>
</body>

</html>
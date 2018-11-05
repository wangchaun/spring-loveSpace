
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

    <title>💗我们在一起一辈子💗</title>
    <meta name="keywords" content="表白驿站,表白网页在线制作,浪漫表白网页,表白程序,在线生成" />
    <meta name="description" content="" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        @font-face {
            font-family: digit;
            src: url("520/love04/digital-7_mono.ttf"/*tpa=./digital-7_mono.ttf*/) format("truetype");
        }
    </style>
    <link href="520/love04/css/default.css" tppabs="./css/default.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="520/love04/js/jquery.js" tppabs="./js/jquery.js"></script>
    <script type="text/javascript" src="520/love04/js/garden.js" tppabs="./js/garden.js"></script>
    <script type="text/javascript" src="520/love04/js/functions.js" tppabs="./js/functions.js"></script>
<body>
<div id="mainDiv">
    <div id="content">
        <div id="code">
            <span class="comments">亲爱的淋淋：</span><br />
            <span class="space"><span class="comments">一切源于缘分。可能我骨子里的温柔善良被同样善良温柔的你从我自我介绍的字里行间发现了，是啊，喜欢小狗的人应该都很善良吧。正如我第一眼见到现实的你，那一刻，我的心被拨动了，像是久封的房间，洒进了一缕阳光，不，是洒满了我整个心灵。我，喜欢上眼前这个女孩了。</span></span><br />
            <span class="space"/><span class="comments">“渗透法”开始起作用了，慢慢的，你也开始默认你是我女票了，开心。</span><br />
            <span class="space"/><span class="comments">热恋的感觉真好啊，甜甜的，暖暖的，像我这样害怕孤独的人，谢谢你的陪伴。</span><br />
            <span class="space"/><span class="comments">我们会在一起多久？一辈子。余生很长，请多多指教。</span><br />
            <span class="space"/><span class="comments">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 永远爱你的思思</span><br />
        </div>
        <div id="loveHeart">
            <canvas id="garden"></canvas>
            <div id="words">
                <div id="messages">
                    嘿,淋淋, 我们在一起已经
                    <div id="elapseClock"></div>
                </div>
                <div id="loveu">
                    遇见你，疼你，想你<br/>
                    <div class="signature">- 最爱你的 思思</div>

                </div>
            </div>
        </div>
        <div class="bg1">
            <div class="main">
                <footer style="line-height:20px">
                    <div id="copyright">
                        <div align="center">
                            <audio src="https://ai.bbai520.com/music/music01.mp3" preload controls autoplay loop>
                                Your browser does not support the audio element.
                            </audio></div>
                    </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var offsetX = $("#loveHeart").width() / 2;
        var offsetY = $("#loveHeart").height() / 2 - 55;
        var together = new Date();
        together.setFullYear(2017,11,30);
        together.setHours(20);
        together.setMinutes(0);
        together.setSeconds(0);
        together.setMilliseconds(0);

        if (!document.createElement('canvas').getContext) {
            var msg = document.createElement("div");
            msg.id = "errorMsg";
            msg.innerHTML = "提醒您：您的浏览器版本过旧^_^<br/>"+
                "请先升级您的浏览器，效果很炫哦~~";
            document.body.appendChild(msg);
            $("#code").css("display", "none")
            $("#copyright").css("position", "absolute");
            $("#copyright").css("bottom", "10px");
            document.execCommand("stop");
        } else {
            setTimeout(function () {
                adjustWordsPosition();
                startHeartAnimation();
            }, 5000);

            timeElapse(together);
            setInterval(function () {
                timeElapse(together);
            }, 500);

            adjustCodePosition();
            $("#code").typewriter();
        }
    </script>

</body>
</html>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>相册</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0
}

body {
	background-color: #e8e3da;
}

ul {
	list-style: none
}

#wrap {
	width: 980px;
	height: 500px;
}
/*#wrap {*/
	/*width: 652px;*/
	/*height: 812px;*/
/*}*/

#wrap li {
	position: absolute;
	left: 0;
	top: 0;
	transition: transform 1500ms ease-out;
	background-color: white;
}

.box {
	width: 100%;
	height: 100%;
	background-size: cover;
	transition: transform 1500ms ease-out;
}

.center {
	margin: auto;
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;

}
</style>

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">

    var photoList = new Array();
    //console.info("info");
    <c:forEach items="${photos}" var="item" varStatus="status" >
    photoList.push("${item}");
    </c:forEach>


$(function () {
	var collums = 5;//列
	var rows = 5;//行
	var wrap = $('#wrap');
	var w = wrap.width() / rows;
	var h = wrap.height() / collums;
//
//    var w = 652 / rows;
//    var h = 812/ collums;


	for (var r = 0; r < rows; r++) {
		for (var c = 0; c < collums; c++) {
            var index = parseInt(r * collums + c);
			$('<li><div class="box"></div></li>').width(w).height(h)
					.css({
						'left': w * c + 'px',
						'top': h * r + 'px',
						'transform': 'scale(0.9) rotate(' + (Math.random() * 40 - 20) + 'deg) ' +
						'translateX(' + (30*c-60) + 'px)' +
						'translateY(' + (30*r-60) + 'px)'
					})
					.find('.box')
					.css({
						'background-image': 'url('+photoList[index]+')',
                        'background-size': 'contain',
						'transform': 'scale(0.9)'
					})
					.end()
					.appendTo(wrap)
		}
	}

	var change = true;
	wrap.find('li').on('click', function () {
		if (change == true) {
			var bgImg = $(this).find('div').css('background-image');
			var widthImg = bgImg.naturalWidth;
			var heightImg = bgImg.naturalHeight;

			var bgLeft = 0;
			var bgTop = 0;
			$('#wrap li').each(function (index) {
				var $this=$(this);
				$(this).delay(40*index).animate({"opacity":0},200, function () {
					$this.css({
						'transform': ' rotate(0deg) ' +
						'translateX(0)' +
						'translateY(0)'
					});
					$this.width(w);
					$this.height(h);
					$this.find('div').css({
						'background-image': bgImg,
						'background-size': 'auto',
						'backgroundPositionX': -bgLeft,
						'backgroundPositionY': -bgTop,
						'transform': 'scale(1)'
					});
					bgLeft += w;
					if (bgLeft >= wrap.width()) {
						bgTop += h;
						bgLeft = 0;
					}
					$this.animate({"opacity":1},300);
				})

			});
			change = false;

		} else if (change == false) {

			$('#wrap li').each(function (index) {
				var c=index %collums;
				var r=parseInt(index/collums);
				var $this=$(this);
				console.log("false:"+index);
				$(this).delay(40*index).animate({"opacity":0},200, function () {
					$this.css({
						'transform': 'rotate(' + (Math.random() * 40 - 20) + 'deg)' +
						'translateX(' + (30*c-60) + 'px)' +
						'translateY(' + (30*r-60) + 'px)'
					});
					$this.find('div').css({
						'background-image': 'url('+photoList[index]+')',
						'background-size': 'contain',
						'transform': 'scale(0.9)',
                        'backgroundPositionX': 0,
                        'backgroundPositionY': 0
					});
					$this.animate({"opacity":1},200);
				})

			});
			change = true;
		}
	})
})
</script>
</head>
<body>
<a href="/firstServlet?firstPassword=5201314"><span style="color:black;font-weight:bolder;">返回首页</span></a>
<span style="color:black;font-weight:bolder;">幸福回忆</span>
<ul id="wrap" class="center"></ul>

</body>
</html>
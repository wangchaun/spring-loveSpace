<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<style type="text/css">
    .spinner {
        width: 60px;
        height: 60px;
        background-color: #67CF22;

        margin: 100px auto;
        -webkit-animation: rotateplane 1.2s infinite ease-in-out;
        animation: rotateplane 1.2s infinite ease-in-out;
    }

    @-webkit-keyframes rotateplane {
        0% { -webkit-transform: perspective(120px) }
        50% { -webkit-transform: perspective(120px) rotateY(180deg) }
        100% { -webkit-transform: perspective(120px) rotateY(180deg)  rotateX(180deg) }
    }

    @keyframes rotateplane {
        0% {
            transform: perspective(120px) rotateX(0deg) rotateY(0deg);
            -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg)
        } 50% {
              transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
              -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg)
          } 100% {
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
        background-color: #67CF22;
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
        0%, 40%, 100% { -webkit-transform: scaleY(0.4) }
        20% { -webkit-transform: scaleY(1.0) }
    }

    @keyframes stretchdelay {
        0%, 40%, 100% {
            transform: scaleY(0.4);
            -webkit-transform: scaleY(0.4);
        }  20% {
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
        background-color: #67CF22;
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
        25% { -webkit-transform: translateX(42px) rotate(-90deg) scale(0.5) }
        50% { -webkit-transform: translateX(42px) translateY(42px) rotate(-180deg) }
        75% { -webkit-transform: translateX(0px) translateY(42px) rotate(-270deg) scale(0.5) }
        100% { -webkit-transform: rotate(-360deg) }
    }

    @keyframes cubemove {
        25% {
            transform: translateX(42px) rotate(-90deg) scale(0.5);
            -webkit-transform: translateX(42px) rotate(-90deg) scale(0.5);
        } 50% {
              transform: translateX(42px) translateY(42px) rotate(-179deg);
              -webkit-transform: translateX(42px) translateY(42px) rotate(-179deg);
          } 50.1% {
                transform: translateX(42px) translateY(42px) rotate(-180deg);
                -webkit-transform: translateX(42px) translateY(42px) rotate(-180deg);
            } 75% {
                  transform: translateX(0px) translateY(42px) rotate(-270deg) scale(0.5);
                  -webkit-transform: translateX(0px) translateY(42px) rotate(-270deg) scale(0.5);
              } 100% {
                    transform: rotate(-360deg);
                    -webkit-transform: rotate(-360deg);
                }
    }
</style>
</head>
<body>
<div class="spinner"></div>



<div class="spinner2">
    <div class="rect1"></div>
    <div class="rect2"></div>
    <div class="rect3"></div>
    <div class="rect4"></div>
    <div class="rect5"></div>
</div>


<div class="spinner3">
    <div class="cube1"></div>
    <div class="cube2"></div>
</div>


</body>
</html>

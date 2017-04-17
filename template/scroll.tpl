<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
        body { font-family:"宋体";}
        .container { width:700px;height:500px;padding:50px;margin:0 auto;position:relative;font-size:30px;}
        .scrollBox { border:1px solid #000;width:600px;height:400px;margin:0 auto;position:relative;overflow: hidden;}
        .scrollBox ul { position:absolute;left:0;top:0;height:390px;}
        .scrollBox ul li { width:590px;height:390px;margin:4px;background:#d2d3dd;float:left;}


        .container .arr { width:50px;height:50px;line-height:50px;text-align:center;font-size:20px;font-weight:bold;
        background:#deb39a;color:#fff;position:absolute;top:225px;}
        .container .leftBtn { left:0;}
        .container .rightBtn { right:0;}
    </style>
</head>
<body>

<div class="wrap">
    <div class="container">
        <div class="scrollBox">
            <ul>
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
            </ul>
        </div>
        <div class="leftBtn arr">&lt;</div>
        <div class="rightBtn arr">&gt;</div>
    </div>
</div>
{literal}
    <script>
        $(function(){
          /*  function scroll(){
                var boxWidth = $(".scrollBox").width();
                var scrollUl = $(".scrollBox ul");
                var liCount = $(".scrollBox>ul>li").length;
                var leftBtn = $(".container .leftBtn");
                var rightBtn = $(".container .rightBtn");
                var cur = 1;
                scrollUl.width(boxWidth * liCount);

                setInterval(function(){
                    scrollUl.animate({left:(-boxWidth) * cur});
                    cur ++;
                    if(cur >= liCount){
                        cur = 0
                    }
                }, 1000);
            }
            scroll();*/
            var scrollp = {
                boxWidth    : $(".scrollBox").width(),//容器宽度
                scrollUl    : $(".scrollBox ul"),//盒
                liCount     : $(".scrollBox>ul>li").length,//轮播图片数
                leftBtn     : $(".container .leftBtn"),//左按钮
                rightBtn    : $(".container .rightBtn"),//右按钮
                cur         : 1,//开始图
                init        : function () {
                    scrollp.scrollUl.width(scrollp.boxWidth * scrollp.liCount);
                    scrollp.leftBtn.on("click", scrollp.clickLeft);
                    scrollp.leftBtn.on("click", scrollp.clickRight)
                },
                clickLeft   : function (){
                    if(scrollp.cur == 1){
                        layer.msg("不能再向前翻了哦");
                        return;
                    }
                    scrollp.scrollUl.animate({left:(scrollp.boxWidth) * scrollp.cur});
                    scrollp.cur --;
                },
                clickRight  : function() {
                    if(scrollp.cur == scrollp.liCount){
                        layer.msg("不能再向后翻了哦");
                        return;
                    }
                    scrollp.scrollUl.animate({left:(-scrollp.boxWidth) * scrollp.cur});
                    scrollp.cur ++;
                }
            }
            scrollp.init();
        })
    </script>
{/literal}
</body>
</html>
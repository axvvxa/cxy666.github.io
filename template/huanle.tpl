<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
        #showArea { width:300px;height:90px;background:#f2f2f2;font-size:14px;margin:100px auto;position:relative;overflow:hidden;}
        #showArea .nameList { position:absolute;height:90px;line-height:30px;left:0;top:0;}
        #showArea .nameList .win_info { width:300px;height:90px;float:left;}
    </style>
</head>
<div id="showArea">
    <div class="nameList"></div>
</div>
<body>
{literal}
    <script>
        $(function(){
            var jsonObj = {
                "last_win":2,       //上期开奖号码
                "open":1,
                "user_money":228,   //用户当前金币
                "win_info":[        //获奖名单
                    {
                        "uin":001,
                        "name":"我是昵称我的昵称有12个字", //获奖用户昵称
                        "num":12000
                    },
                    {
                        "uin":002,
                        "name":"我是昵称我的昵称",
                        "num":22000
                    },
                    {
                        "uin":003,
                        "name":"我是昵称",
                        "num":32000
                    },
                    {
                        "uin":004,
                        "name":"我是昵称我的昵称有12个字个字个字",
                        "num":42000
                    }],
                "user_bet":["100000","2000","300000"], //用户自己下注的金币
                "total_bet":["100000000","200000","3000"]//总的下注金币
            };

            /*1.昵称长度超出8个字需要截取，保留前3个字和后3个字中间用*号代替。*/
            function showName(name){
                name = name.replace(/^(\S{3})(\S{3,})(\S{3})$/,"$1***$3");
                return name;
            }

            /*2.总下注和用户自己下注数超过10000需要用“1万”字代替，超过100000000用“亿”代替。*/
            function showNum(num) {
                if(num > 99999999){
                    return (num/100000000) + '亿';
                } else if (num > 9999) {
                    return (num/10000) + '万';
                } else {
                    return num;
                }
            }

            /*3.获奖人有4个，需要做轮播显示，每秒显示一条循环轮播。*/
            var winLen = jsonObj.win_info.length;
            function init(){//轮播布局
                var html = '';
                $.each(jsonObj.win_info, function(){
                    html += '<div class="win_info">' +
                        '<p class="uin">编号：<span>'+this.uin+'</span></p>' +
                        '<p class="name">名字：<span>'+showName(this.name)+'</span></p>' +
                        '<p class="num">号码：<span>'+showNum(this.num)+'</span></p>' +
                        '</div>';
                });
                $(".nameList").append(html);
                $(".nameList .win_info").eq(0).clone().appendTo(".nameList");
                $(".nameList").width(300*(winLen+1));
            }
            init();
            var cur = 1;
            setInterval(function(){
                if(cur > winLen){
                    $(".nameList").css({left: 0});
                    cur = 1;
                }
                $(".nameList").stop(1,0).animate({"left":-300*cur+'px'}, 400);
                cur ++;
            }, 1000);
        });
    </script>
{/literal}
</body>
</html>
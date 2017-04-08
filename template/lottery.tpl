<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
        .wrap { margin:0 auto;max-width:640px;background:url(img/lotteryBg.jpg) repeat;}
        .turntableOuter{ position:relative;}
        .turntable-bg{ overflow: hidden;padding: 0 15.5% 0 16.3%;position: absolute;top: 7%;left: 0;right: 0;z-index: 1;text-align: center;}
        #btn-lottery{ margin: auto;position: absolute;top: 29.5%;left: 0;right: 0;width: 22%;max-width:168px;z-index: 2;}

        .layStyle { text-align:center;font-size:20px;font-family:'Microsoft Yahei';line-height:40px;}
    </style>
    <script src="../js/awardRotate.js"></script>
</head>
<body>

<div class="turntableOuter wrap">
    <img src="//img2.csmall.com/tenant/29/webPublicity/article/image/2016/07/20160715184509_21881.png" alt="转盘外的背景"/>
    <a href="javascript:;" id="btn-lottery">
        <img src="//img2.csmall.com/tenant/29/webPublicity/article/image/2016/07/20160715161911_69567.png" alt="抽奖按钮"/>
    </a>
    <div class="turntable-bg">
        <img id="turntable" src="//img2.csmall.com/tenant/29/webPublicity/article/image/2016/07/20160715164442_54077.png" alt="转盘背景"/>
    </div>
</div>
{literal}
<script>
    $(function(){
        var rotate = false;//转动状态
        /**
         * 奖项映射
         * @type {Object}
         */
        var prizeMap = {
            '1': {'angle': 324, 'prize': '一等奖：足金999金条'},
            '2': {'angle': 252, 'prize': '二等奖：豪华碧玺两件套'},
            '3': {'angle': 180, 'prize': '三等奖：蝶倚霓裳 水晶吊坠'},
            '4': {'angle': 108, 'prize': '四等奖：黄金福袋吊坠'},
            '5': {'angle': 36, 'prize': '五等奖：50元优惠券'}
        };

        /**
         * 点击抽奖
         */
        $('#btn-lottery').click(function(){
//            if(rotate) return;//限制只能玩一次
            rotate = true;
            var loading;
            $.ajax({
                type: 'post',
                url: 'server/lottery.server.php',
                data: {mode:'lottery'},
                dataType: 'json',
                beforeSend:function(){ loading=layer.load();},
                complete: function() { layer.close(loading);},
                success: function(res) {
                    if(res.success){
                        var index = res.prize;
                        $("#turntable").rotate({
                            angle: 0,
                            duration: 10000, //转动时间
                            animateTo: 360*6+ prizeMap[index].angle, //转动角度
                            callback: function(){
                                layer.open({
                                    type:1,
                                    content:prizeMap[index].prize,
                                    title: false,
//                                  time: 5000,
//                                  shadeClose: false,
//                                  style: 'width:200px; height:200px; border:none;'
                                    area: ['300px'],
                                    skin: 'layStyle'
                                });
                            }
                        });
                    }
                }
            });
        });

    })
</script>
{/literal}
</body>
</html>
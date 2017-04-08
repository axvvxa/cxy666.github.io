<!doctype html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
        .wrap { position:relative;width:1190px;margin:0 auto;}
        .searchBox { padding:10px;margin-bottom:20px;}
        input[name='searchWord'] { width:230px;height:24px;line-height:24px;padding:0 5px;border:0;box-shadow:0px 0px 4px #F5BDB3;}
        #searchBtn { display:inline-block;width:80px;height:26px;line-height:24px;background:#F5BDB3;color:#fff;text-align:center;box-shadow:0px 0px 4px #F5BDB3;}
        .searchLog { overflow:hidden;width:400px;padding:10px 0;}
        .searchLog li { display:inline-block;border:1px solid #999;margin:0 5px;padding:3px;}
    </style>
    <script src="js/jquery/jquery.cookie.js"></script>
</head>
<body>
<div class="wrap">
    <div class="searchBox">
        <input type="text" name="searchWord" /><a href="javascript:;" id="searchBtn">搜索</a><br>
    </div>
    <h3 class="logTitle">搜索记录</h3>
    <ul class="searchLog">
    </ul>
</div>
{literal}
    <script>
        $(function(){
//            $.cookie("searchWord", null, { expires: -1, path: '/' });//清除该记录
            var searchWord = $("input[name='searchWord']");
            $("#searchBtn").on("click", function(){
                if(searchWord.val() != '') {
                    addLog(searchWord.val());
                }
            });
            function addLog(word) {
                var sWord, len = 0, json = "", json1, canAdd = true;
                if(!$.cookie("searchWord")){
                    sWord = $.cookie("searchWord", "[{res:'"+word+"'}]", {expires:7, path:'/'});
                    len ++;
                } else {
                    sWord = $.cookie("searchWord");
                    json1 = eval('(' + sWord + ')');
                    $(json1).each(function(){
                        if(word == this['res']){//同值
                            canAdd = false;
                            return false;
                        }
                        len ++;
                    });
                    if(canAdd) {
                        $(json1).each(function() {
                            json += "{res:'"+this['res'] +"'},";
                        });
                        json = "[{res:'" + word + "'}," + json + ']';
                        $.cookie("searchWord", json, {expires:7, path:'/'});
                    } else {
                        json = eval("(" + $.cookie("searchWord") + ")");
                        if( len <= json.length-1) {
                            json.splice(0, 0, json[len]);//重复的值调整位置，放到最前面并删掉原本该位置
                            json.splice(len+1, 1);//重复的值调整位置，放到最前面并删掉原本该位置
                            sWord = JSON.stringify(json);
                            $.cookie("searchWord", sWord, {expires:7, path:"/"});
                        }
                    }
                }
                json = eval("(" + $.cookie("searchWord") + ")");

                if(json.length>9) {//历史浏览数大于9，删第一个
                    json.pop();
                    json =JSON.stringify(json);
                    $.cookie("searchWord", json, { expires: 7, path: '/'});
                }
            }
            if($.cookie("searchWord")){
                var logWord = eval($.cookie("searchWord"));
                var lis = '';
                $.each(logWord, function(){
                    lis += '<li>' + this['res'] + '</li>';
                });
                $(".searchLog").html(lis);
            }
        });
    </script>
{/literal}
</body>
</html>
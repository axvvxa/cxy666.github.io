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

        })
    </script>
{/literal}
</body>
</html>
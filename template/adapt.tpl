<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
    </style>
</head>
<body>
<div style="max-width:640px;margin:10px auto;width:100%;position:relative;">
    <div style="width:100px;height:100px;border:1px solid #000;"></div>
    <div style="position:absolute;left:110px;right:10px;border:1px solid #f00;height:100px;top:0;">
    </div>
</div>
<div style="max-width:640px;margin:10px auto;width:100%;position:relative;">
    <div style="width:100px;height:100px;border:1px solid #000;"></div>
    <div style="position:absolute;left:110px;right:10px;border:1px solid #f00;height:100px;top:0;"></div>
</div>
<br><hr>
子容器不继承父容器透明度
<div style="background:rgba(0,0,0,0.2);width:100px;height:100px;">
    <div style="width:80px;height:80px;background:#f00;border:1px solid #f00;"></div>
</div>
{literal}
    <script>
        $(function(){

        })
    </script>
{/literal}
</body>
</html>
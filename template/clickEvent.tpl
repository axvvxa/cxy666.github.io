<!DOCTYPE html>
<html lang="en">
<head>
    {*{include file="template/header.tpl"}*}
    <style>
    </style>
</head>
<button id="test1">test addEventListener</button>
<body>
{literal}
    <script>
        var t1 = document.getElementById('test1');
        function eventFunc() {
            alert(8);
        }
        t1.addEventListener('click',eventFunc,false);
        t1.removeEventListener('click', eventFunc,false)
    </script>
{/literal}
</body>
</html>
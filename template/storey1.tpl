<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
        div { border:1px solid #000; padding-left:10px; margin-right:5px;width:200px;float:left;}
        .cur { background:#f2f2f2;}
    </style>
</head>
<body>
<div id="box1"></div>
<div id="box2"></div>
<div id="box3"></div>
{literal}
<script>
    $(function() {
        var data = [
            {id:1, parentId:0},
            {id:2, parentId:0},
            {id:3, parentId:0},
            {id:4, parentId:0},
            {id:5, parentId:1},
            {id:6, parentId:1},
            {id:7, parentId:1},
            {id:8, parentId:1},
            {id:9, parentId:2},
            {id:10, parentId:2},
            {id:11, parentId:4},
            {id:12, parentId:4},
            {id:13, parentId:6},
            {id:14, parentId:11},
            {id:15, parentId:11}
        ];
        var box1 = '';
        $.each(data, function() {
            if(this.parentId == 0){
                box1 += "<p>" + this.id + "</p>";
            }
        });
        $("#box1").html(box1);
        $("#box1 p").on("click", function() {
            $("#box2, #box3").html("");
            if($(this).hasClass("cur")){
                $(this).removeClass("cur");
                return false;
            }
            $(this).addClass("cur").siblings().removeClass("cur");
            var curId = $(this).html();
            var box2 = '';
            $.each(data, function() {
                if(this.parentId == curId){
                    box2 += '<p>' + this.id + '</p>';
                }
            });
            $("#box2").html(box2);
            $("#box2 p").on("click", function() {
                if($(this).hasClass("cur")) {
                    $(this).removeClass("cur");
                    $("#box3").html("");
                    return false;
                }
                $(this).addClass("cur").siblings().removeClass("cur");
                var curId2 = $(this).html();
                var box3 = '';
                $.each(data, function() {
                    if(this.parentId == curId2){
                        box3 += '<p>' + this.id +'</p>';
                    }
                });
                $("#box3").html(box3);
            })
        });
    });
</script>
{/literal}
</body>
</html>
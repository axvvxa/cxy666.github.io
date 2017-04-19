<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
        #cv { margin:20px;}
    </style>
</head>
<body>
<canvas id="cv"></canvas>
<p id="clientX"></p>
<p id="clientY"></p>
{literal}
    <script>
        $(function() {
            var cv = document.getElementById('cv');
            cv.width = 600;
            cv.height = 300;
            cv.style.border = '1px solid #f00';
            var ctx = cv.getContext("2d");

            ctx.beginPath();
            ctx.moveTo(100,50);
            ctx.lineTo(290,20);
            ctx.lineWidth = 2;
            ctx.strokeStyle = '#f00';
            ctx.stroke();

            $("body").on("click", function(e){
                $("#clientX").html(e.clientX);
            });


            function one() {
                var aa = bb = 3;
                console.log(bb);
            }
            one();
            console.log(bb);
        })
    </script>
{/literal}
</body>
</html>
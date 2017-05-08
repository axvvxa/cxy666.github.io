<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
</head>
<body>

数组去重：
<div class="unique"></div>
<hr>
字母统计：
<div class="sum"></div>
<input type="text" id="test" /><button>ok</button>
{literal}
    <script>
        $(function(){
            var arr = [1,2,2,2,1,34,5,6,34,7];
            var arr0 = [];
            for(var i=0;i<arr.length;i++){
                if(arr0.indexOf(arr[i])<0) {
                    arr0.push(arr[i])
                }
            }
            $(".unique").html("原数组："+arr.join(",")+"<br/>去重后："+arr0.join(","));

            var str = "aaaabbcdddeeffff";
            var obj = {};
            for(var j=0; j<str.length; j++) {
                var v = str.charAt(j);
                if(obj[v] && obj[v].value == v) {
                    obj[v].count ++;
                } else {
                    obj[v] = {};
                    obj[v].count = 1;
                    obj[v].value = v;
                }
            }
            var strSum = '';
            for (var key in obj) {
                strSum += obj[key].value+'='+obj[key].count+'<br />';
            }
            $(".sum").html("字符串："+str+'<br />'+strSum);
            $("button").on("click", function(){
                $(".sum").html($("#test").val())
            })
        })
    </script>
{/literal}
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
</head>
<body>
<script>
    //方式1
    document.write("<script type='text/javascript' src='test1.js'><\/script>");

    //方式2
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "test2.js";
    document.getElementsByTagName("head")[0].appendChild(script);

    //方式3
    function loadScript(url, callback){
        var oScript = document.createElement("script");
        oScript.type = "text/javascript";
        oScript.src = url;
        document.getElementsByTagName("head")[0].appendChild(oScript);
        if(oScript.readyState){
            oScript.onreadystatechange = function(){
                if(oScript.readyState == 'loaded' || oScript.readyState == 'complete'){
                    oScript.onreadystatechange = null;
                    callback();
                }
            }
        }else{
            oScript.onload = function(){
                callback();
            }
        }
    }
    loadScript('js/scroll.js',function(){
        loadScript('js/clockdown.js', function(){
            alert(0);
        })
    });

</script>
</body>
</html>
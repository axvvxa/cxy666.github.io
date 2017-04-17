<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
        ul { border:1px solid #000; padding-left:10px; margin-right:5px;width:200px;float:left;}
        .cur { background:#f2f2f2;}
        /*.subBox { display:none;}*/
    </style>
</head>
<body>
实用性太低，应弃用；<br />
<ul id="box"></ul>
<ul id="box2"></ul>
<ul id="box3"></ul>
{literal}
    <script>
        $(function(){
            var obj = {
                "tr1": {
                    name: 'tr1',
                    list: {
                        "tr1.1": {
                            name: "tr1.1",
                            list: {
                                "tr1.1.1": {
                                    name: 'tr1.1.1',
                                    list: {}
                                },
                                "tr1.1.2": {
                                    name: 'tr1.1.2',
                                    list: {}
                                },
                                "tr1.1.3": {
                                    name: 'tr1.1.3',
                                    list: {}
                                }
                            }
                        },
                        "tr1.2": {
                            name: "tr1.2",
                            list: {
                                "tr1.2.1": {
                                    name: 'tr1.2.1',
                                    list: {}
                                },
                                "tr1.2.2": {
                                    name: 'tr1.2.2',
                                    list: {}
                                },
                                "tr1.2.3": {
                                    name: 'tr1.2.3',
                                    list: {}
                                }
                            }
                        }
                    }
                },
                "tr2": {
                    name: 'tr2',
                    list: {
                        "tr2.1": {
                            name: "tr2.1",
                            list: {
                                "tr2.1.1": {
                                    name: 'tr2.1.1',
                                    list: {}
                                },
                                "tr2.1.2": {
                                    name: 'tr2.1.2',
                                    list: {}
                                },
                                "tr2.1.3": {
                                    name: 'tr2.1.3',
                                    list: {}
                                }
                            }
                        },
                        "tr2.2": {
                            name: "tr2.2",
                            list: {
                                "tr2.2.1": {
                                    name: 'tr2.2.1',
                                    list: {}
                                },
                                "tr2.2.2": {
                                    name: 'tr2.2.2',
                                    list: {}
                                },
                                "tr2.2.3": {
                                    name: 'tr2.2.3',
                                    list: {}
                                }
                            }
                        }
                    }
                }
            };
            var li="";
            for(var i in obj){
//                var data = obj[i]['list'];
                li += "<li>"+obj[i].name+"</li>";
            }
            $("#box").html(li);
            $("#box li").on("click", function() {
                if($(this).is(".cur")){
                    $(this).removeClass("cur");
                    $("#box2, #box3").html("");
                    return;
                }
                $(this).addClass("cur").siblings().removeClass("cur");
                $("#box2, #box3").html("");
                var index = $(this).index()+1;
                var data = obj['tr'+index]['list'];
                li = "";
                for(var j in data) {
                    li += "<li>" + data[j].name +"</li>";
                }
                $("#box2").html(li);
                var liIn = "";
                $("#box2 li").on("click", function() {
                    if($(this).is(".cur")){
                        $(this).removeClass("cur");
                        $("#box3").html("");
                        return;
                    }
                    $(this).addClass("cur").siblings().removeClass("cur");
                    $("#box3").html("");
                    var ind = $(this).index() + 1;
                    var dataIn = data['tr' + index + '.'+ind]['list'];
                    liIn = "";
                    for (var k in dataIn) {
                        liIn += "<li>" + dataIn[k].name + "</li>";
                    }
                    $("#box3").html(liIn);
                });
            })
        })
    </script>
{/literal}
</body>
</html>
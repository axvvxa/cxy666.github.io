<!DOCTYPE html>
<html lang="en">
<head>
    {include file="template/header.tpl"}
    <style>
    </style>
</head>
<body>
{literal}
    <script>
        $(function(){
            function SuperType(name) {//超类
                this.name = name;
                this.colors = ['red', 'green', 'blue'];
            }
            SuperType.prototype.sayName = function(){//超类方法
                alert(this.name);
            };

            function SubType(name, age) {//子类
                SuperType.call(this, name);//构造函数继承超类私有属性、方法
                this.age = age;
            }
            SubType.prototype = new SuperType();//原型继承超类的共有属性、方法
            SubType.prototype.sayAge = function(){//子类方法
                alert(this.age);
            };
            var ins1 = new SubType('nick', 19);
            ins1.colors.push('black');
            alert(ins1.colors);
            ins1.sayName();
            ins1.sayAge();

            var ins2 = new SubType('ins', 10);
            alert(ins2.colors);
            ins2.sayName();
            ins2.sayAge();
        })
    </script>
{/literal}
</body>
</html>
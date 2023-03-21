<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- boostrap满足不同屏幕缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 移动设备 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="./js/jquery-3.5.1.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        #nowtime{
            text-align: center;
            display: flex;
            flex-direction: column;        /*元素的排列方向为垂直*/
            justify-content: center;    /*水平居中对齐*/
            align-items: center;
            padding-top: 200px;
        }
        #app{
            align-items: center;        /*垂直居中对齐*/
            text-align: center;
            height: 100%;
        }
    </style>
</head>
<body>
<div id="app">
    <div id="nowtime" class="h4">当前系统时间</div>
    <div class="h3">借阅系统管理</div>
    <div class="h6">计算机172林源升B32</div>
</div>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script>
    //页面加载调用
    window.onload=function(){
        //每1秒刷新时间
        setInterval("NowTime()",1000);
    }
    function NowTime(){
        var myDate=new Date();
        var y = myDate.getFullYear();
        var M = myDate.getMonth()+1;     //获取当前月份(0-11,0代表1月)
        var d = myDate.getDate();        //获取当前日(1-31)
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        var s = myDate.getSeconds();     //获取当前秒数(0-59)

        //检查是否小于10
        M=check(M);
        d=check(d);
        h=check(h);
        m=check(m);
        s=check(s);
        var timestr = y+"-"+M+"-"+d+" "+h+":"+m+":"+s;
        document.getElementById("nowtime").innerHTML="当前时间：" + timestr;
    }
    //时间数字小于10，则在之前加个“0”补位。
    function check(i){
        var num = (i<10)?("0"+i) : i;
        return num;
    }

    const app = new Vue({
        el:"#app",
        data:{
            bookList:[
                {name:"西游记",isbn:20171010224,price:20.0},
                {name:"西游记",isbn:20171010224,price:20.0},
                {name:"西游记",isbn:20171010224,price:20.0},
                {name:"西游记",isbn:20171010224,price:20.0},
                {name:"西游记",isbn:20171010224,price:20.0},
            ]
        },
        methods:{

        }
    })
</script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 19:43
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
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
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
        #winabout{
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div id="app">

    <div class="panel panel-default" id="winabout">
        <div class="panel-heading">
            <h3 class="panel-title">缴费标准说明</h3>
        </div>
        <div class="panel-body">
            <ul class="list-group">
                <li class="list-group-item">#由图书馆方规定计费标准</li>
                <li class="list-group-item">#借阅时长为一个月</li>
                <li class="list-group-item">#超出一个月则开始计费</li>
                <li class="list-group-item">#计费标准每日每本为0.1元</li>
                <li class="list-group-item">#请自行合计总借书费用</li>
            </ul>
        </div>
        <div class="panel-footer">开发者</div>
    </div>

</div>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script>
    const app = new Vue({
        el:"#app",
        data:{
            bookList:[
                {name:"西游记",isbn:20171010224,price:20.0,imgurl:"${pageContext.request.contextPath}/img/my.jpg"},
                {name:"西游记",isbn:20171010224,price:20.0,imgurl:"${pageContext.request.contextPath}/img/my.jpg"},
                {name:"西游记",isbn:20171010224,price:20.0,imgurl:"${pageContext.request.contextPath}/img/my.jpg"},
                {name:"西游记",isbn:20171010224,price:20.0,imgurl:"${pageContext.request.contextPath}/img/my.jpg"},
                {name:"西游记",isbn:20171010224,price:20.0,imgurl:"${pageContext.request.contextPath}/img/my.jpg"},
            ]
        },
        methods:{

        }
    })
</script>

</body>
</html>

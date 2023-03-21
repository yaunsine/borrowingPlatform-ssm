<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 19:38
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
    </style>
</head>
<body>
<div id="app">
    <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">Library</a></li>
        <li class="active">Data</li>
    </ol>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>借阅者</th>
            <th>图书名</th>
            <th>超期天数</th>
            <th>已缴金额</th>
            <th>借出时间</th>
            <th>应还时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="item in bookList">
            <td>小明</td>
            <td>{{item.isbn}}</td>
            <td>{{item.price}}</td>
            <td>{{item.name}}</td>
            <td>{{item.name}}</td>
            <td>{{item.isbn}}</td>
            <td><input type="button" value="删除" class="btn btn-danger"></td>
        </tr>
        </tbody>
    </table>
    <nav>
        <ul class="pagination justify-content">
            <li class="disabled"><a href="#"><span >&laquo;</span></a></li>
            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
            <li ><a href="#">2 <span class="sr-only">(current)</span></a></li>
            <li ><a href="#"><span>&raquo;</span></a></li>
        </ul>
    </nav>
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

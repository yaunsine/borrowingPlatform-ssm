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

    </style>
</head>
<body>
<div id="app">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active table-bordered" ><a href="javascript:;" @click="showUser">借阅者信息</a></li>
        <li role="presentation" v-show="isShowUser"><a href="reader.jsp" target="right">查看借阅者</a></li>
        <li role="presentation" v-show="isShowUser"><a href="addreader.jsp" target="right">录入借阅证</a></li>

    </ul>
    <ul class="nav nav-pills nav-stacked ">
        <li role="presentation" class="active table-bordered"><a href="javascript:;" v-on:click="showBook">发布更新通告</a></li>
        <li role="presentation" v-show="isUpdateBook"><a href="addbooktype.jsp" target="right">新增图书类别</a></li>
        <li role="presentation" v-show="isUpdateBook"><a href="addbooknotice.jsp" target="right">引进图书通告</a></li>

    </ul>
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active table-bordered"><a href="javascript:;" @click="showRentBook">借出图书管理</a></li>
        <li role="presentation" v-show="isShowRent"><a href="rentedbook.jsp" target="right">已借出图书</a></li>
        <li role="presentation" v-show="isShowRent"><a href="overdue.jsp" target="right">超期图书</a></li>

    </ul>
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active table-bordered"><a href="javascript:;" v-on:click="showFine">查看罚款明细</a></li>
        <li role="presentation" v-show="isShowFine"><a href="beforefine.jsp" target="right">往期罚款</a></li>
        <li role="presentation" v-show="isShowFine"><a href="aboutfine.jsp" target="right">罚款说明</a></li>
    </ul>
</div>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script>
    const app = new Vue({
        el:"#app",
        data:{
            isShowUser:false,
            isUpdateBook:false,
            isShowRent:false,
            isShowFine:false
        },
        methods:{
            showUser:function(){
                this.isShowUser = !this.isShowUser;
            },
            showBook:function(){
                this.isUpdateBook = !this.isUpdateBook;
            },
            showRentBook:function(){
                this.isShowRent = !this.isShowRent;
            },
            showFine:function(){
                this.isShowFine = !this.isShowFine;
            }
        }
    })
</script>
</body>
</html>

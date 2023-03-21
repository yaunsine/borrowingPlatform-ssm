<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 17:05
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
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        #login-info{
            margin-top: 40px;
            padding: 40px;

            background-color: #fff;
        }
        ul .active{
            color: orangered;
        }
        body{
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: url(${pageContext.request.contextPath}/img/bg.jpg)  no-repeat center 0px;
            background-size: cover;



            background-position: center 0;
            background-repeat: no-repeat;
            background-attachment: fixed;
            -webkit-background-size: cover;
            -o-background-size: cover;
            -moz-background-size: cover;
            -ms-background-size: cover;

        }
    </style>

    <title>登录</title>
</head>
<body>
<div id="app" class="container">

    <div class="col-lg-3 col-lg-offset-4 jumbotron" id="login-info">

        <ul class="nav nav-tabs" role="tablist" id="login_tab">
            <li role="presentation" :class="actlogin"><a href="javascript:;" @click="loginShow">登录</a></li>
            <li role="presentation" :class="actregister"><a href="javascript:;" @click="registerShow">注册</a></li>
        </ul><br>
        <div v-show="islogin">
            <form class="form" role="form" id="loginform">
                <div class="row">
                    <div class="input-group " >
                        <span class="input-group-addon" >手机号</span>
                        <input type="text" class="form-control " placeholder="请输入手机号">
                    </div>
                </div><br>
                <div class="row">
                    <div class="input-group ">
                        <span class="input-group-addon" id="sizing-addon1">密码</span>
                        <input type="password" class="form-control" placeholder="请输入密码">

                    </div>
                </div>
                <br>
            </form>
            <div class="row">
                <div class="btn-group">
                    <button type="button" class="btn btn-default active">{{type}}</button>
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="javascript:;" @click="selecttype(index)" v-for="(item,index) in typeList">{{item}}</a></li>
                    </ul>
                </div>
            </div><br>
            <div class="row">
                <input type="button" value="登录" class="btn btn-primary btn-block" @click="login">
            </div><br>
            <div class="row text-right">
                <span class=""><a href="">忘记密码？</a></span>
            </div>
        </div>
        <div v-show="isregister">
            <form class="form" role="form">
                <div class="row">
                    <div class="input-group " >
                        <span class="input-group-addon" >手机号</span>
                        <input type="text" class="form-control " placeholder="请输入手机号">
                    </div>
                </div><br>
                <div class="row">
                    <div class="input-group ">
<%--                        id="sizing-addon1"--%>
                        <span class="input-group-addon" >密码</span>
                        <input type="password" class="form-control" placeholder="请输入密码">

                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="input-group ">
                        <span class="input-group-addon" >确认密码</span>
                        <input type="password" class="form-control" placeholder="请再次输入密码">

                    </div>
                </div>
                <br>
            </form>

            <div class="row">
                <input type="button" value="注册" class="btn btn-success btn-block">
            </div><br>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script>
    $("#login_tab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    })
    var app = new Vue({
        el:"#app",
        data:{
            islogin:true,
            isregister:false,
            actlogin:{active:true},
            actregister:{active:false},
            type:"==选择身份登录==",
            typeList:["普通用户","管理员"]
        },
        methods:{
            loginShow:function(){
                this.islogin = true
                this.isregister = false
                this.actlogin.active = true
                this.actregister.active = false
            },
            registerShow:function(){
                this.islogin = false
                this.isregister = true
                this.actlogin.active = false
                this.actregister.active = true
            },
            selecttype:function(index){
                var list = this.typeList
                this.type = list[index]
            },
            login:function () {
                $("#loginform").attr("action","${pageContext.request.contextPath}/adminController/login");
                $("#loginform").submit();
                console.log(100)
            }
        }
    })
</script>
</body>
</html>

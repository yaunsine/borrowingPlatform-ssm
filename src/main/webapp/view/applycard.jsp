<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/26
  Time: 23:21
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
    <head>
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            .pagenum{
                width: 200px;
                margin: auto;
            }
            #myform{
                padding-top: 20px;
            }
            .winreader{
                margin-top: 40px;
            }
            img{
                cursor: pointer;
            }
        </style>
    </head>
<body>
<div class="container">
<div id="app" >
    <div class="row ">
        <header>
            <nav class=" navbar well">
                <div class="text-center ">
                    <div class="col-lg-2"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></div>
                    <div class="col-lg-2"><a href="${pageContext.request.contextPath}/borrowController/getMyRented">我的借阅</a></div>
                    <div class="col-lg-2"><a href="${pageContext.request.contextPath}/readerController/tomyinfo">个人信息</a></div>
                    <div class="col-lg-2 text-lowercase"><a href="${pageContext.request.contextPath}/readerController/toapply">申领借书证</a></div>
                    <div class="col-lg-2"><a href="javascript:;" @click="aboutMe">关于</a> </div>
                    <div class="col-lg-2"><a href="${pageContext.request.contextPath}/readerController/exit">
                        <c:choose>
                            <c:when test="${empty user}">
                                登录>>
                            </c:when>
                            <c:otherwise>注销></c:otherwise>
                        </c:choose>
                    </a> </div>
                </div>

            </nav>
        </header>
    </div>

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">个人信息</a></li>
            <li class="active">我的</li>
        </ol>
    </div>

    <div class="row">
        <div class="panel panel-primary">
            <!-- Default panel contents -->
            <div class="panel-heading">个人信息确认</div>

            <!-- Table -->
            <table class="table table-bordered table-hover">
                <tr>
                    <td>姓名</td>
                    <td><c:out value="${user.realname}" default="null"/></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td><c:out value="${user.gender}" default="null"/></td>
                </tr>
                <tr>
                    <td>昵称</td>
                    <td><c:out value="${user.nickname}" default="null"/></td>
                </tr>
                <tr>
                    <td>手机号</td>
                    <td><c:out value="${user.phone}" default="null"/></td>
                </tr>
                <tr>
                    <td>邮箱</td>
                    <td><c:out value="${user.email}" default="null"/></td>
                </tr>
            </table>

        </div>
    </div>
    <div class="row text-center">
        <form class="form" id="myform">
            <input type="button" value="申请借书证" class="btn btn-primary" @click="apply">
            <input type="button" value="修改个人信息" class="btn btn-default" @click="modify">
        </form>

    </div><br>

</div>
    <div class="row">
        <div class="well text-center" id="footer">
            ZHKU-Computer-B32-LinYuanSheng
            <br><br>
            2020-06
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script>
    window.onload=function () {
        // $("#footer").height($(document).height()-$("#app").height())
    }
    var app = new Vue({
        el:"#app",
        data:{

        },
        methods:{
            apply:function () {
                $("#myform").attr("method","post");
                $("#myform").attr("action","${pageContext.request.contextPath}/cardController/addCard");
                $("#myform").submit();
            },
            aboutMe:function () {
                alert("仲恺农业工程学院2017级B32作品-By林源升")
            },
            modify:function () {
                $("#myform").attr("method","post");
                $("#myform").attr("action","${pageContext.request.contextPath}/readerController/tomyinfo");
                $("#myform").submit();

            }
        }
    })
</script>
</body>
</html>

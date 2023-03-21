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
<div id="app" class="container">
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
            <li><a href="#">个人借阅</a></li>
            <li class="active">我的</li>
        </ol>
    </div>

    <div class="row">
        <table class="table">
            <thead>
            <tr>
                <th>图样</th>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>借书日期</th>
                <th>应还日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${myBorrow}" var="item">
                <tr>
                    <td><img src="" width="60px" height="60px" alt=""></td>
                    <td>${item.bookname}</td>
                    <td>${item.author}</td>
                    <td>${item.publisher}</td>
                    <td>${item.starttime}</td>
                    <td>${item.endtime}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.stat ==1}">
                                <a type="button" href="${pageContext.request.contextPath}/borrowController/returnBook?bookid=${item.bookid}&borrowid=${item.borrowid}"  class="btn btn-primary">还书</a>
                            </c:when>
                            <c:when test="${item.stat ==2}">
                                已还书，等待确认
                            </c:when>
                            <c:otherwise>
                                还书成功！
                            </c:otherwise>
                        </c:choose>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="well text-center" style="height: 100%">
            ZHKU-Computer-B32-LinYuanSheng
            <br><br>
            2020-06
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script>
    window.onpageshow = function(event) {
        if (event.persisted || window.performance &&
            window.performance.navigation.type == 2) {
            window.location.reload();
        }
    }
    var app = new Vue({
        el:"#app",
        data:{
            myrented:[0,0,0,0,0]
        },
        methods:{
            returnBook:function (bookid,borrowid) {

            },
            aboutMe:function () {
                alert("仲恺农业工程学院2017级B32作品-By林源升")
            }
        }
    })
</script>
</body>
</html>

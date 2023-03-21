<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/26
  Time: 20:57
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
        .navbar{
            margin-bottom: -6px;
        }
        .navbar a{
            color: black;
        }
        .h4{
            padding: 10px;
        }
    </style>
</head>
<body >
<div class="container" id="app">
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
            <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
            <li><a href="#">分类</a></li>
            <li class="active">图书</li>
        </ol>
    </div>
    <div class="row">
        <form action="" class="myform">
            <div class="input-group">
                <input type="text" class="form-control">
                <div class="input-group-addon" id="search" @click="search">搜索</div>
            </div>

        </form>

    </div>
    <div class="row">
        <div class="h4 text-primary"><img src="./img/book.png" alt="">图书</div>
    </div>
    <div class="row">
        <c:forEach var="item" items="${booklist}">
        <div class="col-sm-6 col-md-3">

                <div class="thumbnail">

                    <img id="bookimg" class="bookimg img-thumbnail" src="<c:url value='/img/${item.imgurl}'/>" v-bind:alt="showImg()">
                    <div class="caption">
                        <h3>${item.bookname}</h3>
                        <p>${item.author}</p>
                        <p>${item.publisher}</p>
                        <p>数量：${item.counts}</p>
                        <p><a href="#" class="btn btn-primary" role="button">查看</a>

                            <a href="<c:url value="/borrowController/rentbook?bookid=${item.bookid}"/>" id="rentbook" class="btn btn-default" role="button">借阅</a></p>
                    </div>
                </div>

        </div>
        </c:forEach>
    </div>
    <div class="row text-center">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="row">
        <div class="well text-center" style="height: 100px;">
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
            category:["科学类","文学类","小说类","国学类","计算机类","会计类","语言类","生物类"],
            book:[0,0,0,0,0,0,0,0]
        },
        created:function(){
            $(".bookimg").height($(".caption").width());
        },
        mounted:function(){

        },
        methods:{
            showImg:function(){

            },
            search:function(){
                alert("111")
            },
            aboutMe:function () {
                alert("仲恺农业工程学院2017级B32作品-By林源升")
            }
        }
    })
</script>

</body>
</html>

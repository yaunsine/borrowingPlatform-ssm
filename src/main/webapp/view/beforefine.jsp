<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 19:35
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
        <li><a href="#">管理员</a></li>
        <li><a href="#">已还历史</a></li>
        <li class="active">图书</li>
    </ol>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>图样</th>
            <th>图书名</th>
            <th>ISBN码</th>
            <th>作者</th>
            <th>出版社</th>
            <th>借阅者</th>
            <th>借出时间</th>
            <th>应还时间</th>
            <th>提示</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${borrowList}" var="item">
            <c:if test="${item.stat==3}">
                <tr>
                    <td><img src="<c:url value="${pageContext.request.contextPath}/img/${item.imgurl}"/>" width="50px" height="50px" class="img-thumbnail" alt=""></td>
                    <td>${item.bookname}</td>
                    <td>${item.isbn}</td>
                    <td>${item.author}</td>
                    <td>${item.publisher}</td>
                    <td>${item.realname}</td>
                    <td>${item.starttime}</td>
                    <td>${item.endtime}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.stat==3}">还书成功！</c:when>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/adminController/deleteHistory?id=${item.borrowid}" type="button" class="btn btn-danger">删除</a>
                    </td>



                </tr>
            </c:if>
        </c:forEach>

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
    window.onpageshow = function(event) {
        if (event.persisted || window.performance &&
            window.performance.navigation.type == 2) {
            window.location.reload();
        }
    }
    const app = new Vue({
        el:"#app",
        data:{
        },
        methods:{

        }
    })
</script>

</body>
</html>
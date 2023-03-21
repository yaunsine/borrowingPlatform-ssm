<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 19:33
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
        .pagenum{
            width: 200px;
            margin: auto;
        }
    </style>
</head>
<body>
<div id="app">
    <ol class="breadcrumb">
        <li><a href="#">管理员</a></li>
        <li><a href="#">借阅者信息</a></li>
        <li class="active">借阅者</li>
    </ol>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>借阅者昵称</th>
            <th>真实姓名</th>
            <th>性别</th>
            <th>手机号</th>
            <th>邮箱号</th>
            <th>密码</th>
            <th>借阅证办理日期</th>
            <th>借阅证到期日期</th>

        </tr>
        </thead>
        <tbody>
        <tr v-for="item in readerList">
            <td>{{item.nickname}}</td>
            <td>{{item.realname}}</td>
            <td>{{item.gender}}</td>
            <td>{{item.phone}}</td>
            <td>{{item.email}}</td>
            <td>{{item.pwd}}</td>
            <td>{{item.stime}}</td>
            <td>{{item.etime}}</td>
        </tr>
        </tbody>
    </table>
    <div class="pagenum">
        <nav>
            <ul class="pagination justify-content">
                <li class="disabled"><a href="#"><span >&laquo;</span></a></li>
                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                <li ><a href="#">2 <span class="sr-only">(current)</span></a></li>
                <li ><a href="#"><span>&raquo;</span></a></li>
            </ul>
        </nav>
    </div>

</div>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script>
    const app = new Vue({
        el:"#app",
        data:{
            readerList:[
                {nickname:"aaa",realname:"阿林",gender:"男",phone:"17806707086",email:"1580909@qq.com",pwd:"zl19009",stime:"2020-02-02",etime:"2022-02-01"},
                {nickname:"aaa",realname:"阿林",gender:"男",phone:"17806707086",email:"1580909@qq.com",pwd:"zl19009",stime:"2020-02-02",etime:"2022-02-01"},
                {nickname:"aaa",realname:"阿林",gender:"男",phone:"17806707086",email:"1580909@qq.com",pwd:"zl19009",stime:"2020-02-02",etime:"2022-02-01"},
                {nickname:"aaa",realname:"阿林",gender:"男",phone:"17806707086",email:"1580909@qq.com",pwd:"zl19009",stime:"2020-02-02",etime:"2022-02-01"},
                {nickname:"aaa",realname:"阿林",gender:"男",phone:"17806707086",email:"1580909@qq.com",pwd:"zl19009",stime:"2020-02-02",etime:"2022-02-01"},
            ]
        },
        methods:{

        }
    })
</script>

</body>
</html>

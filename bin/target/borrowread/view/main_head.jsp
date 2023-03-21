<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 18:36
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
        #popwin{
            position: relative;
            z-index: 999;
        }
        #loginStat{
            margin-top: 5px;
            margin-bottom: 5px;
        }
    </style>
</head>
<body >
<nav class="navbar navbar-default" role="navigation">
    <div class="row">
        <div class="navbar-header col-md-4">
                <span>
                    <a class="navbar-brand" href="#">图书借阅管理系统 Book Lending and Reading System</a>
                </span>

        </div>
        <div class="col-md-2">
                <span>
                    <button id="loginStat" class="btn btn-success" type="button">
                        当前登录用户 <span class="badge">小明</span>
                      </button>
                </span>


        </div>
        <div class="col-md-2">
                <span>
                    <ul class="nav navbar-nav">
                    <li><a href="#">注销</a></li>
                </ul>
                </span>


        </div>
        <!-- <div class="col-md-2 col-md-offset-5">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">当前登录账户 <span class="caret"></span></a>
                  <ul class="dropdown-menu" id="popwin">
                    <li><a href="#">当前登录用户</a></li>
                    <li><a href="#">注销</a></li>
                    <li role="separator" class="divider"></li>
                  </ul>
                </li>
              </ul>
        </div> -->
    </div>
</nav>
</body>

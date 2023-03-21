<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 19:42
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
        #myform{
            padding-top: 20px;
        }
        .winreader{
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div id="app" class="winreader">
    <form class="form-horizontal" id="myform">
        <div class="form-group">
            <label class="col-sm-2 control-label">图书类别</label>
            <div class="col-sm-4">
                <input type="text" name="type" class="form-control" placeholder="输入类别">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-4">
                <textarea class="form-control" name="remarks" rows="10" placeholder="输入备注信息"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-4">
                <button type="submit" class="btn btn-success col-sm-4" @click="submit">提交</button>
            </div>
        </div>


    </form>
</div>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script>
    const app = new Vue({
        el:"#app",
        data:{

        },
        methods:{
            submit:function () {
                $("#myform").attr("method","post");
                $("#myform").attr("action","${pageContext.request.contextPath}/categoryController/addItem");
                $("#myform").submit();
            }
        }
    })
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/23
  Time: 19:43
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
            <label class="col-sm-2 control-label">图书名</label>
            <div class="col-sm-4">
                <input type="text" name="bookname" class="form-control" placeholder="输入书名">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label">作者</label>
            <div class="col-sm-4">
                <input type="text" name="author" class="form-control" placeholder="输入作者">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">ISBN码</label>
            <div class="col-sm-4">
                <input type="text" name="isbn" class="form-control" placeholder="输入ISBN">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">图书类别</label>

            <div class="col-sm-4">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{type}}
                    <input name="typeid" v-bind:value="typeid" class="form-control" type="text" v-show="false">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu4">
                    <li v-for="(item,index) in typeList">

                        <a href="javascript:;" @click="selecttype(index)" >{{item.type}}</a></li>
                </ul>
            </div>
        </div>

        <div class="form-group">
            <label for="exampleInputFile" class="col-sm-2 control-label">上传图样</label>
            <div class="col-sm-4">
                <input type="file" name="image"  id="exampleInputFile">
                <!-- <p class="help-block">Example block-level help text here.</p> -->
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">出版社</label>
            <div class="col-sm-4">
                <input type="text" name="publisher" class="form-control" placeholder="输入出版社名字">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">图书数量</label>
            <div class="col-sm-4">
                <input type="text" name="counts" class="form-control" placeholder="输入图书数量">
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
    var app = new Vue({
        el:"#app",
        data:{
            type:"==选择类别==",
            typeList:[],
            typeid:""
        },
        mounted:function(){
            let that = this
            $.get("${pageContext.request.contextPath}/categoryController/getType",function (response) {
                that.typeList = response
            })
        },
        methods:{
            selecttype:function(index){
                var list = this.typeList
                this.type = list[index].type
                this.typeid = list[index].typeid
            },
            submit:function () {
                $("#myform").attr("method","post");
                $("#myform").attr("action","${pageContext.request.contextPath}/bookController/addBook");
                $("#myform").attr("enctype","multipart/form-data");
                $("#myform").submit();
            }
        }
    })
</script>
</body>
</html>

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
    <title>我的信息</title>
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
            <li><a href="#">个人信息</a></li>
            <li class="active">我的</li>
        </ol>
    </div>

    <div class="row">
        <form class="form-horizontal table-bordered" id="myform">
            <div class="form-group ">
                <label  class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-4">
                    <input id="realname-input" type="text" name="realname" value="${user.realname}" class="form-control" v-bind:disabled="isRealNameEditable" placeholder="输入姓名">
                </div>
                <div class="">
                    <img src="${pageContext.request.contextPath}/img/edit.png" v-if="isRealNameEditable" alt="" @click="editContext">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">昵称</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="nickname" value="${user.nickname}" v-bind:disabled="isNickNameEditable" placeholder="输入昵称">
                </div>
                <div class="">
                    <img src="${pageContext.request.contextPath}/img/edit.png" v-if="isNickNameEditable" alt="" @click="editNickNameContext">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-4">

                        <c:choose>
                            <c:when test="${user.gender=='男'}">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" checked="checked" value="男"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="女"> 女
                                </label>
                            </c:when>

                            <c:otherwise>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="inlineRadio1" value="男"> 男
                                    </label>
                                    <label class="radio-inline">
                                         <input type="radio" name="gender" id="inlineRadio2" checked="checked" value="女"> 女
                                    </label>
                            </c:otherwise>
                        </c:choose>



                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-4">
                    <input type="number" class="form-control" value="${user.phone}" v-bind:disabled="isPhoneEditable" placeholder="输入手机号">
                </div>
<%--                <div class="">--%>
<%--                    <img src="${pageContext.request.contextPath}/img/edit.png" alt="" @click="editPhoneContext">--%>
<%--                </div>--%>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">邮箱号</label>
                <div class="col-sm-4">
                    <input type="email" name="email" class="form-control" value="${user.email}" v-bind:disabled="isEmailEditable" placeholder="输入邮箱号">
                </div>
                <div class="">
                    <img src="${pageContext.request.contextPath}/img/edit.png" v-if="isEmailEditable" alt="" @click="editEmailContext">
                </div>
            </div>
            <!-- 密码 -->
            <!-- <div class="form-group">
              <label  class="col-sm-2 control-label">密码</label>
              <div class="col-sm-4">
                <input type="email" class="form-control" placeholder="输入密码">
              </div>
            </div>
            <div class="form-group">
              <label  class="col-sm-2 control-label">确认密码</label>
              <div class="col-sm-4">
                <input type="email" class="form-control" placeholder="重新输入密码">
              </div>
            </div> -->
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-4">
                    <button type="submit" class="btn btn-success col-sm-4" @click="submitInfo">提交</button>
                </div>
            </div>
        </form>
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
            isRealNameEditable:true,
            isNickNameEditable:true,
            isPhoneEditable:true,
            isEmailEditable:true
        },
        created:function(){

        },
        mounted:function(){

        },
        methods:{
            editContext:function() {
                this.isRealNameEditable = !this.isRealNameEditable
            },
            editNickNameContext:function () {
                this.isNickNameEditable = !this.isNickNameEditable;
            },
            editEmailContext:function () {
                this.isEmailEditable = !this.isEmailEditable;
            },
            editPhoneContext:function () {
                this.isPhoneEditable = !this.isPhoneEditable;
            },
            submitInfo:function(){
                $("#myform").attr("method","post");
                $("#myform").attr("action","${pageContext.request.contextPath}/readerController/updateinfo");
                $("#myform").submit();
            },
            aboutMe:function () {
                alert("仲恺农业工程学院2017级B32作品-By林源升")
            }
        }
    })
</script>
</body>
</html>

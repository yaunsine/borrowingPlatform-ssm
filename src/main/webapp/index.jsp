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
    <title>首页</title>
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
        <div class="h4 text-primary"><img src="${pageContext.request.contextPath}/img/type.png" alt="">分类</div>
    </div>
    <div class="row">
        <ul class="list-group">
            <li class="lis list-group-item list-group-item-success  col-lg-3" id="lis" v-for="(item,index) in category" @mouseout="setDead(index)" @mouseenter="setActive(index)" @click="showTypeBook(item.typeid)">
                <span class="badge" v-for="typeCount in typeCountList" v-if="item.typeid==typeCount.typeid">{{typeCount.bookcounts}}</span>
                {{item.type}}
            </li>
        </ul>

    </div>

    <div class="row">
        <div class="h4 text-primary"><img src="${pageContext.request.contextPath}/img/info.png" alt="">通知</div>
    </div>
    <div class="row">
        <div class="panel panel-default col-lg-7">
            <!-- Default panel contents -->
            <div class="panel-heading">上新通知</div>

            <!-- Table -->
            <table class="table">
                <tr v-for="(item,index) in book" v-if="index<5">
                    <td>{{item.subtime}}</td>
                    <td>上新通知</td>
                    <td>《{{item.bookname}}》上新</td>
                </tr>
            </table>
        </div>
        <div class="panel panel-default col-lg-4 col-lg-offset-1">
            <!-- Default panel contents -->
            <div class="panel-heading">开放时间</div>

            <!-- Table -->
            <table class="table">
                <tr>
                    <td># 周一到周五 8:00 - 22:00</td>

                </tr>
                <tr><td># 周六 8:30 - 9:30</td>
                </tr>
                <tr><td># 周日休息</td></tr>
                <tr><td># 节假日不开放</td></tr>
                <tr><td># 电子阅览室12:00-14:30 关闭，其余时间照常开放</td></tr>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="h4 text-primary">
            <img src="${pageContext.request.contextPath}/img/book.png" alt="">
            图书</div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-md-3" v-for="(item,index) in book">
            <div class="thumbnail" v-if="index<4">
                <img id="bookimg" :src="'${pageContext.request.contextPath}/img/'+item.imgurl" class="bookimg img-thumbnail" v:bind:alt="showImg()">
                <div class="caption">
                    <h3>{{item.bookname}}</h3>
                    <p>{{item.author}}</p>
                    <p>{{item.publisher}}</p>
                    <p>数量：{{item.counts}}</p>
                    <p><a href="#" class="btn btn-primary" role="button">查看</a>
                        <a :href="'${pageContext.request.contextPath}/borrowController/rentbook?bookid='+item.bookid" id="rentbook" class="btn btn-default" role="button">借阅</a></p>
                </div>
            </div>
        </div>
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
    window.onload=function () {
        for (let index = 0; index < $(".lis").length; index++) {
            if(index%4==0){
                $(".lis")[index].setAttribute("class","lis list-group-item col-lg-3 list-group-item-success")
            }else if (index%4==1) {
                $(".lis")[index].setAttribute("class","lis list-group-item col-lg-3 list-group-item-info")

            } else if(index%4==2) {
                $(".lis")[index].setAttribute("class","lis list-group-item col-lg-3 list-group-item-danger")
            }else{
                $(".lis")[index].setAttribute("class","lis list-group-item col-lg-3 list-group-item-warning")
            }
        }
    }
    var app = new Vue({
        el:"#app",
        data:{
            category:[{type:"科学类",type:"文学类",type:"小说类",
                type:"国学类",type:"计算机类",type:"会计类",type:"语言类",type:"生物类"}],
            book:[0,0,0,0],
            isShowImg:true,
            typeCountList:[]
        },
        created:function(){
            this.getCategory();
            this.getBook();
            this.getTypeBookCounts();

            <%--alert("欢迎${user.nickname}……")--%>
        },
        mounted:function(){
            $(".bookimg").height($(".caption").width());
            this.setCategoryStyle();
            // alert("mounted……")
        },
        methods:{
            rentbook:function(bookid){
                //借阅书籍
                // alert(bookid)
                $("#rentbook").attr("href","${pageContext.request.contextPath}/borrowController/rentbook?bookid="+bookid)
            },
            getTypeBookCounts:function(){
                var that = this
              $.getJSON("${pageContext.request.contextPath}/categoryController/getTypeBookCounts",function (response) {
                  console.log(response)
                  that.typeCountList = response
              })
            },
            setActive:function(index){
              $(".lis")[index].classList.add("active")
            },
            setDead:function(index){
                $(".lis")[index].classList.remove("active")
            },
            showTypeBook:function(index){
                var htmlpath = "${pageContext.request.contextPath}/bookController/showTypeBook/"+index+".html"
                $(location).attr('href',htmlpath);
                // this.$router.push(htmlpath);
                <%--$.post("${pageContext.request.contextPath}/bookController/showTypeBook/{"+index+"}.html")--%>
            },
            showImg:function(){
              alert(999)
            },
            getCategory:function(){
                let that = this
                $.getJSON("${pageContext.request.contextPath}/categoryController/getType",function (response) {
                    that.category = response
                })

            },
            getBook:function(){
                let that = this
                $.getJSON("${pageContext.request.contextPath}/bookController/showBook",function (response) {
                    console.log(response)
                    that.book = response
                    for (let i = 0; i < response.length; i++) {
                        var now = new Date(response[i].subtime);
                        var y = now.getFullYear();
                        var m = now.getMonth() + 1;
                        var d = now.getDate();
                        that.book[i].subtime = y+"-"+m+"-"+d;
                    }
                })
            },
            setCategoryStyle:function () {
                // alert($(".lis").length)

            },
            aboutMe:function () {
                alert("仲恺农业工程学院2017级B32作品-By林源升")
            }
        }
    })
</script>

</body>
</html>
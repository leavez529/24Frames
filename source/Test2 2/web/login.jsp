<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tanrui
  Date: 2018/12/19
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="top.guitoubing.util.ConstantDefinition" %>
<html lang="en" class="login-content" data-ng-app="materialAdmin" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>登录 & 注册</title>

    <!-- Vendor CSS -->
    <link href="css/material-design-iconic-font/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css">
    <!-- CSS -->
    <link href="css/app.min.1.css" rel="stylesheet" type="text/css">
</head>
<body class="login-content" data-ng-controller="loginCtrl as lctrl">

<c:choose>
    <c:when test="${requestScope.get(ConstantDefinition.LOGIN_RETURN) == ConstantDefinition.WRONG_USER}">
        <script>
            alert("手机号码不存在！");
        </script>
    </c:when>
    <c:when test="${requestScope.get(ConstantDefinition.LOGIN_RETURN) == ConstantDefinition.WRONG_PWD}">
        <script>
            alert("密码错误！")
        </script>
    </c:when>
</c:choose>
<%--<c:if test="${not empty ConstantDefinition.LOGIN_RETURN}">--%>
    <%--<script>--%>
        <%--alert("手机号码已存在！")--%>
    <%--</script>--%>
<%--</c:if>--%>

<div class="lc-block" id="l-login" data-ng-class="{'toggled':lctrl.login === 1}">
    <h1 class="lean">登录</h1>
    <form method="post" action="/login">
        <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<!--<i class="zmdi zmdi-account"></i>-->
                <img src="img/number.png" style="width: 22px; height: auto;">
    		</span>
            <div class="fg-line">
                <input type="text" name="tel" class="form-control" placeholder="Telephone" regex="^1(3|4|5|7|8)\d{9}$"/>
            </div>
        </div>

        <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-male"></i>
    		</span>
            <div class="fg-line">
                <input type="password" name="password" class="form-control" placeholder="Password" regex="^\w+"/>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="checkbox">
            <label>
                <input type="checkbox" value="" />
                <i class="input-helper">
                    保持登录状态
                </i>
            </label>
        </div>

        <button type="submit" class="btn btn-login btn-danger btn-float">
            <i class="zmdi zmdi-arrow-forward"></i>
        </button>

        <ul class="login-navigation">
            <li class="bgm-red" data-ng-click="lctrl.login = 0; lctrl.register = 1">注册</li>
        </ul>
    </form>
</div>

    <div class="lc-block" id="l-register" data-ng-class="{ 'toggled': lctrl.register === 1 }" data-ng-if="lctrl.register === 1">
        <h1 class="lean">注册</h1>

        <form method="post" action="/register">
            <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-account"></i>
    		</span>
                <div class="fg-line">
                    <input type="text" name="username" class="form-control" placeholder="Username" regex="^\w{3,16}$"/>
                </div>
            </div>

            <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<!--<i class="zmdi zmdi-email"></i>-->
                <img src="img/number.png" style="width: 22px; height: auto;">
    		</span>
                <div class="fg-line">
                    <input type="text" name="tel" class="form-control" placeholder="Telephone" regex="^1(3|4|5|7|8)\d{9}$"/>
                </div>
            </div>

            <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-male"></i>
    		</span>
                <div class="fg-line">
                    <input id="input-password" name="password" type="password" class="form-control" placeholder="Input Password" regex="^\w+"/>
                </div>
            </div>

            <div class="input-group m-b-20">
            <span class="input-group-addon">
                <i class="zmdi zmdi-male"></i>
            </span>
                <div class="fg-line">
                    <input id="input-password-again" type="password" class="form-control" placeholder="Input Password Again" regex="^\w+" />
                </div>
            </div>

            <div class="clearfix"></div>

            <button type="submit" class="btn btn-login btn-danger btn-float" onclick="checkPwd()">
                <i class="zmdi zmdi-arrow-forward"></i>
            </button>

            <ul class="login-navigation">
                <li data-block="#l-login" class="bgm-green" data-ng-click="lctrl.register = 0; lctrl.login = 1">登录</li>
            </ul>
        </form>
    </div>

</div>
</body>

<script src="http://www.jq22.com/jquery/2.1.1/jquery.min.js"></SCRIPT>
<!-- Angular -->
<script src="js/bower_components/angular/angular.min.js"></script>
<script src="js/bower_components/angular-resource/angular-resource.min.js"></script>
<script src="js/bower_components/angular-animate/angular-animate.min.js"></script>


<!-- Angular Modules -->
<script src="js/bower_components/angular-ui-router/release/angular-ui-router.min.js"></script>
<script src="js/bower_components/angular-loading-bar/src/loading-bar.js"></script>
<script src="js/bower_components/oclazyload/dist/ocLazyLoad.min.js"></script>
<script src="js/bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>

<!-- Common js -->
<script src="js/bower_components/angular-nouislider/src/nouislider.min.js"></script>
<script src="js/bower_components/ng-table/dist/ng-table.min.js"></script>

<!-- Placeholder for IE9 -->
<!--[if IE 9 ]>
<script src="js/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
<![endif]-->
<!-- App level -->
<script src="js/app.js"></script>
<script src="js/controllers/main.js"></script>
<script src="js/controllers/ui-bootstrap.js"></script>


<!-- Template Modules -->
<script src="js/modules/form.js"></script>

<script type="text/javascript" src="js/checkPwd.js"></script>
</html>

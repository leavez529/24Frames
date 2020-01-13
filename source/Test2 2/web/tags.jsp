<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tanrui
  Date: 2018/12/19
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tags</title>
    <meta name="description" content="A photography-inspired website layout with an expanding stack slider and a background image tilt effect" />
    <meta name="keywords" content="photography, template, layout, effect, expand, image stack, animation, flickity, tilt" />
    <meta name="author" content="Codrops" />
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/flickity.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script src="js/modernizr.custom1.js"></script>
</head>
<body>
<div class="container">
    <div class="hero">
        <div class="hero__back hero__back--static " id="hero-static"
        style = " background: url('${covers.get(tags.get(0).tag.id)}'); background-size:100% auto "></div>
        <div class="hero__front"></div>
    </div>
    <header class="codrops-header">
        <div class="codrops-links">
            <a class="codrops-icon codrops-icon--prev" href="/logout" title="登出"><span>登出</span></a>
            <a class="codrops-icon codrops-icon--drop" href="/mytags?id=${user.id}" title="个人主页"><span>个人主页</span></a>
        </div>
        <h1 class="codrops-title"><span>我的</span>标签云</h1>
        <nav class="menu">
            <a class="menu__item menu__item--current" href="/mytags?id=${user.id}"><span>${user.username}</span></a>
            <a class="menu__item" href="/search?key="><span>找电影</span></a>
            <a class="menu__item" href="/logout"><span>登出</span></a>
        </nav>
    </header>
    <div class="stack-slider">
        <div class="stacks-wrapper">
            <c:forEach var="tag" items="${tags}">

                <div class="stack">
                    <h2 class="stack-title" onclick="changeHero('${covers.get(tag.tag.id)}')"><a href="#" data-text="${tag.tag.name}"><span>${tag.tag.name}</span></a></h2>
                    <c:forEach var="movie" items="${tag.movies}">
                        <div class="item">
                            <div class="item__content">
                                <img src="${movie.picture}" alt="${movie.movie.name}" />
                                <h3 class="item__title"><a href="/detail?id=${movie.movie.id}">${movie.movie.name}</a> <span class="item__date">${movie.movie.year}</span></h3>
                                <div class="item__details">
                                    <ul>
                                        <li><i class="icon icon-camera"></i><span>${movie.region}</span></li>
                                        <li><i class="icon icon-focal_length"></i><span>${movie.type}</span></li>
                                        <li><i class="icon icon-aperture"></i><span>${movie.movie.year}年</span></li>
                                        <li><i class="icon icon-exposure_time"></i><span>${movie.movie.length}分钟</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
        <!-- /stacks-wrapper -->
    </div>
    <!-- /stacks -->
    <img class="loader" src="img/three-dots.svg" width="60" alt="Loader image" />
</div>
<!-- /container -->
<!-- Flickity v1.0.0 http://flickity.metafizzy.co/ -->
<script src="js/flickity.pkgd.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/main.js"></script>
<script>
    function changeHero(cover){
        var hero = document.getElementById("hero-static");
        var heroMover = document.getElementById("hero-mover");
        hero.style.backgroundImage = "url(" + cover + ")";
        heroMover.style.backgroundImage = "url("+ cover + ")";
    }
</script>
</body>
</html>
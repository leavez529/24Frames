<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tanrui
  Date: 2018/12/20
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>搜索界面</title>
    <meta name="description" content="3D Grid Effect: Recreation of the effect seen in the prototype app by Marcus Eckert | Demo 2" />
    <meta name="keywords" content="3d, grid, effect, flip, css transform, perspective, web design" />
    <meta name="author" content="Codrops" />
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo1.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <style type="text/css">
        .container1 {
            margin: 25px 30%;
        }

        .form-item {
            position: relative;
        }

        .form-item input[type="text"] {
            display: block;
            width: 100%;
            height: 34px;
            font-size: 14px;
            line-height: 1.4;
            color: #9e9e9e;
            background-color: transparent;
            background-image: none;
            border: none;
            border-bottom: 2px solid #ddd;
            padding: 6px 12px 6px 0;
        }

        .form-item input[type="text"]:focus,
        .form-item input[type="text"]:active {
            outline: none;
            box-shadow: none;
        }

        .form-item input[type="text"]:focus~label:before {
            font-size: 12px;
            bottom: 34px;
            color: #48cfad;
        }

        .form-item input[type="text"]:focus~label:after {
            background-repeat: no-repeat;
            background-size: 1000% 1000%;
            background-image: radial-gradient(circle, #48cfad 10%, rgba(0, 0, 0, 0) 11%) !important;
        }

        .form-item input[type="text"]:not(:placeholder-shown)~label:before {
            font-size: 12px;
            bottom: 34px;
        }

        .form-item label:before {
            content: attr(data-label);
            display: block;
            position: absolute;
            left: 0;
            bottom: 6px;
            transition: all .15s ease-in-out;
        }

        .form-item label:after {
            content: '';
            position: absolute;
            display: inline-flex;
            text-decoration: none;
            justify-content: center;
            align-items: center;
            text-align: center;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            transition: all 0.4s ease-in-out;
            background-position: 50%;
            background-size: 200% 200%;
        }
    </style>
    <script>
        function search() {
            var key = document.getElementById('example').value;
            alert(key);
            if (key == null || key === '' || key === ' '){
                alert('搜索词不能为空！');
            }else {
                alert("/search?key=" + key);
                window.location.href = "/search?key=" + key;
            }
        }
    </script>
    <script>
        document.getElementById('example').onclick = function (ev) {
            alert("click");
        }
    </script>
    <script src="js/modernizr.custom2.js"></script>
</head>

<body class="demo-2">
<div class="container">
    <!-- Top Navigation -->
    <div class="codrops-top">
        <a class="codrops-icon codrops-icon-prev" href="/logout"><span>登出</span></a>
        <span class="right"><a class="codrops-icon codrops-icon-drop" href=""><span>谈瑞</span></a></span>
    </div>

    <header class="codrops-header">
        <h1>All You Loved, I Know <span>转到<a href="/tags">标签云</a>页面，查看我的标签</span></h1>
        <nav class="codrops-demos">

        </nav>
        <div class="container1">
            <form method="post" action="/search">
                <div class="form-item">
                    <input type="text" id="example" name="key" placeholder="&nbsp;" style="color: #ffffff; padding-left: 10px;"/>
                    <label for="example" data-label="输入你想搜索的电影名称……"></label>
                </div>
                <%--<p><b><a href="" type="submit">Go!</a></b></p>--%>
                <button type="submit" style="background:none;border:none;">Go!</button>
            </form>

        </div>

    </header>

    <section class="grid3d horizontal" id="grid3d">
        <div class="grid-wrap">
            <div class="grid">
                <c:if test="${result.size() == 0}">
                    没有相关电影哦！
                </c:if>
                <c:forEach var="movie" items="${result}">
                    <figure>
                        <img style="background: url('${movie.backgroud}'); background-repeat: no-repeat; background-size: auto 300px; background-position: center; height: 300px;">
                    </figure>
                </c:forEach>
            </div>
        </div>
        <div class="content">
            <c:forEach var="movie" items="${result}">
                <div>
                    <div class="dummy-img" style="height:100%;">
                        <a href="/detail?id=${movie.id}">
                            <img src="${movie.cover}" style="width: 100%;"/>

                        </a>

                    </div>
                    <p class="dummy-text">
                        ${movie.detail}
                    </p>
                </div>
            </c:forEach>

            <span class="loading"></span>
            <span class="icon close-content"></span>
        </div>
    </section>
    <section>
        <p>想了解更多电影信息:</p>
        <a href="/tags">查看标签广场</a><br />
        <a href="/search?key=">搜索电影</a>
    </section>
</div><!-- /container -->
<script src="js/classie.js"></script>
<script src="js/helper.js"></script>
<script src="js/grid3d.js"></script>
<script>
    new grid3D(document.getElementById('grid3d'));
</script>
</body>

</html>
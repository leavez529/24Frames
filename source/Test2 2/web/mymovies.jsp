<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>我最爱的电影</title>
    <meta charset="utf-8" />
    <link rel="icon" href="favicon.ico">
    <link rel="shortcut icon" href="favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="profile/semantic/dist/semantic.min.css" rel="stylesheet" />
    <link href="profile/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="profile/css/main.css" rel="stylesheet" />
    <link href="profile/plugins/pacejs/pace.css" rel="stylesheet" />
    <link href="profile/css/hjr.css" rel="stylesheet" />

</head>

<body>
    <div id="contextWrap">
        <div class="pusher">
            <!--navbar-->
            <!--maincontent-->
            <div class="mainWrap hjrslide profilepage">
                <div class="ui equal width left aligned padded grid stackable">
                    <!--Site Content-->
                    <div class="sixteen wide tablet sixteen wide computer column profileheader row no-padding">
                        <div class="column  left floated">
                            <div class="ui items">
                                <div class="item">
                                    <a class="ui small circular image">
                                        <img src="${view.avator}" alt="label-image" />
                                        <i class="circle mini red icon avt" data-content="Offline" data-variation="inverted redli"></i>
                                    </a>
                                    <div class="middle aligned content hiddenui">
                                        <div class="header">
                                            <i class="like icon"></i>
                                            ${view.username}
                                        </div>
                                        <div class="meta">
                                            ${view.tel}, <i class="icon map marker"></i> ${view.intro}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="ui menu fluid no-radius borderless stackable" style="margin-top:0">
                        <a href="mytags?id=${view.id}" class="item">Tags</a>
                        <a href="mymovies?id=${view.id}" class="item active red">Movies</a>
                        <a href="/index" class="item">Index</a>
                        <c:if test="${self}">
                            <a href="/tags" class="item">Tag Cloud</a>
                        </c:if>

                        <div class="right menu">
                            <c:choose>
                            <c:when test="${self}">
                            <a class="item" href="/followers">
                                </c:when>
                                <c:otherwise>
                                <a class="item" href="">
                                    </c:otherwise>
                                    </c:choose>
                                    <div class="ui mini statistic">
                                        <div class="value">
                                            ${follower}
                                        </div>
                                        <div class="label">
                                            Followers
                                        </div>
                                    </div>
                                </a><c:choose>
                                <c:when test="${self}">
                                <a class="item" href="/following">
                                    </c:when>
                                    <c:otherwise>
                                    <a class="item" href="">
                                        </c:otherwise>
                                        </c:choose>
                                        <div class="ui mini statistic">
                                            <div class="value">
                                                ${followed}
                                            </div>
                                            <div class="label">
                                                Following
                                            </div>
                                        </div>
                                    </a>
                                    <c:choose>
                                    <c:when test="${self}">
                                    <a class="item" href="/social">
                                        <div class="ui mini statistic">
                                            <div class="value">
                                            </div>
                                            <div class="label">
                                                Activities
                                            </div>
                                        </div>
                                    </a>
                                        </c:when><c:otherwise>
                                    <a class="item" href="/mytags?id=${user.id}">
                                        <div class="ui mini statistic">
                                            <div class="value">
                                            </div>
                                            <div class="label">
                                                回家
                                            </div>
                                        </div>
                                    </a>
                                    </c:otherwise>
                                    </c:choose>
                        </div>
                    </div>

                    <div class="row">
                        <div class="sixteen wide tablet four wide column">
                            <div class="ui segments">
                                <div class="ui segment">
                                    <h5 class="ui header">
                                        我最爱的电影
                                    </h5>
                                </div>
                                <div class="ui segment">
                                    <div class="ui special cards">
                                        <c:forEach var="movie" items="${movies}">
                                            <div class="card">
                                                <div class="blurring dimmable image">
                                                    <div class="ui dimmer">
                                                        <div class="content">
                                                            <div class="center">
                                                                <div class="ui inverted button">
                                                                    <a href="/detail?id=${movie.id}">电影详情</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <img src="${movie.cover}" data-src="${movie.cover}" class="transition visible">
                                                </div>
                                                <div class="content">
                                                    <a class="header">${movie.movie.name}</a>
                                                    <div>
                                                            <span><b>上映时间: </b></span>
                                                            <span>${movie.movie.year}</span>
                                                    </div>
                                                </div>
                                                <div class="extra content">
                                                    <c:choose>
                                                        <c:when test="${movie.type == '爱情'}">
                                                            <a class="ui red tag label">爱情</a>
                                                        </c:when>
                                                        <c:when test="${movie.type == '科幻'}">
                                                            <a class="ui blue tag label">科幻</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="ui teal tag label">${movie.type}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--maincontent-->
        </div>
    </div>
    <!--jquery-->
    <script src="profile/js/jquery-2.1.4.min.js"></script>
    <!--jquery-->
    <!--semantic-->
    <script src="profile/semantic/dist/semantic.min.js"></script>
    <!--semantic-->
    <script src="profile/plugins/cookie/js.cookie.js"></script>
    <script src="profile/plugins/nicescrool/jquery.nicescroll.min.js"></script>

    <script data-pace-options='{ "ajax": false }' src="profile/plugins/pacejs/pace.js"></script>

    <script src="profile/js/main.js"></script>
    <script>
        //some tooltip function
        $(".avt").popup({
            position: "top center"
        });
        //some tooltip function
    </script>
</body>

</html>
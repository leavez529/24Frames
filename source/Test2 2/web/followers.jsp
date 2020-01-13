<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Followers</title>
    <meta charset="utf-8" />
    <link rel="icon" href="favicon.ico">
    <link rel="shortcut icon" href="favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="profile/semantic/dist/lyk_semantic.min.css" rel="stylesheet">
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
                <div class="ui equal width  aligned padded grid stackable">
                    <!--Site Content-->
                    <div class="sixteen wide tablet sixteen wide computer column profileheader row no-padding">
                        <div class="column  left floated">
                            <div class="ui items">
                                <div class="item">
                                    <a class="ui small circular image">
                                        <img src="${user.avator}" alt="label-image" />
                                        <i class="circle mini red icon avt" data-content="Offline" data-variation="inverted redli"></i>
                                    </a>
                                    <div class="middle aligned content hiddenui">
                                        <div class="header">
                                            <i class="like icon"></i>
                                            ${user.username}
                                        </div>
                                        <div class="meta">
                                            ${user.tel}, <i class="icon map marker"></i> ${user.intro}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="ui menu fluid no-radius borderless stackable" style="margin-top:0">
                        <a href="mytags?id=${user.id}" class="item">Tags</a>
                        <a href="mymovies?id=${user.id}" class="item">Movies</a>
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
                                    <c:if test="${self}">
                                    <a class="item" href="/social">
                                        <div class="ui mini statistic">
                                            <div class="value">
                                            </div>
                                            <div class="label">
                                                Activities
                                            </div>
                                        </div>
                                    </a>
                                    </c:if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="sixteen wide tablet thirteen wide computer column">
                            <div class="ui segments">
                                <div class="ui segment">
                                    <h5 class="ui header">
                                        Followers
                                    </h5>
                                </div>
                                <div class="ui segment">
                                    <div class="ui items">
                                        <%----%>
                                        <c:forEach var="f" items="${followerList}">
                                            <div class="ui divider"></div>
                                            <div class="item">
                                                <a class="ui tiny circular image">
                                                    <img src="${f.followed.avator}" alt="label-image" />
                                                </a>
                                                <div class="content">
                                                    <a class="header" href="/mytags?id=${f.followed.id}">${f.followed.username}</a>
                                                    <div class="description">
                                                        <p>${f.followed.intro}
                                                            <c:choose>
                                                                <c:when test="${f.followed.gender == '男'}">
                                                                <a class="ui blue mini label">男
                                                                </c:when><c:otherwise>
                                                                <a class="ui red mini label">女
                                                                    </c:otherwise>
                                                            </c:choose>
                                                        </a>
                                                            <c:choose>
                                                                    <c:when test="${f.love}">
                                                                    <button onclick="cancelFollow('${f.followed.id}')" class="ui right floated red button"><i class="heart icon"></i>已互相关注</button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <button onclick="addFollow('${f.followed.id}')" class="ui right floated button"><i class="heart outline icon"></i>添加关注</button>
                                                                    </c:otherwise>
                                                                    </c:choose>
                                                        </p>

                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                            <script>
                                            function cancelFollow(id) {
                                                $.ajax({
                                                    type:'POST',
                                                    url: '/cancelFollow',
                                                    data:{
                                                        fid:id,
                                                        uid:${user.id}
                                                    },
                                                    complete:function () {
                                                        window.location.href = '/followers'
                                                    }
                                                })
                                            }
                                            function addFollow(id) {
                                                $.ajax({
                                                    type:'POST',
                                                    url: '/addFollow',
                                                    data:{
                                                        fid:id,
                                                        uid:${user.id}
                                                    },
                                                    complete:function () {
                                                        window.location.href = '/followers'
                                                    }
                                                })
                                            }
                                        </script>


                                        <div class="ui divider"></div>
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
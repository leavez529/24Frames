<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tanrui
  Date: 2018/12/21
  Time: 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>我的Tags</title>
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
                    <a href="mytags?id=${view.id}" class="item active red">Tags</a>
                    <a href="mymovies?id=${view.id}" class="item">Movies</a>
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
                    <div class="column">
                        <div class="ui segment">
                            <c:choose>
                                <c:when test="${self}">
                                    <h2>我创建的：</h2>
                                </c:when>
                                <c:otherwise>
                                    <h2>他创建的：</h2>
                                </c:otherwise>
                            </c:choose>

                            <div class="ui five stackable cards">

                                <c:forEach var="tag" items="${mytags}">
                                    <div class="ui card">
                                        <div class="image">
                                            <img src="${tag.cover}" data-src="profile/img/gallery/images1.jpg" class="transition visible">
                                        </div>
                                        <div class="content">
                                            <a class="ui red mini label">${tag.tag.name}</a>
                                            <%--<c:if test="${self}">--%>
                                                <%--<a class="hjr_right_icon">--%>
                                                    <%--<i class="large edit icon modalone"></i>--%>
                                                <%--</a>--%>
                                            <%--</c:if>--%>
                                            <div class="meta">
                                                <span class="date"></span>
                                            </div>
                                            <div class="description">
                                                ${tag.tag.intro}
                                            </div>
                                        </div>
                                        <div class="extra content">
                                            <c:choose>
                                                <c:when test="${self}">
                                                    <a>
                                                        <i class="heart icon"></i> ${tag.tag.love} 人喜欢
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a onclick="addTag('${user.id}','${tag.tag.id}')" >
                                                        <i class="heart icon"></i> ${tag.tag.love} 人喜欢
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>

                                            <%--<c:if test="${self}">--%>
                                                <%--<a class="hjr_right_icon">--%>
                                                    <%--<i class="large trash icon modalfour"></i>--%>
                                                <%--</a>--%>
                                            <%--</c:if>--%>
                                        </div>
                                    </div>
                                </c:forEach>

                                <c:if test="${self}">
                                    <!--这个是创建标签的块，一定要有哦-->
                                    <div class="ui card">
                                        <div class="hjr_center_content">
                                            <!--<a class="ui black mini label">创建标签</a>-->
                                            <button class="ui black button modalone">创建标签</button>
                                            <div class="description">
                                                创建属于你自己的标签
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${self}">
                                    <h2>我爱上的：</h2>
                                </c:when>
                                <c:otherwise>
                                    <h2>他爱上的：</h2>
                                </c:otherwise>
                            </c:choose>
                            <div class="ui five stackable cards">
                                <c:forEach var="tag" items="${loved}">
                                    <div class="ui card">
                                        <div class="image">
                                            <img src="${tag.cover}" data-src="profile/img/gallery/images1.jpg" class="transition visible">
                                        </div>
                                        <div class="content">
                                            <a class="ui red mini label">${tag.tag.name}</a>
                                            <div class="meta">
                                                <span class="date"></span>
                                            </div>
                                            <div class="description">
                                                    ${tag.tag.intro}
                                            </div>
                                        </div>
                                        <div class="extra content">
                                            <c:choose>
                                                <c:when test="${self}">
                                                    <a>
                                                        <i class="heart icon"></i> ${tag.tag.love} 人喜欢
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a onclick="addTag('${user.id}','${tag.tag.id}')" >
                                                        <i class="heart icon"></i> ${tag.tag.love} 人喜欢
                                                    </a>
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
        <!--maincontent-->
    </div>



    <div class="ui standard test modal">
        <form class="ui form segment form1" method="post" action="/submitTag">
            <div class="two fields">
                <div class="field">
                    <label>名称</label>
                    <input name="name" placeholder="为你的Tag起个好听的名字" type="text">
                </div>
                <div class="field" style="z-index:999;height:50px">
                    <label>添加电影</label>
                    <div class="ui icon input">
                        <input id="key" type="text" placeholder="搜索要添加的电影...">
                        <i onclick="searchMovie()" class="circular search link icon"></i>
                    </div>
                </div>
                <script>
                    function searchMovie() {
                        var key = document.getElementById('key').value;
                        if (key != null || key !== ''){
                            $.ajax({
                                type : 'POST',
                                data : {
                                    key : key
                                },
                                url : '/searchFromTag',
                                success : function (data) {
                                    var result = JSON.parse(data);
                                    // alert(result);
                                    for (var i=0; i<result.length; i++){
                                        var name = result[i]['name'];
                                        var element = "<div class=\"field\">\n" +
                                               "<label>" + name + "</label>" + "</div>";
                                        $('#results').append(
                                            element
                                        );

                                    }
                                }
                            })
                        }
                    }
                </script>
            </div>
            <div class="field">
                <label>Tag描述 (不超过120个字符)</label>
                <textarea name="intro" cols="5" placeholder="describe your new tag briefly" type="text" maxlength="120" rows="4"></textarea>
            </div>
            <div id="results" class="five fields">

            </div>
            <div class="actions">
                <button class="ui blue submit button" type="submit">Submit</button>
                <div class="ui black deny button">
                    Cancel
                </div>
            </div>
            <div class="ui error message"></div>
        </form>
    </div>

    <div class="ui small test modal">
        <div class="header">
            Delete The Tag
        </div>
        <div class="content">
            <p>Are you sure you want to delete the tag</p>
        </div>
        <div class="actions">
            <div class="ui negative button">
                No
            </div>
            <div class="ui positive right labeled icon button">
                Yes
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>

</div>
<script>
    function addTag(uid, tid) {
        // alert("addTag");
        $.ajax({
            type:'POST',
            url:'/addTag',
            data:{
                userId : uid,
                tagId : tid
            },
            complete : function () {
                // alert("complete");
                window.location.href = '/mytags?id=' + uid;
            }
        })
    }
</script>
<!--jquery-->
<script src="profile/js/jquery-2.1.4.min.js"></script>
<!--jquery-->
<!--semantic-->
<script src="profile/semantic/dist/semantic.min.js"></script>
<!--semantic-->
<script src="profile/plugins/cookie/js.cookie.js"></script>
<script src="profile/plugins/nicescrool/jquery.nicescroll.min.js"></script>

<script data-pace-options='{ "ajax": false }' src="profile/plugins/pacejs/pace.js"></script>
<script src="profile/js/customjs/custom-modal.js"></script>
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
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
                                        <div class="lyk-fixed-window">
                                        </div>
                                        <img style ="background:url('${tag.cover}');background-position:center;
                                                background-size: auto 150px; background-repeat: no-repeat"  class="transition visible lyk-magic-img">
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
                                        <div class="lyk-fixed-window">
                                            <img style ="background:url('${tag.cover}') ;background-position:center;
                                            background-size: auto 150px; background-repeat: no-repeat" data-src="profile/img/gallery/images1.jpg" class="transition visible lyk-magic-img">
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
        <div class="ui form segment form1">
            <div class="two fields">
                <div class="field">
                    <label>Name</label>
                    <input id="TagName" placeholder="the name of your new tag" type="text">
                </div>
                <div class="field hjr-toggle" style="z-index:999;height:50px">
                    <label>Add movies</label>
                    <div class="ui icon input hjr-toggle">
                        <input type="text" placeholder="Search..." id="key">
                        <i onclick="searchMovie()" class="circular search link icon"></i>
                    </div>
                    <div class="search-result">
                        <ul class="hjr-result-list" id="result-list">
                            <!--search result -->
                            <!--<li class="hjr-result-list-item"><span><b> name </b></span> <span>123</span></li>
                            <li class="hjr-result-list-item"><span><b> name </b></span> <span>123</span></li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="field">
                <label>Discription (no more than 120 words)</label>
                <textarea id="Description" name="maxLength" cols="5" placeholder="describe your new tag briefly" type="text" maxlength="120" rows="4"></textarea>
            </div>
            <div class="two fields">
                <div class="field">
                    <img src="" class="hjr-image" id="imgcover">
                </div>
                <div class="field">
                    <img src="" class="hjr-image" id="imgbackground">
                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <label>上传标签封面</label>
                    <input class="hjr-fileuploader" style="width:1px" type="file" id="TagCover" name='pic' accept="image/*" onchange="submitCover()" />
                    <input id="CoverShow" type="text" placeholder="上传本地文件..." onclick='javascript:document.getElementById("TagCover").click();'>
                </div>
                <div class="field">
                    <label>上传标签背景</label>
                    <input class="hjr-fileuploader" style="width:1px" type="file" id="TagBackground" name='pic' accept="image/*" onchange="submitBackground()"/>
                    <input id="BackgroundShow" type="text" placeholder="上传本地文件..." onclick='javascript:document.getElementById("TagBackground").click();'>
                </div>
            </div>
            <div id="results" class="five fields">
            </div>
            <div class="actions">
                <button class="ui blue submit button" type="submit" onclick="submitTag('${user.id}')">Submit</button>
                <div class="ui black deny button">
                    Cancel
                </div>
            </div>
            <div class="ui error message"></div>
        </div>
    </div>


    <div class="ui small test modal">
        <div class="header">
            删除标签
        </div>
        <div class="content">
            <p>你确定你想要删除该标签</p>
        </div>
        <div class="actions">
            <div class="ui negative button">
                算了，等一下
            </div>
            <div class="ui positive right labeled icon button">
                是的，动手
                <i class="checkmark icon"></i>
            </div>
        </div>
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
<script src="profile/js/customjs/custom-modal.js"></script>
<script src="profile/js/main.js"></script>
<!-- 存储服务 -->
<script src="https://cdn.jsdelivr.net/npm/leancloud-storage@3.11.1/dist/av-min.js"></script>

<script src="profile/js/hjr-debug.js"></script>
<script>
    //some tooltip function
    $(".avt").popup({
        position: "top center"
    });
    //some tooltip function
</script>

<script type="text/javascript">
    (function () {
        var containers = document.getElementsByClassName("lyk-magic-img");
        console.log(containers)
        for (var index = 0; index < containers.length; index++) {
            var img = containers[index];
                if (this.offsetHeight > 150) {
                    this.className+="lyk-thin-img";
                } else {
                    this.className+="lyk-fat-img";
                }

        }
    }());
</script>

</body>

</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>影友圈</title>

                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />

                <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
                <link href="semantic/dist/semantic.min.css" rel="stylesheet" />
                <link href="plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
                <link href="css/mainSocial.css" rel="stylesheet" />
                <link href="plugins/pacejs/pace.css" rel="stylesheet" />
                <link rel="stylesheet" type="text/css" href="css/header.css">
                <link rel="stylesheet" type="text/css" href="css/socialContact.css">

                <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                    crossorigin="anonymous">

                <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
                    crossorigin="anonymous">

                <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
                    crossorigin="anonymous"></script>

                <link rel="stylesheet" type="text/css" href="css/edit-dynamic.css">
            </head>

            <body>
                <div id="header">
                    <div id="icon">

                    </div>

                    <div id="search-bar">
                        <a href="/search?key=">
            <img id="search-pic" src="img/imgLYK/search.png">
        </a>
                    </div>

                    <div id="tools">
                        <a href="/mytags?id=${user.id}">
            <img id="user-pic" src="img/imgLYK/user.png">
        </a>
                        <a href="/logout">
            <img id="menu-pic" src="img/imgLYK/menu.png">
        </a>
                        <!--<img id="dynamic-pic" src="img/imgLYK/dynamic.png">-->
                        <div data-toggle="modal" data-target="#send-dynamic">
                            <img id="dynamic-pic1" src="img/imgLYK/dynamic.png">
                        </div>
                    </div>
                </div>

                <div id="container">
                    <c:forEach var="moment" items="${moments}">
                        <div class="ui  card-change card">
                            <div class="content">
                                <div class="right floated meta">***</div>
                                <img class="ui avatar image" src="${moment.user.avator}"> ${moment.user.username}
                            </div>
                            <c:if test="${moment.cover != null && moment.cover != \" \ "}">
                                <div class="image">
                                    <img src="${moment.cover}" data-src="${moment.cover}" class="transition visible">
                                </div>
                            </c:if>

                            <div class="content">
                                <span class="right floated">
                    <c:choose>
                        <c:when test="${fn:contains(moment.lovers, user.id)}">
                            <i id="like-${moment.id}" type="1" class="heart like icon" onclick="addLike('${user.id}','${moment.id}')">${moment.lovers.size()}</i> likes
                        </c:when>
                        <c:otherwise>
                            <i id="like-${moment.id}" type="0" class="heart outline like icon" onclick="addLike('${user.id}','${moment.id}')">${moment.lovers.size()}</i> likes
                        </c:otherwise>
                    </c:choose>
	            </span>
                                <i id="c-count-${moment.id}" class="comment icon">${moment.commentData.size()}</i> comments
                            </div>
                            <div class="content">
                                <div id="comments-${moment.id}" class="social-comment-list">
                                    <p class="social-comment-item">
                                        <span class="social-comment-userName"><b>${moment.user.username}:</b></span>
                                        <span class="social-comment-content">${moment.moment.content}</span>
                                    </p>
                                    <c:forEach var="comment" items="${moment.commentData}">
                                        <p class="social-comment-item">
                                            <span class="social-comment-userName"><b>${comment.user.username}:</b></span>
                                            <span class="social-comment-content">${comment.comment.content}</span>
                                        </p>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="extra content">
                                <div style="max-width: 100%;width: 100%" class="ui large transparent left icon input">
                                    <i class="chevron right icon"></i>
                                    <input id="content-${moment.id}" type="text" placeholder="添加评论...">
                                </div>
                            </div>
                            <div onclick="addComment('${user.id}','${moment.id}')" class="extra content">
                                <div style="max-width: 100%;width: 100%" class="ui large transparent left icon input">
                                    <i class="reply all icon"></i>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                </div>

                <div class="modal fade" id="send-dynamic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div id="edit-dynamic">
                                    <h2 id="edit-dynamic-title">动态</h2>
                                    <textarea id="edit-dynamic-input" name="content" placeholder="此刻的想法.."></textarea>
                                    <div class="edit-dynamic-select-pic">
                                        <div class="fileinput-button">
                                            <div id="send-dynamic-button">选择图片</div>
                                            <input class="send-dynamic-invis" name="pic" type="file" onchange="showPic(this)">
                                            <span id="pic-num" style="display: none;">0</span>
                                        </div>
                                        <button class="ui primary button">发表</button>
                                    </div>
                                    <div id="pic-list"></div>
                                    <div id="submit-box">
                                        <button class="submit-btn" id="submit-btn" onclick="submitdynamic('${user.id}')">发表</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal -->
                </div>

                <%--添加点赞--%>
                    <script>
                        function addLike(uid, mid) {
                            var i = document.getElementById('like-' + mid);
                            // alert(uid + '-' + mid);
                            var type = i.getAttribute('type');
                            // alert(type);
                            if (type === '1') {
                                // alert(1);
                                $.ajax({
                                    type: 'POST',
                                    url: '/cancelLove',
                                    data: {
                                        userId: uid,
                                        momentId: mid
                                    },
                                    complete: function (data) {
                                        // alert('cancel success');
                                        // alert(i.className);
                                        i.innerText = (parseInt(i.innerText) - 1).toString();
                                        i.setAttribute('type', '0');
                                        i.className = 'heart outline like icon';
                                    }
                                });
                            } else {
                                // alert(0);
                                $.ajax({
                                    type: 'POST',
                                    url: '/addLove',
                                    data: {
                                        userId: uid,
                                        momentId: mid
                                    },
                                    complete: function (data) {
                                        // alert('add success');
                                        // alert(i.className);
                                        i.innerText = (parseInt(i.innerText) + 1).toString();
                                        i.setAttribute('type', '1');
                                        i.className = 'heart like icon';
                                    }
                                });
                            }
                        }

                        function addComment(uid, mid) {
                            var content = document.getElementById('content-' + mid).value;
                            var element;
                            var c_count = document.getElementById('c-count-' + mid);
                            // alert(content);
                            if (content == null || content === '') {

                            } else {
                                $.ajax({
                                    type: 'POST',
                                    url: '/comment',
                                    data: {
                                        userId: uid,
                                        momentId: mid,
                                        content: content
                                    },
                                    complete: function (data) {
                                        element = '<p class="social-comment-item">\n' +
                                            '                            <span class="social-comment-userName"><b>${user.username}:</b></span>\n' +
                                            '                            <span class="social-comment-content">' + content +
                                            '</span>\n' +
                                            '                        </p>';
                                        $('#comments-' + mid).append(element);
                                        document.getElementById('content-' + mid).value = '';
                                        c_count.innerText = (parseInt(c_count.innerText) + 1).toString();
                                    }
                                })
                            }
                        }

                    </script>

                    <!--jquery-->
                    <script src="js/jquery-2.1.4.min.js"></script>
                    <!--jquery-->
                    <!--semantic-->
                    <script src="semantic/dist/semantic.min.js"></script>
                    <!--semantic-->
                    <script src="plugins/cookie/js.cookie.js"></script>
                    <script src="plugins/nicescrool/jquery.nicescroll.min.js"></script>
                <!-- 存储服务 -->
                <script src="https://cdn.jsdelivr.net/npm/leancloud-storage@3.11.1/dist/av-min.js"></script>

                    <script data-pace-options='{ "ajax": false }' src="plugins/pacejs/pace.js"></script>

                    <script src="js/mainSocial.js"></script>

                    <script type="text/javascript" src="js/edit-dynamic.js"></script>

            </body>

            </html>
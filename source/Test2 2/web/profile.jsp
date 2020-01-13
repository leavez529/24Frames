<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>
    <title>Stagb Admin Template</title>
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
                    <a href="profile.jsp" class="item active red">Profile</a>
                    <a href="mytags.html" class="item">Tags</a>
                    <a href="mymovies.jsp" class="item">Movies</a>

                    <div class="right menu">
                        <a class="item" href="followers.jsp">
                            <div class="ui mini statistic">
                                <div class="value">
                                    1.6k
                                </div>
                                <div class="label">
                                    Followers
                                </div>
                            </div>
                        </a>
                        <a class="item" href="following.jsp">
                            <div class="ui mini statistic">
                                <div class="value">
                                    102
                                </div>
                                <div class="label">
                                    Following
                                </div>
                            </div>
                        </a>
                        <a class="item" href="activities.html">
                            <div class="ui mini statistic">
                                <div class="value">
                                    206
                                </div>
                                <div class="label">
                                    Activities
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="sixteen wide tablet ten wide computer column">
                        <div class="ui segment">
                            <div class="ui feed timeline">
                                <c:forEach var="message" items="${messages}">
                                    <div class="event">
                                        <div class="label">
                                            <img src="${message.user.avator}" alt="label-image" />
                                        </div>
                                        <div class="content">
                                            <div class="summary">
                                                <a class="user">
                                                    ${message.user.username}
                                                </a> ${message.message.content}
                                                <div class="date">
                                                    ${message.message.date}
                                                </div>
                                            </div>
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
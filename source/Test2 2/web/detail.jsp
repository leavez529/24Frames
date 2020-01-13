<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset = "UTF-8">
	<title>电影详情</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">

	<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body> 
	<div id="header">
		<div id="icon">
			
		</div>

		<div id="search-bar">
            <a href="/search?key=">
                <img id="search-pic" src="img/imgLYK/search.png">
            </a>
			<!--<input type="text" id="search-input" placeholder="搜索"/>-->
		</div>
		<div id="tools">
            <a href="/mytags?id=${user.id}">
                <img id="user-pic" src="img/imgLYK/user.png">
            </a>
            <a href="/logout">
                <img id="menu-pic" src="img/imgLYK/menu.png">
            </a>
		</div>
	</div>

	<div id="container">
		<div id="main-container">
			<%--<div id="movie-backgroound-filter"></div>--%>
			<div id="movie-background">
				<div id="movie-poster" style="background-image: url('${movieData.backgroud}')">
					<div id="movie-information">
					<div id="movie-detail">
						<p id="movie-important">
							<img src="img/imgLYK/more.png" id="movie-detail-more" data-toggle="modal" data-target="#model-movie-information">
							<span id="movie-name-ch">${movieData.movie.name}</span>&nbsp;&nbsp;
							<span id="movie-time">${movieData.movie.year}</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="addLike()" class="btn btn-info" id="love-it">Love it!</button>
							<%--<img src="img/imgLYK/love.png" id="movie-love" onclick="changeLovePic(this)">--%>
						<script>
							function addLike() {
								$.ajax({
									type : 'POST',
									url : '/addMovieLike',
									data : {
									    movieId: ${movieData.id},
										userId: ${user.id}
									},
									complete: function (data) {
										alert("添加成功！");
                                    }
								})
								var loveIt = document.getElementById("love-it");
								var movieLoved = document.getElementById("movie-loved");
								if(loveIt.innerText == "Love it!"){
								    loveIt.className = "btn btn-danger";
								    loveIt.innerText = "Loved!"
									movieLoved.innerText = parseInt(movieLoved.innerText) + 1;
                                }else{
								    loveIt.className = "btn btn-info";
								    loveIt.innerText = "Love it!";
                                    movieLoved.innerText = parseInt(movieLoved.innerText) - 1;
                                }
                            }
						</script>
						</p>
						<p class="movie-info">地区：<span id="movie-area">${movieData.region}</span></p>
						<p class="movie-info">语言：<span id="movie-language">${movieData.region}语</span></p>
						<p class="movie-info">片长：<span id="movie-duration">${movieData.movie.length}分钟</span></p>
						<p class="movie-info">导演：<span id="movie-director">
							<c:forEach var="director" items="${directors}">
								${director.name}&nbsp;
							</c:forEach>
						</span>
						</p>
						<p class="movie-info">收藏数：<span id="movie-loved">${num}</span></p>
					</div>
				</div>
				</div> 
				
			</div>
			
			<div id="movie-pic-background">
				<div id="movie-pic">
					<h1 id="movie-pic-title">图片墙</h1>
					<div id="movie-pic-waterfall">
						<c:forEach var="pic" items="${pictures}">
							<span class="movie-pic-box">
								<img src="${pic.resource}">
							</span>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<div id="float-buttons" onmouseover="showFloatButtons()" onmouseout="hideFloatButtons()	">
			<div id="float-button">
				<img src="img/imgLYK/float-button.png">
			</div>

			<div id="float-button-music" data-toggle="modal" data-target="#model-music">
				<img src="img/imgLYK/float-music.png">
			</div>

			<div id="float-button-comment" data-toggle="modal" data-target="#model-comment">
				<img src="img/imgLYK/float-comment.png">
			</div>
		</div>

	</div>



	<div class="modal fade" id="model-comment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body">
	            	<div id="movie-comment">
	            		<h2 id="movie-comment-title">评论</h2>
	            		<div id="comment-list">
                            <c:choose>
                                <c:when test="${remarks.size() == 0}">
                                    当前没有评论
                                </c:when>
                            </c:choose>
                            <c:forEach var="remark" items="${remarks}">
                                <div class="comment-item">
                                    <div class="user-id">${remark.username}</div>
                                    <div class="user-comment">${remark.remark.content}</div>
                                    <div class="user-function">
                                        <img src="img/imgLYK/zan.png" onclick="changeZanPic(this)">
                                    </div>
                                </div>
                            </c:forEach>

	            		</div>
	            		<div id="comment-input">
                            <form method="post" action="/remark" style="display:flex;flex-direction: row;align-items: center;width:100%;">
                                <input style="display: none;" name="userId" value="${user.id}"/>
                                <input style="display:none;" name="movieId" value="${movieData.movie.id}"/>
                                <textarea id="input-area" name="content" placeholder="发表你的评论"></textarea>
                                <button id="send-comment" type="submit">发表</button>
                            </form>

	            		</div>
	            	</div>
	            		

	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>

	<div class="modal fade" id="model-music" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body">
	            	<div id="movie-music" >
						<h1 id="movie-music-title">电影原声</h1>
						<div id="movie-music-container">
							<div class="movie-music-item">
								<div class="icon" ><img  ></div>
								<span class="music-name">歌名</span>
								<span class="music-singer">歌手</span>
							</div>

							<div id="music-list">
                                <c:choose>
                                    <c:when test="${musics.size() == 0}">
                                        当前乐库中无音乐
                                    </c:when>
                                </c:choose>
                                <c:forEach var="music" items="${musics}">
                                    <div class="movie-music-item">
                                        <div class="icon" onclick="setAudioPlaySrc('${music.resource}')"><img  src="img/imgLYK/music.png"></div>
                                        <span class="music-name" title="Everything I Need">${music.name}</span>
                                        <span class="music-singer" title="Skylar Grey">${music.artist}</span>
                                    </div>
                                </c:forEach>
							</div>

						</div>
						<audio id="audio-player" src="" controls></audio>
					</div>

	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	<script type="text/javascript" src="js/app_detail.js"></script>
	
	<script>

	</script>
</body>
</html>
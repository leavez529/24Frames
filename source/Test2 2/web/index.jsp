<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="top.guitoubing.util.ConstantDefinition" %>
<%@ page import="top.guitoubing.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title> 24 Frames </title>
		<meta name="description" content="A multi grid layout with an initial fullscreen intro" />
		<meta name="keywords" content="fullscreen image, grid layout, flexbox grid, transition" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/layout-multi.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body>
		<svg class="hidden">
			<g id="icon-grid">
				<rect x="32.5" y="5.5" width="22" height="22"/>
				<rect x="4.5" y="5.5" width="22" height="22"/>
				<rect x="32.5" y="33.5" width="22" height="22"/>
				<rect x="4.5" y="33.5" width="22" height="22"/>
			</g>
			<g id="icon-cross">
				<line x1="4.5" y1="55.5" x2="54.953" y2="5.046"/>
				<line x1="54.953" y1="55.5" x2="4.5" y2="5.047"/>
			</g>
		</svg>
		<nav class="thumb-nav">
			<a data-container="container-1" class="thumb-nav__item" href="#"><img src="img/thumbs/thumb1.png" alt="thumb01" /><span>1</span></a>
			<a data-container="container-2" class="thumb-nav__item" href="#"><img src="img/thumbs/thumb2.png" alt="thumb02" /><span>2</span></a>
			<a data-container="container-3" class="thumb-nav__item" href="#"><img src="img/thumbs/thumb3.png" alt="thumb03" /><span>3</span></a>
		</nav>
		<div id="container-1" class="container theme-1">
			<header class="intro">
				<img class="intro__image" style="background: url('img/background_1.jpg'); background-position: center; background-repeat: no-repeat; background-size: auto 100%;"   alt="Lava"/>
				<div class="intro__content">
					<h1 class="intro__title">爱情片</h1>
					<div class="intro__subtitle">
						<div class="codrops-links">
							<a class="codrops-icon codrops-icon--prev" href="/logout" title="Previous Demo"><span>登出</span></a>
							<a class="codrops-icon codrops-icon--drop" href="/mytags?id=${user.id}" title="Back to the a"><span>个人主页</span></a>
						</div>
						<div class="intro__description">
							<a href="/mytags?id=${user.id}">
								<c:choose>
									<c:when test="${user.username == null || user.username == \"\"}">
										${user.tel}
									</c:when>
									<c:otherwise>
										${user.username}
									</c:otherwise>
								</c:choose>
							</a>：成长，最残酷的部分就是，女孩永远比同年龄的男孩成熟，女孩的成熟，没有一个男孩招架得住。
							<div class="demos">
								<a class="demos__item" href="/tags">我的标签云</a>
							</div>
						</div>
						<button class="trigger">
							<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
								<use class="icon icon--grid" xlink:href="#icon-grid" />
								<use class="icon icon--cross" xlink:href="#icon-cross" />
							</svg>
							<span>更多</span>
						</button>
					</div>
				</div><!-- /intro__content -->
			</header><!-- /intro -->
			<section class="items-wrap">
				<c:forEach var="movie" items="${movies1}">
					<a href="/detail?id=${movie.id}" class="item">
							<img class="item__image" style = " background: url('${movie.picture}');background-size: auto 100%; background-repeat: no-repeat;background-position: center"/>
							<h2 class="item__title">${movie.movie.name}</h2>
					</a>
				</c:forEach>
			</section>
			<section class="related">
				<p>想了解更多电影信息:</p>
				<a href="/tags">查看标签广场</a><br />
				<a href="/search?key=">搜索电影</a>
			</section>
		</div><!-- /container -->
		<div id="container-2" class="container theme-2">
			<header class="intro">
				<img class="intro__image" src="img/background_2.jpg" alt="Road"/>
				<div class="intro__content">
					<h1 class="intro__title">动漫</h1>
					<div class="intro__subtitle">
						<div class="codrops-links">
							<a class="codrops-icon codrops-icon--prev" href="/logout" title="Previous Demo"><span>登出</span></a>
							<a class="codrops-icon codrops-icon--drop" href="/mytags?id=${user.id}" title="Back to the a"><span>个人主页</span></a>
						</div>
						<div class="intro__description">
							<a href="/mytags?id=${user.id}">
								<c:choose>
									<c:when test="${user.username == null || user.username == \"\"}">
										${user.tel}
									</c:when>
									<c:otherwise>
										${user.username}
									</c:otherwise>
								</c:choose>
							</a>：彼方为谁，无我有问。九月露湿，待君之前。

							<div class="demos">
								<a class="demos__item" href="/tags">我的标签云</a>
							</div>
						</div>
						<button class="trigger">
							<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
								<use class="icon icon--grid" xlink:href="#icon-grid" />
								<use class="icon icon--cross" xlink:href="#icon-cross" />
							</svg>
							<span>更多</span>
						</button>
					</div>
				</div><!-- /intro__content -->
			</header><!-- /intro -->
			<section class="items-wrap">
				<c:forEach var="movie" items="${movies2}">
					<a href="/detail?id=${movie.movie.id}" class="item">
						<img class="item__image" src="${movie.picture}" alt="item01"/>
						<h2 class="item__title">${movie.movie.name}</h2>
					</a>
				</c:forEach>
			</section>
			<section class="related">
				<p>想了解更多电影信息:</p>
				<a href="/tags">查看标签广场</a><br />
				<a href="/search?key=">搜索电影</a>
			</section>
		</div><!-- /container -->
		<div id="container-3" class="container">
			<header class="intro">
				<img class="intro__image" src="img/background_3.jpg" alt="Glacier"/>
				<div class="intro__content">
					<h1 class="intro__title">克里斯托弗•诺兰</h1>
					<div class="intro__subtitle">
						<div class="codrops-links">
							<a class="codrops-icon codrops-icon--prev" href="/logout" title="Previous Demo"><span>登出</span></a>
							<a class="codrops-icon codrops-icon--drop" href="/mytags?id=${user.id}" title="Back to the a"><span>个人主页</span></a>
						</div>
						<div class="intro__description">
							<a href="/mytags?id=${user.id}">
								<c:choose>
									<c:when test="${user.username == null || user.username == \"\"}">

									</c:when>
									<c:otherwise>
										${user.username}
									</c:otherwise>
								</c:choose>
							</a>：I believe… whatever doesn’t kill you simply makes you…stranger.
							<div class="demos">
								<a class="demos__item" href="/tags">我的标签云</a>
							</div>
						</div>
						<button class="trigger">
							<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
								<use class="icon icon--grid" xlink:href="#icon-grid" />
								<use class="icon icon--cross" xlink:href="#icon-cross" />
							</svg>
							<span>更多</span>
						</button>
					</div>
				</div><!-- /intro__content -->
			</header><!-- /intro -->
			<section class="items-wrap">
				<c:forEach var="movie" items="${movies3}">
					<a href="/detail?id=${movie.movie.id}" class="item">
						<img class="item__image" src="${movie.picture}" alt="item01"/>
						<h2 class="item__title">${movie.movie.name}</h2>
					</a>
				</c:forEach>
			</section>
			<section class="related">
				<p>想了解更多电影信息:</p>
				<a href="/tags">查看标签广场</a><br />
				<a href="/search?key=">搜索电影</a>
			</section>
		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script>
			(function() {
				var support = { animations : Modernizr.cssanimations },
					animEndEventNames = { 'WebkitAnimation' : 'webkitAnimationEnd', 'OAnimation' : 'oAnimationEnd', 'msAnimation' : 'MSAnimationEnd', 'animation' : 'animationend' },
					animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
					onEndAnimation = function( el, callback ) {
						var onEndCallbackFn = function( ev ) {
							if( support.animations ) {
								if( ev.target != this ) return;
								this.removeEventListener( animEndEventName, onEndCallbackFn );
							}
							if( callback && typeof callback === 'function' ) { callback.call(); }
						};
						if( support.animations ) {
							el.addEventListener( animEndEventName, onEndCallbackFn );
						}
						else {
							onEndCallbackFn();
						}
					};

				var containers = [].slice.call( document.querySelectorAll( '.container' ) ),
					containersCount = containers.length,
					nav = document.querySelector( 'nav.thumb-nav' ),
					pageTriggers = [].slice.call( nav.children ),
					isAnimating = false, current = 0;

				function init() {
					resetScroll();
					// disable scrolling
					window.addEventListener( 'scroll', noscroll );
					// set current page trigger
					classie.add( pageTriggers[ current ], 'thumb-nav__item--current' );
					// set current container
					classie.add( containers[ current ], 'container--current' );
					// initialize events
					initEvents();
				}

				function initEvents() {
					// slideshow navigation
					pageTriggers.forEach( function( pageTrigger ) {
						pageTrigger.addEventListener( 'click', function( ev ) {
							ev.preventDefault();
							navigate( this );
						} );
					} );

					// open each container's content area when clicking on the respective trigger button
					containers.forEach( function( container ) {
						container.querySelector( 'button.trigger' ).addEventListener( 'click', function() {
							toggleContent( container, this );
						} );
					} );

					// keyboard navigation events
					document.addEventListener( 'keydown', function( ev ) {
						var keyCode = ev.keyCode || ev.which,
							isContainerOpen = containers[ current ].getAttribute( 'data-open' ) == 'open';

						switch (keyCode) {
							// left key
							case 37:
								if( current > 0 && !isContainerOpen ) {
									navigate( pageTriggers[ current - 1 ] );
								}
								break;
							// right key
							case 39:
								if( current < containersCount - 1 && !isContainerOpen ) {
									navigate( pageTriggers[ current + 1 ] );
								}
								break;
						}
					} );
				}

				function navigate( pageTrigger ) {
					var oldcurrent = current,
						newcurrent = pageTriggers.indexOf( pageTrigger );

					if( isAnimating || oldcurrent === newcurrent ) return;
					isAnimating = true;

					// reset scroll
					allowScroll();
					resetScroll();
					preventScroll();

					var currentPageTrigger = pageTriggers[ current ],
						nextContainer = document.getElementById( pageTrigger.getAttribute( 'data-container' ) ),
						currentContainer = containers[ current ],
						dir = newcurrent > oldcurrent ? 'left' : 'right';

					classie.remove( currentPageTrigger, 'thumb-nav__item--current' );
					classie.add( pageTrigger, 'thumb-nav__item--current' );

					// update current
					current = newcurrent;

					// add animation classes
					classie.add( nextContainer, dir === 'left' ? 'container--animInRight' : 'container--animInLeft' );
					classie.add( currentContainer, dir === 'left' ? 'container--animOutLeft' : 'container--animOutRight' );

					onEndAnimation( currentContainer, function() {
						// clear animation classes
						classie.remove( currentContainer, dir === 'left' ? 'container--animOutLeft' : 'container--animOutRight' );
						classie.remove( nextContainer, dir === 'left' ? 'container--animInRight' : 'container--animInLeft' );

						// clear current class / set current class
						classie.remove( currentContainer, 'container--current' );
						classie.add( nextContainer, 'container--current' );

						isAnimating = false;
					} );
				}

				// show content section
				function toggleContent( container, trigger ) {
					if( classie.has( container, 'container--open' ) ) {
						classie.remove( container, 'container--open' );
						classie.remove( trigger, 'trigger--active' );
						classie.remove( nav, 'thumb-nav--hide' );
						container.setAttribute( 'data-open', '' );
						preventScroll();
					}
					else {
						classie.add( container, 'container--open' );
						classie.add( trigger, 'trigger--active' );
						classie.add( nav, 'thumb-nav--hide' );
						container.setAttribute( 'data-open', 'open' );
						allowScroll();
					}
				}

				// scroll functions
				function resetScroll() { document.body.scrollTop = document.documentElement.scrollTop = 0; }
				function preventScroll() { window.addEventListener( 'scroll', noscroll ); }
				function allowScroll() { window.removeEventListener( 'scroll', noscroll ); }
				function noscroll() { 
					window.scrollTo( 0, 0 ); 
				}

				init();

				// For Demo purposes only (prevent jump on click)
				[].slice.call( document.querySelectorAll('.items-wrap a') ).forEach( function(el) { el.onclick = function() { return false; } } );
			})();
		</script>
	</body>
</html>
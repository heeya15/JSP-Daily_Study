<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET이란?</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<!-- Note: The "styleN" class below should match that of the banner element. -->
		<header id="header" class="alt style2">
			<a href="index" class="logo"><strong>MISSING</strong> <span>PET</span></a>
			<nav>
				<a href="#menu">메뉴</a>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<li><a href="index">홈</a></li>
				<li><a href="landing">MISSING PET이란?</a></li>
				<li><a href="/Lab-scale/board.do">게시판</a></li>
				<c:choose>
					<c:when test="${sessionScope.active eq 0}">
						<li><a href="${pageContext.request.contextPath}/admin.do">관리자페이지</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="actions vertical">
				<li><a href="javascript:history.back();"
					class="button special fit">돌아가기</a></li>
				<c:choose>
					<c:when test="${not empty sessionScope.sessionID}">   
        ${sessionScope.sessionID}님
        <li><a href="${pageContext.request.contextPath}/logout.do">
								로그아웃 </a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="${pageContext.request.contextPath}/lab_controller/login"
							class="button fit">로그인/회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>


		<!-- Banner -->
		<!-- Note: The "styleN" class below should match that of the header element. -->
		<section id="banner" class="style2">
			<div class="inner">
				<span class="image"> <img src="${pageContext.request.contextPath}/image/pic07.jpg" alt="" />
				</span>
				<header class="major">
					<h1>MISSING PET 이란?</h1>
				</header>
				<div class="content">
					<p>
						Missing pet은 개인 홈페이지로, 반려동물을 잃어버린 분과 유기동물을 보호중인 분들을 위한 인터넷 신고센터 및
						커뮤니티 입니다.<br /> Missing pet은 정부기관/관련사이트가 아닙니다.
					</p>
				</div>
			</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h2>신고/보호/분양/보호</h2>
					</header>
					<p>신고/보호/분양/보호는 MISSING PET에서 제공하는 주 서비스입니다.</p>
				</div>
			</section>

			<!-- Two -->
			<section id="two" class="spotlights">
				<section>
					<a href="/Lab-scale/board.do" class="image"> <img src="${pageContext.request.contextPath}/images/1.jpg"
						alt="" data-position="center center" />
					</a>
					<div class="content">
						<div class="inner">
							<header class="major">
								<h3>신고하기</h3>
							</header>
							<p>
								신고하기는 MISSING PET에서 제공하는 서비스중 하나입니다. <br>잃어버린 반려동물의 위치와 날짜
								및 사진을 게시글에 등록합니다. <br>실시간으로 커뮤니티 회원들과 함께 빠르게 찾을 수 있도록 도와주는
								서비스입니다.
							</p>
							<ul class="actions">
								<li><a href="/Lab-scale/board.do" class="button">해당 게시판으로 이동</a></li>
							</ul>
						</div>
					</div>
				</section>
				<section>
					<a href="/Lab-scale/board.do" class="image"> <img src="${pageContext.request.contextPath}/images/2.jpg"
						alt="" data-position="top center" />
					</a>
					<div class="content">
						<div class="inner">
							<header class="major">
								<h3>보호 중</h3>
							</header>
							<p>
								보호 중은 MISSING PET에서 제공하는 서비스중 하나입니다.<br>현재 보호하고 있는 동물의
								발견장소, 시간 및 사진을 게시글에 등록합니다.
							</p>
							<ul class="actions">
								<li><a href="/Lab-scale/board.do" class="button">해당 게시판으로 이동</a></li>
							</ul>
						</div>
					</div>
				</section>
				<section>
					<a href="/Lab-scale/board.do" class="image"> <img src="${pageContext.request.contextPath}/images/3.jpg"
						alt="" data-position="25% 25%" />
					</a>
					<div class="content">
						<div class="inner">
							<header class="major">
								<h3>입양/분양</h3>
							</header>
							<p>
								입양/분양은 MISSING PET에서 제공하는 서비스중 하나입니다.<br>입양 및 분양을 희망하는 동물의
								종류와 사진 및 특징을 게시글에 등록합니다.
							</p>
							<ul class="actions">
								<li><a href="/Lab-scale/board.do" class="button">해당게시판으로 이동</a></li>
							</ul>
						</div>
					</div>
				</section>
			</section>




		</div>



		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<ul class="icons">
					<li><a href="#" class="icon alt fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon alt fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon alt fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon alt fa-github"><span
							class="label">GitHub</span></a></li>
					<li><a href="#" class="icon alt fa-linkedin"><span
							class="label">LinkedIn</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Untitled</li>
					<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>

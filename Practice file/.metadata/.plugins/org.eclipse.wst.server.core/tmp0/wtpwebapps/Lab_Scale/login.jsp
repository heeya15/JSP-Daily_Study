<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|로그인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"/>
<script src="https://cdn.ckeditor.com/4.14.0/full/ckeditor.js"></script>
</head>
<body>
<!-- Wrapper -->
<div id="wrapper">
<!-- Header -->
<header id="header"> <a href="index" class="logo"><strong>Missing</strong> pet</a>
  <nav> <a href="#menu">메뉴</a> </nav>
  
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
      <c:otherwise><li><a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a></li></c:otherwise>
      </c:choose>
    </ul>
    <ul class="actions vertical">
      <li><a href="javascript:history.back();" class="button special fit">돌아가기</a></li>
   <c:choose>
    <c:when test="${not empty sessionScope.sessionID}">   
        ${sessionScope.sessionID}님
        <li><a href="${pageContext.request.contextPath}/logout.do"> 로그아웃 </a></li>
    </c:when>           
    <c:otherwise><li><a href="${pageContext.request.contextPath}/lab_controller/login" class="button fit">로그인/회원가입</a></li></c:otherwise>
</c:choose>
    </ul>
  </nav>
<!-- Main -->
<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
<div align="center">
<div class="page-header mt-3">
  <h2>로그인</h2>
</div>
<p class="lead">아이디, 비밀번호를 정확히 입력해주세요</p>
<hr>
<body>
<form  action = "" class="pt-3 md-3" style="max-width: 720px" method="POST">
  <div class="form-group">
    <label style=" color: black;">MISSING PET</label>
    <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
      <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
      <g class="ears">
        <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
        <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
      </g>
      <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
      <g class="eyes"> 
        <!-- left eye and eyebrow-->
        <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
        <circle cx="44" cy="55" r="3" fill="#000" />
        <!-- right eye and eyebrow -->
        <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
        <circle cx="76" cy="55" r="3" fill="#000" />
      </g>
      <g class="muzzle">
        <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
        <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
        <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
      </g>
      <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
    </svg><label  style="text-align: start; position: relative; top: 15px; color: black;">아이디 :</label>
    <input name="userId"style="background-color:white; color: black"  type="text" placeholder="ID">
	  <label  style="text-align: start; position: relative; top: 15px;  color: black;"  >비밀번호 :</label>
    <input name="pw" style="background-color:white; color: black" type="password" placeholder="Password">
	  <br>
    <ul class="actions vertical">
      <li style="position: relative; top:15px"><button type="submit" formaction="/Lab-scale/checklogin.do" class="button special fit" method="POST">로그인</button></li>

		<li style="padding : 1"><button type="submit" formaction="userJoin" class="button special fit">회원가입</button></li>
    </ul>
  </div>
</form>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/logincheck.js"></script>



</body>
</div>
</main>
<!-- Footer -->
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/kinds.js"></script>
</body>



</html>


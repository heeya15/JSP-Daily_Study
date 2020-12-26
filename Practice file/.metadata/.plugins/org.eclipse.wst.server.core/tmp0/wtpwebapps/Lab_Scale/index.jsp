<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
</head>
<body>
<form  action = "" class="pt-3 md-3" style="max-width: auto" method="POST">
<!-- Wrapper -->
<div id="wrapper"> 
  
  <!-- Header -->
  <header id="header" class="alt"> <a href="index" class="logo"><strong>Missing</strong> pet</a>
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
     <li><a href="/Lab-scale/admin.do">관리자페이지</a></li>
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

  <!-- Banner -->
  <section id="banner" class="major">
    <div class="inner">
      <header class="major">
        <h1>실시간 실종된 반려동물 신고 사이트</h1>
      </header>
      <div class="content">
        <p>집 밖으로 나간 여러분의 반려동물을<br />
          지금 바로 찾아주세요!</p>
        <ul class="actions">
          <li><a href="#one" class="button next scrolly">시작하기</a></li>
        </ul>
      </div>
    </div>
  </section>
  
  <!-- Main -->
  <div id="main"> 
    
    <!-- One -->
    <section id="one" class="tiles">
      <article> <span class="image"> <img src="${pageContext.request.contextPath}/images/pic01.jpg" alt="" /> </span>
        <header class="major">
          <h3><a href="/Lab-scale/board.do" class="link">찾아요</a></h3>
          <p>실시간 실종 신고</p>
        </header>
      </article>
      <article> <span class="image"> <img src="${pageContext.request.contextPath}/images/pic02.jpg" alt="" /> </span>
        <header class="major">
          <h3><a href="/Lab-scale/board.do" class="link">보호하고 있어요</a></h3>
          <p>실시간 보호 확인</p>
        </header>
      </article>
      <article> <span class="image"> <img src="${pageContext.request.contextPath}/images/pic03.jpg" alt="" /> </span>
        <header class="major">
          <h3><a href="/Lab-scale/board.do" class="link">분양/입양해요</a></h3>
          <p>실시간 분양/입양</p>
        </header>
      </article>
      <article> <span class="image"> <img src="${pageContext.request.contextPath}/images/pic04.jpg" alt="" /> </span>
        <header class="major">
        <c:choose>
        <c:when test="${sessionScope.active eq 0}">
     <h3><a href="/Lab-scale/admin.do">관리자 페이지</a></h3>
      <p>정보/게시글/회원관리</p>
      </c:when>
      <c:otherwise>
      <h3><a href="/Lab-scale/mypage.do" class="link">마이 페이지</a></h3>
      <p>정보/게시글/댓글 관리</p>
      </c:otherwise>
      </c:choose>
        </header>
      </article>
    </section>
    
    <!-- Two -->
    <section id="two">
      <div class="inner">
        <header class="major">
          <h2>Massa libero</h2>
        </header>
        <p>Nullam et orci eu lorem consequat tincidunt vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus pharetra. Pellentesque condimentum sem. In efficitur ligula tate urna. Maecenas laoreet massa vel lacinia pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus amet pharetra et feugiat tempus.</p>
        <ul class="actions">
          <li><a href="#" class="button next">Get Started</a></li>
        </ul>
      </div>
    </section>
  </div>
  
  <!-- Contact --><!-- Footer -->
  <footer id="footer">
    <div class="inner">
      <ul class="icons">
        <li><a href="https://twitter.com/explore" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
        <li><a href="https://www.facebook.com/" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
        <li><a href="https://www.instagram.com/" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
        <li><a href="https://github.com/" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
        <li><a href="https://www.linkedin.com/" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
      </ul>
      <ul class="copyright">
        <li>&copy; 노희도</li>
        <li>MISSING PET</li>
      </ul>
    </div>
  </footer>
</div>

<!-- Scripts --> 



<script src="${pageContext.request.contextPath}/assets/js/logincheck.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</form>
</body>
</html>

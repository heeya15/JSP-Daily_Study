<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|마이페이지(접속이력)</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
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
       <li><a href="index.jsp">홈</a></li>
      <li><a href="landing.jsp">MISSING PET이란?</a></li>
      <li><a href="board.jsp">게시판</a></li>
      <li><a href="mypage.jsp">마이페이지</a></li>
    </ul>
    <ul class="actions vertical">
      <li><a href="#" class="button special fit">돌아가기</a></li>
      <li><a href="login.jsp" class="button fit">로그인/회원가입</a></li>
    </ul>
  </nav>
  <!-- Main -->
  <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
    <div align="center">
      <div class="page-header mt-3">
        <h2>MY PAGE</h2>
      </div>
      <p class="lead">회원의 정보 및 게시글, 댓글을 확인 할 수 있습니다.</p>
      <hr>
      <ul class="actions horizontal">
        <li style="padding : 0"><a href="mypage.jsp" class="button fit">내정보</a></li>
        <li style="padding : 0"><a href="mypage(board).jsp" class="button fit">내 글</a></li>
        <li style="padding : 0"><a href="mypage(comment).jsp" class="button fit">내 댓글</a></li>
      </ul>
		
   </div>
  </main>
  <!-- Footer -->
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
<script src="${pageContext.request.contextPath}/assets/js/kinds.js"></script>
</body>
</html>
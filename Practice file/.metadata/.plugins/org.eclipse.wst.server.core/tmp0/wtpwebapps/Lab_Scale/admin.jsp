<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|관리자회원(정보)</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
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
        <h2>ADMIN PAGE</h2>
      </div>
      <hr>
       <ul class="actions horizontal">
          <li style="padding : 0"><a href="/Lab-scale/admin.do" class="button special fit">회원정보</a></li>
        <li style="padding : 0"><a href="/Lab-scale/board.do" class="button fit">회원게시물</a></li>
        <li style="padding : 0"><a href="/Lab-scale/admin(comment).do" class="button fit">회원댓글</a></li>
      </ul>
      <p class="lead">회원의 정보 및 게시글, 댓글을 확인 할 수 있습니다.</p>
      <form method="POST">
     <table style = "width:80%;">
        <thead>
          <tr>
            <th scope="col" style="width:250px; text-align:center;">회원 아이디</th>
            <th scope="col" style="width:250px; text-align:center;">이름</th>
            <th scope="col" style="width: 250px; text-align: center;">생년월일</th>
            <th scope="col" style="width: 250px; text-align:center;">가입일자</th>
          </tr>
        </thead>
        <tbody style="text-align: center">
          <c:forEach items="${sessionScope.userlist}" var="item" varStatus="status">
          <tr>
            <td><c:out value ="${item.userid}"></c:out></td>
            <td><c:out value ="${item.username}"></c:out></td>
            <td><c:out value ="${item.jumin1}"></c:out></td>
            <td><c:out value ="${item.joinDate}"></c:out></td>
            <td><button type="submit" formaction="/Lab-scale/userdel.do?id=${item.userid}" style="width: 70; text-align: center">삭제</button></td>
          </tr>
           </c:forEach>
        </tbody>
      </table>
     </form>
     
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
<script src="${pageContext.request.contextPath}/assets/js/logincheck.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/kinds.js"></script>
</body>
</html>



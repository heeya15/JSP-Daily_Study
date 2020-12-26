<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|마이페이지(댓글)</title>
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
        <h2>MY PAGE</h2>
      </div>
      <p class="lead">회원의 정보 및 게시글, 댓글을 확인 할 수 있습니다.</p>
      <hr>
      <ul class="actions horizontal">
         <li style="padding : 0"><a href="/Lab-scale/mypage.do" class="button special fit">내정보</a></li>
        <li style="padding : 0"><a href="/Lab-scale/mypage(board).do" class="button fit">내 글</a></li>
        <li style="padding : 0"><a href="/Lab-scale/mypage(comment).do" class="button fit">내 댓글</a></li>
      </ul>
      
      <form method="POST">
       <table style="width: auto;">
            <thead>
              <tr>
                <th scope="col" style="width: 150px; text-align:center;">아이디</th>
                <th scope="col" style="width: 500px; text-align:center;">댓글</th>
                <th scope="col" style="width: 150px; text-align:center;">작성날짜</th>
              </tr>
            </thead>
            <tbody style="text-align: center; font-size: 15px">
              <c:forEach items="${sessionScope.myreplylist}" var="item" varStatus="status">
              <tr>
               <th scope="row" style="text-align:center;"><c:out value ="${item.user_id}"></c:out></th>
                <td><a href="/Lab-scale/boardView.do?no=${item.no}"  style="text-decoration: none color: #FFFFFF;"><c:out value ="${item.reply_content}"></c:out></a></td>
                <td><c:out value ="${item.regdate}"></c:out></td>
                <td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          </form>
		 <ul class="pagination">
      	<c:forEach items="${sessionScope.myreplypaging}" var="item" varStatus="i">
      	<c:if test="${item.startpage gt 1}">  <li class="page-item"> <a class="page-link mobile" href="/Lab-scale/mypage(comment).do?page=1">처음</a></li> </c:if>  		
  		<c:if test="${item.page gt 1}"> <li class="page-item"><a class="page-link mobile" href="/Lab-scale/mypage(comment).do?page=${item.page-1}">이전</a></li> </c:if>
	
		<c:forEach var="j" begin="${item.startpage}" end="${item.endpage}" step="1">
			<c:choose>
			<c:when test = "${j eq page}"> <li class="page-item"><b><a class="page-link mobile" href="/Lab-scale/mypage(comment).do?page=${j}">${j}</a></b></li>  </c:when>
			<c:otherwise>
			<li><a class="page-link mobile" href="/Lab-scale/mypage(comment).do?page=${j}">${j}</a></li>
			</c:otherwise>
		</c:choose>
		</c:forEach>
          </c:forEach>
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

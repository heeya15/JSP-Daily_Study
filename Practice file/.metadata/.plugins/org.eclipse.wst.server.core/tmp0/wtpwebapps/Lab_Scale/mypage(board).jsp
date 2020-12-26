<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|마이페이지(게시글)</title>
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
      <table>
        <thead>
          <tr>
            <th scope="col" style="width:100px; text-align:center;">번호</th>
            <th scope="col" style="width: 150px; text-align: center;">분류</th>
            <th scope="col" style="width: auto; text-align:center;">제목</th>
            <th scope="col" style="width:150px; text-align:center;">작성자</th>
            <th scope="col" style="width:200px; text-align:center;">날짜</th>
          </tr>
        </thead>
        <tbody style="text-align: center">
        <c:forEach items="${sessionScope.mypostlist}" var="item" varStatus="status">
          <tr>
            <th scope="row" style="text-align:center;"><c:out value ="${status.count}"></c:out></th>
            <td><c:out value ="${item.postkind}"></c:out></td>
            <td><a href="/Lab-scale/boardView.do?no=${item.no}"  style="text-decoration: none color: #FFFFFF;"><c:out value ="${item.title}"></c:out></a></td>
            <td><c:out value ="${item.user_id}"></c:out></td>
            <td><c:out value ="${item.regdate}"></c:out></td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
      <ul class="pagination">
      <c:forEach items="${sessionScope.mypostpaging}" var="item" varStatus="i">
      	<c:if test="${item.startpage gt 1}">  <li class="page-item"> <a class="page-link mobile" href="/Lab-scale/mypage(board).do?page=1">처음</a></li> </c:if>  		
  		<c:if test="${item.page gt 1}"> <li class="page-item"><a class="page-link mobile" href="/Lab-scale/mypage(board).do?page=${item.page-1}">이전</a></li> </c:if>
	
		<c:forEach var="j" begin="${item.startpage}" end="${item.endpage}" step="1">
			<c:choose>
			<c:when test = "${j eq page}"> <li class="page-item"><b><a class="page-link mobile" href="/Lab-scale/mypage(board).do?page=${j}">${j}</a></b></li>  </c:when>
			<c:otherwise>
			<li><a class="page-link mobile" href="/Lab-scale/mypage(board).do?page=${j}">${j}</a></li>
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


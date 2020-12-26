<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|게시판|공지작성</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<script src="https://cdn.ckeditor.com/4.14.0/full/ckeditor.js"></script>
<style>
	#delete{
		float:left;
	}
	#delete{
		width:200px;
		margin-left:270px;
		padding:10px;
		margin:right:50px;
	}
	#update{
		width:200px;
		margin-left:100px;
		padding:10px;
	}
	footer{
		clear:both;
	}
</style>
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
        <h2>공지사항</h2>
      </div>
      <hr>
      <form  name="form" onSubmit="return checkAll()" class="pt-3 md-3" style="max-width: 920px" method="post">
       <c:forEach items="${sessionScope.adminlist}" var="item" varStatus="status">
		  <table width="300" border="0">
		  	<tbody>
		     <tr>
		      <td style="width: 30; text-align: center">작성자 : </td>
		      <td style="width: 10">admin1</td>
		      <td style="width: 50">작성날짜 : </td>
		      <td style="width: 190">2020년06월28일</td>
		    </tr>
		  </tbody>
		</table>
         <div class="form-group">
          <label style="text-align: start; ">제목</label>
          <input style="background-color: white; color: black" type="text" name="title" class="form-control" disabled="True" value="${item.title}">
        </div>
        <div class="form-group">
          <label style="text-align: start; ">내용</label>
          <textarea name="etc"  id="story" disabled="true" style="resize: none;">${item.etc}</textarea>
        </div>
      <div id = "delete">
        <c:choose>
        <c:when test="${item.user_id eq sessionScope.sessionID || sessionScope.active eq 0}">   
       	<ul class="actions horizontal">
        <li style="padding : 0"><button type = "submit" formaction="/Lab-scale/boarddel.do?post=${item.no}" style="background-color:aliceblue; color: black" class="button fit">삭제</button></li>
       	</ul>
       	</div>
       <!--<li style="padding : 0"><a style="background-color:aliceblue; color: black" href="/Lab-scale/boardpreupdate.do?post=${item.no}" class="button fit">수정</a></li>--> 
        </c:when>
        </c:choose>
          </c:forEach> 
      <div id = "update">
       <ul class="actions horizontal">
       <li style="padding : 0"><a style="background-color:aliceblue; color: black" href="javascript:history.back();" class="button fit">목록</a></li>
       </ul>
      </div> 
      </form>
     	 <footer class="text-center" style="max-width: 920px;"> </footer>
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
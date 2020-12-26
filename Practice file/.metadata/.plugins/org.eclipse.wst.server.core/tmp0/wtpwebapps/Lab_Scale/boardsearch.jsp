<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|게시판|글작성</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="https://drive.google.com/file/d/1d8YbiIty3zrMnl-6QFeiTOGGJoP74dzG/view" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
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
        <h2>게시판</h2>
      </div>
      <p class="lead">다른 회원들과 자유롭게 소통하세요.</p>
      <hr>
      <c:if test="${sessionScope.active eq 0}">
      <ul class="actions horizontal">
         <li style="padding : 0"><a href="/Lab-scale/admin.do" class="button special fit">회원정보</a></li>
        <li style="padding : 0"><a href="/Lab-scale/board.do" class="button fit">회원게시물</a></li>
        <li style="padding : 0"><a href="/Lab-scale/admin(comment).do" class="button fit">회원댓글</a></li>
      </ul>
      </c:if>
      <table>
        <thead>
          <tr>
            <th scope="col" style="width:100px; text-align:center;">번호</th>
            <th scope="col" style="width:150px; text-align: center;">분류</th>
            <th scope="col" style="width:250px; text-align:center;">제목</th>
            <th scope="col" style="width:150px; text-align:center;">작성자</th>
            <th scope="col" style="width:200px; text-align:center;">날짜</th>
          </tr>
        </thead>
        <c:forEach items="${sessionScope.adminlist}" var="item" varStatus="status">
          <tr>
            <th scope="row" style="text-align:center; width:100;">X</th>
            <td style="width:150px; text-align:center;"><strong>공지사항</strong></td>
            <td style="width:250px; text-align:center;"><a href="/Lab-scale/noticeView.do?no=${item.no}"  style="text-decoration: none color: #FFFFFF;"><strong><c:out value ="${item.title}"></c:out></strong></a></td>
            <td style="width:150px; text-align:center;">관리자</td>
            <td style="width:200px; text-align:center;"><c:out value ="${item.regdate}"></c:out></td>
          </tr>
           </c:forEach>
          <c:forEach items="${sessionScope.postlist}" var="item" varStatus="status">
          <tr>
            <th scope="row" style="text-align:center; width:100;"><c:out value ="${status.count}"></c:out></th>
            <td style="width:150px; text-align:center;"><c:out value ="${item.postkind}"></c:out></td>
            <td style="width:250px; text-align:center;"><a href="/Lab-scale/boardView.do?no=${item.no}"  style="text-decoration: none color: #FFFFFF;"><c:out value ="${item.title}"></c:out></a></td>
            <td style="width:150px; text-align:center;"><c:out value ="${item.user_id}"></c:out></td>
            <td style="width:200px; text-align:center;"><c:out value ="${item.regdate}"></c:out></td>
          </tr>
           </c:forEach>
        </tbody>
      </table>
      <ul class="pagination">
      <c:forEach items="${sessionScope.paginglist}" var="item" varStatus="i">
      	<c:if test="${item.startpage gt 1}">  <li class="page-item"> <a class="page-link mobile" href="/Lab-scale/board.do?page=1">처음</a></li> </c:if>  		
  		<c:if test="${item.page gt 1}"> <li class="page-item"><a class="page-link mobile" href="/Lab-scale/board.do?page=${item.page-1}">이전</a></li> </c:if>
	
		<c:forEach var="j" begin="${item.startpage}" end="${item.endpage}" step="1">
			<c:choose>
			<c:when test = "${j eq page}"> <li class="page-item"><b><a class="page-link mobile" href="/Lab-scale/board.do?page=${j}">${j}</a></b></li>  </c:when>
			<c:otherwise>
			<li><a class="page-link mobile" href="/Lab-scale/board.do?page=${j}">${j}</a></li>
			</c:otherwise>
		</c:choose>
		</c:forEach>
          </c:forEach>
      </ul>
       <div id="searchForm">
        <form>
            <select name="opt">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <option value="3">글쓴이</option>
            </select>
            <input type="text" size="10" name="condition"/>
            <input type="submit" value="검색"/>
        </form>    
    </div>
      <c:choose>
        <c:when test="${sessionScope.active eq 0}"><!--0으로 고처야함 -->
        <div style="max-width: 180px;"> <a href="adminWrite" class="button fit"  >글쓰기</a> </div>
       </c:when>
       <c:otherwise>
      <div style="max-width: 180px;"> <a href="/Lab-scale/boardWrite.do" class="button fit"  >글쓰기</a> </div>
       </c:otherwise>
       </c:choose>
      <footer class="text-center" style="max-width: 1080px;"> </footer>
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
<script>
function postnTr(){
	getElementById("postnTab").toggle("hide");
	if(document.getElementById("postnTab").text() == "내용보기"){
		document.getElementById("postnTab").text("접기");
	}
	else{
		document.getElementById("postnTab").text("내용보기");
	}
}
</script>
</body>
</html>

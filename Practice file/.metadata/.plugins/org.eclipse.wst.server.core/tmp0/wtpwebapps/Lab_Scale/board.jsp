<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|게시판|글작성</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="https://drive.google.com/file/d/1d8YbiIty3zrMnl-6QFeiTOGGJoP74dzG/view" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>

#searchform {
	width: 100%;
}
#div1 {
	margin-top:10px;
	margin-left:455px;
	padding-left:200px;
	width: 15%; 
	padding:5px;
}

#div2 {
	width: 18%; 
	margin-top:10px;
	margin-left:7px;
	padding:5px;
}

#div3 {
	width: 20%; 
	margin-top:10px;
	margin-left:-100px;
	padding:5px;
}
.class_div{
float:left;
	
}

footer{
	clear:both;
	max-width:600px;
}
footer>a{
	width: 180px;
}

</style>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<a href="index" class="logo"><strong>Missing</strong> pet</a>
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

		<!-- Main -->
		<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
			<div align="center">
				<div class="page-header mt-3">
					<h2>
						<a href="/Lab-scale/board.do">게시판</a>
					</h2>
				</div>
				<p class="lead">다른 회원들과 자유롭게 소통하세요.</p>
				<hr>
				<c:if test="${sessionScope.active eq 0}">
					<ul class="actions horizontal">
						<li style="padding: 0"><a href="/Lab-scale/admin.do"
							class="button special fit">회원정보</a></li>
						<li style="padding: 0"><a href="/Lab-scale/board.do"
							class="button fit">회원게시물</a></li>
						<li style="padding: 0"><a href="/Lab-scale/admin(comment).do"
							class="button fit">회원댓글</a></li>
					</ul>
				</c:if>
				<table>
					<thead>
						<tr>
							<th scope="col" style="width: 100px; text-align: center;">번호</th>
							<th scope="col" style="width: 150px; text-align: center;">분류</th>
							<th scope="col" style="width: 250px; text-align: center;">제목</th>
							<th scope="col" style="width: 150px; text-align: center;">작성자</th>
							<th scope="col" style="width: 200px; text-align: center;">날짜</th>
						</tr>
					</thead>

					<c:if test="${param.opt eq 'null'}">
						<c:forEach items="${sessionScope.adminlist}" var="item"
							varStatus="status">
							<tr>
								<th scope="row" style="text-align: center; width: 100;">X</th>
								<td style="width: 150px; text-align: center;"><strong>공지사항</strong></td>
								<td style="width: 250px; text-align: center;"><a
									href="/Lab-scale/noticeView.do?no=${item.no}"
									style="text-decoration: none color: #FFFFFF;"><strong><c:out
												value="${item.title}"></c:out></strong></a></td>
								<td style="width: 150px; text-align: center;">관리자</td>
								<td style="width: 200px; text-align: center;"><c:out
										value="${item.regdate}"></c:out></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:forEach items="${sessionScope.postlist}" var="item"
						varStatus="status">
						<tr>
							<th scope="row" style="text-align: center; width: 100;"><c:out
									value="${status.count}"></c:out></th>
							<td style="width: 150px; text-align: center;"><c:out
									value="${item.postkind}"></c:out></td>
							<td style="width: 250px; text-align: center;"><a
								href="/Lab-scale/boardView.do?no=${item.no}"
								style="text-decoration: none color: #FFFFFF;"><c:out
										value="${item.title}"></c:out></a></td>
							<td style="width: 150px; text-align: center;"><c:out
									value="${item.user_id}"></c:out></td>
							<td style="width: 200px; text-align: center;"><c:out
									value="${item.regdate}"></c:out></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<ul class="pagination">
					<c:forEach items="${sessionScope.paginglist}" var="item"
						varStatus="i">
						<c:if test="${item.startpage gt 1}">
							<li class="page-item"><a class="page-link mobile"
								href="/Lab-scale/board.do?page=1">처음</a></li>
						</c:if>
						<c:if test="${item.page gt 1}">
							<li class="page-item"><a class="page-link mobile"
								href="/Lab-scale/board.do?page=${item.page-1}">이전</a></li>
						</c:if>

						<c:forEach var="j" begin="${item.startpage}" end="${item.endpage}"
							step="1">
							<c:choose>
								<c:when test="${j eq page}">
									<li class="page-item"><b><a class="page-link mobile"
											href="/Lab-scale/board.do?page=${j}">${j}</a></b></li>
								</c:when>
								<c:otherwise>
									<li><a class="page-link mobile"
										href="/Lab-scale/board.do?page=${j}&opt="${param.opt}">${j}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:forEach>
				</ul>

			</div>
			<form>
			<center>
					<form id = "searchForm">
						<div id="div1" class = "class_div">
							<select style="background-color: white; color: black;" name="opt">
								<option value="0">제목</option>
								<option value="1">내용</option>
								<option value="2">제목+내용</option>
								<option value="3">글쓴이</option>
								<option value="4">지역</option>
							</select>
						</div>
		
						<div id="div2" class = "class_div">
							<input type="text" size="10"
								style="background-color: white; color: black;" name="condition" />
						</div>

						<div id="div3" class = "class_div">
							<button type="submit" formaction="/Lab-scale/board.do">검색</button>
						</div>
						
				<footer class="text-center">
				<!-- Footer -->
				<c:choose>
					<c:when test="${sessionScope.active eq 0}">
						<!--0으로 고처야함 -->
						<a href="adminWrite" class="button fit">글쓰기</a>
					</c:when>
					<c:otherwise>
						<a href="/Lab-scale/boardWrite.do" class="button fit">글쓰기</a>
					</c:otherwise>
				</c:choose>
		        </footer>
		
					</form>
					</center>
					</form>
				</div>
				
		</main>

	</div>


	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/kinds.js"></script>
	<script>
		function postnTr() {
			getElementById("postnTab").toggle("hide");
			if (document.getElementById("postnTab").text() == "내용보기") {
				document.getElementById("postnTab").text("접기");
			} else {
				document.getElementById("postnTab").text("내용보기");
			}
		}
	</script>
</body>
</html>

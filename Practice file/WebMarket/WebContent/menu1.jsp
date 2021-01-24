<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%--p, 593 추가
    - 6행: JSP 페이지에 JSTL의 Core 태그를 사용하도록 taglib 디렉티브 태그를 작성.
    --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//아래는 세션에 저장된 세션 속성 이름 [ sessionId의 속성 값을 가져오도록 ] 작성.
	String sessionId = (String) session.getAttribute("sessionId");
%>
	<%-- 웹 페이지 < 메뉴 표시 줄을 표현 >하도록 부트스트랩 css 작성 --%>
	<nav class = "navbar navbar-expand navbar-dark bg-dark">
		<div class = "container">
			<div class = "navbar-header">
				<a class = "navbar-brand" href="../welcome.jsp">Home</a>
			</div>
		</div>	
		
		<div > <%--p, 533쪽. --%>
			<ul class = "navbar-nav mr-auto">
				<%--p,594쪽 22행~40행까지 추가작성. --%>
				<c:choose>
					<c:when test="${empty sessionId}"><%--세션 id가 비어있는경우(속성 값이 없으면) --%>
						<li class="nav-item">
						   <a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인 </a>
						</li>
						<li class="nav-item">
						   <a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">회원 가입</a>
						</li>
					</c:when>
					<c:otherwise> <%--세션 id가 비어있지 않는경우(속성 값이 있으면) --%>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
						<li class="nav-item">
						   <a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃 </a>
						 </li>
						<li class="nav-item">
						   <a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<li class =" nav-item">
					<a class = "nav-link" href="../products.jsp">상품 목록</a>
				</li>
				<li class =" nav-item">
					<a class = "nav-link" href="../addProduct.jsp">상품 등록</a>
				</li>
				<li class =" nav-item">
					<a class = "nav-link" href="../editProduct.jsp?edit=update">상품 수정</a>
				</li>
				<li class =" nav-item">
					<a class = "nav-link" href="../editProduct.jsp?edit=delete">상품 삭제</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="../BoardListAction.do?pageNum=1"/>">게시판</a>
				</li>
			</ul>
		</div>	
	</nav>

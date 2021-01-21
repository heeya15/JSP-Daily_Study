<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--4행:
	- JSP 페이지에 JSTL의 Core 태그를 사용하도록 taglib 디렉티브 태그를 작성.
    --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>JSTL</title>
</head>
<body>
	<%
		String number = request.getParameter("number"); // 폼에서 전송된 number값을 저장.
	%>
	<%--number 변수선언후 , 값을 폼에서 전송된 number 값으로 설정 --%>
	<c:set var="number" value="<%=number %>"/> 
	<c:choose> <%-- p, 578 [ 다중 조건문을 처리 ]할때 사용함 --%>
		<c:when test="${number%2==0 }">
			<c:out value="${number }"/>은 짝수입니다.
		</c:when>
		<%-- <choose>의 서브태그로 "참일때" 수행 --%>
		<c:when test="${number%2==1 }"> 
			<c:out value="${number }"/>은 홀수입니다.
		</c:when>
		<%--p,578 <c:otherwise> 태그는  
		    <choose>의 서브태그로 조건문이 "거짓일때" 수행 --%>
		<c:otherwise>
			숫자가 아닙니다.
		</c:otherwise>
	</c:choose>
</body>
</html>
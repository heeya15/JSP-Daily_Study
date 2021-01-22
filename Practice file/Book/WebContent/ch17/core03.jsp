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
	<h3>구구단</h3>
	<table>
	<c:forEach var="i" begin="1" end="9"> <%--p,578 forEach 태그는 반복문을 처리하는데 사용. --%>
		<tr> <%--한 행-- 총 9행 반복. --%>
			<c:forEach var="j" begin="1" end="9"> 
				<td width=100>${i} *${j }= ${i*j} </td> <%--1행에 각 열로 9개 구구단 계산후  --%>
			</c:forEach>
		</tr>
	</c:forEach>
	</table>
</body>
</html>
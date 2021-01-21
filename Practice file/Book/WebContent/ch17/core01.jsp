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
	<p>browser 변수 값 설정
	<%--browser 변수선언후 , 값을 header['User-Agent']로 설정 --%>
	<c:set var="browser" value="${header['User-Agent']}"/> 
	<br>
	<c:out value="${browser}"/> <%--변수 값을 출력. --%>
	<p>browser 변수 값 제거 후
		<c:remove var="browser"/>	<%--변수 browser 값을 제거 --%>
		<c:out value ="${browser}"/>
</body>
</html>
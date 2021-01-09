<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Exception(예외 처리)</title>
</head>
<body>
	<h2>잘못된 데이터가 입력되었습니다.</h2>
	<p> <%="숫자 1 :"+request.getParameter("num1") %>
	<p> <%="숫자 2 :"+request.getParameter("num2") %>
</body>
</html>
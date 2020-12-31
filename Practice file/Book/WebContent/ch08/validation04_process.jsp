<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Validation(기본 유효성 검사)값이 숫자인지 검사하기 p,268</title>
</head>
<body>
	<h3>입력에 성공했습니다.</h3>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String passwd =request.getParameter("passwd");
	%>
	<p>아이디: <%=id %>
	<p>비밀번호: <%=passwd %>
</body>
</html>
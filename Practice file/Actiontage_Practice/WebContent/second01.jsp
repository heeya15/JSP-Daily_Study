<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag 실습p,115</title>
</head>
<body>
	Today is: <%=request.getParameter("date") %>
	<p>아이디 : <%=request.getParameter("id") %>
	<%
		String name = request.getParameter("name");
	%>
	<%--java.net.URLEncoder.encode() 메소드를 통해 전송된 데이터를 받아서 
	[ 한글이 깨지지 않도록 java.net.URLDecoder.decode() 메소드 사용.  --%>
	<p>이름 : <%=java.net.URLDecoder.decode(name)%></p>
</body>
</html>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<%
	//12행은 설정한 문자열을 출력하도록 out 내장 객체의 [ println()메소드를 작성. ] 
	out.println("오늘의 날짜 및 시각"+"<br>");
	//14행~15행은 [ 오늘의 날짜 및 시각을 출력 ]하도록 out 내장 객체의 println()메소드 작성
	out.println(new Date()+"<br>");
	out.println(Calendar.getInstance().getTime());
	%>	
</body>
</html>
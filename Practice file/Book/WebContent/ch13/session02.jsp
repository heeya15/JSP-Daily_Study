<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%
		/*
		12행은 [ 세션에 저장된 ] [ 세션 속성이름 userID,userPW 를 ]
		session 내장 객체의 getAttribute() 메소드를 통해 [ 속성값을 가져옴 ] 
		*/
		String user_id = (String)session.getAttribute("userID");
		String user_pw = (String)session.getAttribute("userPW");
		
		out.println("설정된 세션의 속성 값 [1] : " + user_id +"<br>");
		out.println("설정된 세션의 속성 값 [2] : " + user_pw );
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Session(p, 430)</title>
</head>
<body>
	<h4>----- 세션을 삭제하기 전 -----</h4>
	<%
		/*
		15행은 [ 세션에 저장된 ] [ 세션 속성이름 userID,userPW 를 ]
		session 내장 객체의 getAttribute() 메소드를 통해 [ 속성값을 가져옴 ] 
		*/
		String user_id = (String)session.getAttribute("userID");
		String user_pw = (String)session.getAttribute("userPW");
		out.println("설정된 세션 이름 userID : " + user_id + "<br>");
		out.println("설정된 세션 값 userPW : " + user_pw + "<br>");
		session.removeAttribute("userID"); // 세션에 저장된 [ 세션 속성 이름 ] userID를 삭제
	%>
	<h4>----- 세션을 삭제한 후 -----</h4>
	<%
		user_id = (String)session.getAttribute("userID");
		user_pw = (String)session.getAttribute("userPW");
		// 세션 속성이름 userID를 삭제하여, 세션 속성이름을 더이상 사용할 수 없어서 null 출력.
		out.println("설정된 세션 이름 userID : " + user_id + "<br>"); 
		out.println("설정된 세션 값 userPW : " + user_pw + "<br>");
	%>
</body>
</html>
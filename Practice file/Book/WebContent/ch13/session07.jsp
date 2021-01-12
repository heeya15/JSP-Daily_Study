<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<h4>----- 세션 유효 시간 변경 전 -----</h4>
	<%
		// getMaxInactiveInterval() 의 세션 유효시간 기본값은 1800초로서 1800/60 = 30분이 된다.
		int time = session.getMaxInactiveInterval() / 60; 
		out.println("세션 유효 시간 : " + time + "분<br>");	
	%>
	<h4>----- 세션 유효 시간 변경 후 -----</h4>
	<%
		session.setMaxInactiveInterval(60*60); // 세션 유효시간 3600초로 설정.
		time = session.getMaxInactiveInterval()/60; //분으로 바꾸기.
		out.println("세션 유효 시간 : " + time + "분<br>");
	%>
</body>
</html>
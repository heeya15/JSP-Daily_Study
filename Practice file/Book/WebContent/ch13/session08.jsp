<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%	// [ P, 421에 ] session과 관련된 메소드 설명 있음.
		String session_id = session.getId();//세션 할당된 [ 고유 ID를 들고옴. ]
				
		long last_time = session.getLastAccessedTime();// 세션에 [ 마지막으로 접근한 시간을 가져옴. ]
				
		long start_time = session.getCreationTime();// [ 세션이 생성된 시간을 가져오도록 ]함. 
		
		long user_time = (last_time - start_time) /6000; // [ 웹 사이트에 머문 시간을 계산 ]
				
		out.println("세션 아이디 : " + session_id + "<br>");
		out.println("세션 요청 시작 시간 : " + start_time + "<br>");
		out.println("세션 요청 마지막 시간 : " + last_time + "<br>");
		out.println("웹 사이트의 경과 시간 : " + user_time + "<br>");
	%>
</body>
</html>
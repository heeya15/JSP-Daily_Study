<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies(); // 모든 쿠키 객체를 가져옴.( 쿠키 정보를 얻어오도록)
	
		out.println("현재 설정된 쿠키의 개수 =>"+cookies.length +"<br>"); // 얻어온 [ 쿠키 정보의 개수를 출력 ].
		out.println("===================================<br>");
		for (int i=0; i< cookies.length; i++){ // 얻어온 쿠키 정보에서 [ 쿠키 이름과 값을 하나씩 출력 ]
		    out.println("설정된 쿠키의 속성 이름: [" + i + "] :" +cookies[i].getName()+"<br>");
		    out.println("설정된 쿠키의 속성 값: [" + i + "] :" +cookies[i].getValue()+"<br>");
		    out.println("----------------------------------------------<br>");
		}
	%>
</body>
</html>
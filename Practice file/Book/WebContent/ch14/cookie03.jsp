<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies(); // 모든 쿠키 객체를 가져옴.( 쿠키 정보를 얻어오도록)
		
		for (int i=0; i< cookies.length; i++){ // 얻어온 쿠키 정보에서 [ 쿠키 이름과 값을 하나씩 출력 ]
		   cookies[i].setMaxAge(0);// 각 쿠키 정보에 [ 유효 기간을 0으로 설정. ] (쿠키를 삭제한다는 뜻.)
		   response.addCookie(cookies[i]);
		}
		response.sendRedirect("cookie02.jsp"); // cookie02.jsp로 이동.
	%>
</body>
</html>
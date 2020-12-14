<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//웹 브라우저에 응답할 오류로 404코드 및 오류 메시지를 출력하도록 sendError() 메소드 사용
		response.sendError(404, "요청 페이지를 찾을 수 없습니다.");
	%>
</body>
</html>
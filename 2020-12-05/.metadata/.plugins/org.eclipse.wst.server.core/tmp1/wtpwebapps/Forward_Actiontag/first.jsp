<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Action Tag</title>
</head>
<body>
	<h3>이 파일을 first.jsp입니다.</h3>
	<%--아래 forward 액션 태그를 만나서 태그에 설정된 페이지로 [ 프로그램의 제어가 이동함 ] --%>
	<jsp:forward page="second.jsp" />
	<p>============first.jsp의 페이지 ===========
</body>
</html>
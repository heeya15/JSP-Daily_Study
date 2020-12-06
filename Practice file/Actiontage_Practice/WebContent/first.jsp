<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<h3>이 파일은 first.jsp입니다.</h3>
	<%--include [ 액션 태그를 만나 ] 하던 작업을 멈추고 프로그램 제어를 second.jsp로 이동. --%>
	<jsp:include page="second.jsp" flush="false"></jsp:include>
	<p>Java Server Page</p>
</body>
</html>
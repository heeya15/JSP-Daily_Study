<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag 실습p,115</title>
</head>
<body>
	<h3>이 파일은 first.jsp입니다.</h3>
	<%--include [ 액션 태그를 만나 ] 하던 작업을 멈추고 프로그램 제어를 second01.jsp로 이동. --%>
	<%--java.net.URLEncoder.encode() 메소드를 사용하여 한글이 깨지지 않도록 함. --%>
	<jsp:include page="second01.jsp" >
		<jsp:param name="date" value ="<%=new java.util.Date() %>"/>
		<jsp:param name="id" value ="admin"/>
		<jsp:param name="name" value ='<%=java.net.URLEncoder.encode("관리자")%>'/>
	</jsp:include>
	<p>Java Server Page</p>
</body>
</html>
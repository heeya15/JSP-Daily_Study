<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean_Action Tag</title>
</head>
<body>
	<%--11행은 자바빈즈로 Person 클래스를 사용하도록 [ useBean 액션 태그를 작성 ] --%>
	<jsp:useBean id="person" class="com.dao.ch1.Person" scope ="request" />
	<p>아이디: <%=person.getId() %>
	<p>이름 : <%=person.getName() %>
</body>
</html>
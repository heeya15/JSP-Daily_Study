<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getProperty_Action Tag</title>
</head>
<body>
	<%-- 11행은 자바빈즈로 Person 클래스를 사용하도록 [ useBean 액션 태그를 작성 ]  --%>
	<jsp:useBean id="person" class = "com.dao.ch1.Person" scope="request"/>
	<%-- useBean 액션 태그 id 속성값을 통해 자바빈즈 Person의 프로퍼티 id와 name에 
	     값을 가져와 출력하도록 getProperty 액션 태그를 작성. --%>
	<p>아이디 : <jsp:getProperty name="person" property="id"/>
	<p>아이디 : <jsp:getProperty name="person" property="name"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set and getProperty_Action Tag</title>
</head>
<body>
	<%-- 11행은 자바빈즈로 Person 클래스를 사용하도록 [ useBean 액션 태그를 작성 ]  --%>
	<jsp:useBean id="person" class= "com.dao.ch1.Person"/>
	<%-- [ useBean 액션태그의 id 속성 값을 통해 ] 자바빈즈 Person의 프로퍼티(변수) 
	     --> id와 name에 [ 새로운 값을 저장 ]하도록 setProperty 액션 태그를 작성.--%>
	<jsp:setProperty name = "person" property="id" value="20182005" />
	<jsp:setProperty name = "person" property="name" value="김현수" />
	<p>아이디 : <jsp:getProperty property="id" name="person"/>
	<p>이름 : <jsp:getProperty property="name" name="person"/>
</body>
</html>
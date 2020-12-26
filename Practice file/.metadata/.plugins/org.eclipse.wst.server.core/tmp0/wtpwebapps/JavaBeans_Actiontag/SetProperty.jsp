<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setProperty_Action Tag</title>
</head>
<body>
	<%--예제 4-9 ) setProperty 액션 태그에 자바빈즈 Person으로 [ 아이디와 이름을 설정 ]하여 출력 --%>
	<%-- 11행은 자바빈즈로 Person 클래스를 사용하도록 [ useBean 액션 태그를 작성 ]  --%>
	<jsp:useBean id="person" class= "com.dao.ch1.Person"  scope="request"/>
	<%-- useBean 액션태그의 id 속성 값을 통해 자바빈즈 Person의 프로퍼티(변수) 
	     id와 name에 값을 저장하도록 setProperty 액션 태그를 작성.--%>
	<jsp:setProperty name = "person" property="id" value="20182005" />
	<jsp:setProperty name = "person" property="name" value="김현수" />
	<%--[ 스크립틀릿 태그로 ] useBean 액션 태그의 id 속성 값을 통해 Person 클래스의 메소드를 호출하여 
	    설정한 id와 name 값을 출력하도록 작성  --%>
	<p><%out.println("아이디 : "+person.getId()); %>
	<p><%out.println("이름 : "+person.getName()); %>
</body>
</html>
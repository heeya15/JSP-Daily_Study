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
	<%
		//아래는 useBean 액션태그에 id속성 값을 통해 Person 클래스의 id와 name에 [ 새로운 값을 저장 ]함
		person.setId(201995007);
		person.setName("강호동");
	%>
	<%--외부파일 useBean03.jsp 내용을 포함하여 출력하도록 
		include 액션태그 page 속성을 작성
	 --%>
	<jsp:include page="useBean03.jsp"/> 
</body>
</html>
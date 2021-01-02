<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼페이지에 입력한 Validation(데이터 형식 유효성 검사) p,274</title>
</head>
<body>
	<h3>입력에 성공했습니다.</h3>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String passwd =request.getParameter("passwd");
		String name =request.getParameter("name");
		String phone1 =	request.getParameter("phone1");
		String phone2 =	request.getParameter("phone2");
		String phone3 =	request.getParameter("phone3");
	%>
	<p>아이디: <%=id %>
	<p>비밀번호: <%=passwd %>
	<p>이름: <%=name %>
	<p>연락처: <%=phone1 %>-<%=phone2 %>-<%=phone3 %>
	<p>이메일: <%=request.getParameter("email") %>
</body>
</html>
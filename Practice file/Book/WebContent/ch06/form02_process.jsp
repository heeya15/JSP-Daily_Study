<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing(폼 데이터 처리)</title>
</head>
<body>
	<%
	//P,196 예제 request 내장 객체의 getParameter()메소드를 호출하여 전송하는 데이터를 받습니다.
	//그 후 [ 표현문 태그 ]에서 폼 페이지에서 전달받은 [ 폼 데이터 값을 출력 ].
		request.setCharacterEncoding("UTF-8");
		String id =	request.getParameter("id");
		String passwd =	request.getParameter("passwd");
		String name = request.getParameter("name");
		String phone1 =	request.getParameter("phone1");
		String phone2 =	request.getParameter("phone2");
		String phone3 =	request.getParameter("phone3");
		String sex = request.getParameter("sex");
		String hobby1 =	request.getParameter("hobby1");
		String hobby2 =	request.getParameter("hobby2");
		String hobby3 =	request.getParameter("hobby3");
		String comment = request.getParameter("comment");		
	%>
	<p> 아이디 : <%=id %>
	<p> 비밀번호 : <%=passwd %>
	<p> 이름 : <%=name %>
	<p> 연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %>
	<p> 성별 : <%=sex %>
	<p> 취미 : <%=hobby1 %> <%=hobby2 %> <%=hobby3 %>
	<p> 가입 인사 : <%=comment %>
</body>
</html>
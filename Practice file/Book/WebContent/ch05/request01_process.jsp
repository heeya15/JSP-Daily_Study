<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<%
	  // 폼 페이지에서 입력한 한글을 처리하도록 request 내장 객체의 setCharacterEncoding() 메소드에 
	  // 문자 인코딩 유형을 utf-8로 작성
	    request.setCharacterEncoding("utf-8");
	  //폼 페이지에서 입력된 아이디와 비밀번호를 request 내장객체의 [ getParameter() 메소드를 작성 ]
		String userid = request.getParameter("id");
		String password = request.getParameter("passwd");
	%>
	<%--[ 폼 문으로 전송받은 아이디와 비밀번호를 출력 ]하도록 [ 표현문 태그를 작성 ] --%>
	<p> 아이디 : <%=userid %>
	<p> 비밀번호 : <%=password %>
</body>
</html>
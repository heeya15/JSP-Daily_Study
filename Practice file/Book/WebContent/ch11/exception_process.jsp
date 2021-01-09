<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--6행: p, 364
	JSP 페이지가 실행되는 도중에 [ 오류 발생하면 오류페이지 호출 ]하도록 
    page 디렉티브 태그에 errorPage 속성을 작성 --%>  
<%@ page errorPage="exception_error.jsp" %>
<html>
<head>
<title>Exception(예외 처리)</title>
</head>
<body>
	<%
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		int n1 = Integer.parseInt(num1);
		int n2 = Integer.parseInt(num2);
		int result = n1/n2;
		out.print(num1 +"/"+num2 + "="+ result);
	%>
</body>
</html>
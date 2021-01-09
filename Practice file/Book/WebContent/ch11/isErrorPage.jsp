<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--6행:
	JSP 페이지가 실행되는 도중에 [ 오류 발생하면 오류페이지 호출 ]하도록 
    page 디렉티브 태그에 errorPage 속성을 작성 --%>    
<%@page errorPage="isErrorPage_error.jsp" %> 
<html>
<head>
<title>Exception(예외 처리)</title>
</head>
<body>
	<%--15행:
		toUpperCase() 메소드는 [ 파라미터 값을 대문자로 변환하여 출력. ] 
		이때 파라미터 name이 존재하지 않아 오류가 발생 --%>
	name 파라미터: <%=request.getParameter("name").toUpperCase() %>
</body>
</html>
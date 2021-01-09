<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- p, 364
    이 속성값이 true이면 [ 현재 JSP 페이지가 **예외 처리 페이지**라는 것을 명시하며 ] 
    [ exception 객체를 이용할 수 있게되어 ] [ 예외에 대한 정보를 얻을 수 있게 ] 됩니다.
 --%>
<%@ page isErrorPage="true" %>
<html>
<head>
<title>Exception(예외 처리)</title>
</head>
<body>
	<h2>오류가 발생하였습니다.</h2>
	<p> 예외 : <%=exception %>
	<p> toString() : <%=exception.toString() %>
	<p> 예외 유형 :<%=exception.getClass().getName() %> <%--오류 발생시 [ 해당 예외 객체 타입을 가져와 ] 출력 --%>
	<p> 오류 메시지 :<%=exception.getMessage() %> <%-- 오류가 발생했을 때 오류 메시지를 가져와 출력 --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--6~7행:
	- JSP 페이지에 JSTL의 Core 태그, functions태그를 사용하도록 taglib 디렉티브 태그를 작성.
    --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>JSTL</title>
</head>
<body>
	<p>java 문자열 검색
	<%--검색 대상문자열 "java"가 포함되어 있는지 확인하도록 <fn:contains>태그 작성. --%>
	<p>Hello, Java Server Pages! => 
	         ${fn:contains("Hello, Java Server Pages!","java")}
     <%--
         - 검색 대상문자열 "java"가 대'소문자 상관없이 
         - 포함되어 있는지 확인하도록 <fn:containsIgnoreCase>태그 작성. --%>
	<p>hello, Java server pages! => 
	         ${fn:containsIgnoreCase("hello, Java server pages!","java")}
</body>
</html>
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
	<c:set var="texts" value="${fn:split('Hello, Java Server Pages!',' ')}"/>
	<%--공백을 기준으로 문자열을 분리하여 총4개. 
		하지만 배열을 인덱스0부터 시작임으로 0,1,2,3이 되서 -->  (문자열길이 -1) 만큼 반복해줘야 함.--%>
	<c:forEach var="i" begin="0" end="${fn:length(texts)-1}">
		<p>text[${i}]=${texts[i]}
	</c:forEach>
	<%--13행에서 < 분리된 > 배열 형태의 문자열을 '-'를 연결하여 반환한다.( 각 공백 사이에 연결한다는것.) --%>
	<p><c:out value="${fn:join(texts, '-')}"/>
</body>
</html>
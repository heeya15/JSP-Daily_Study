<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 출력 담당 View --%>
	<%=request.getAttribute("result") %>입니다.	
	${result}<br> <%--키 값을 괄호안에 넣고, 앞에 달러 표시를 해 주면, 이게 EL이라는 녀석의 표기법이다. --%>
	${names[0]}<br>
	${notice.id} 
	${notice.title }
</body>
</html>
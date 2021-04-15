<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	pageContext.setAttribute("result", "hello");
%>
<body>
	<%-- 출력 담당 View --%>
	<%=request.getAttribute("result") %>입니다.	
	${requestScope.result} <br> <%--키 값을 괄호안에 넣고, 앞에 달러 표시를 해 주면, 이게 EL이라는 녀석의 표기법이다. --%>
	${names[0]}<br>
	${notice.id} 
	${notice.title }<br>
	${result }<br><!-- pageContext에 담은 값도 이렇게 꺼낼 수 있다. -->
	${param.n}<br><!-- 'n'이라는 파라미터 값이 무엇인지 출력. -->
	${header.accept }<br> <!-- Request Headers의 Accept 정보가 출력.  -->
	${param.n ge 3}<br>
	<!-- empty 연산자는 [ 2가지를 다 따져서 반환 ], null이오거나, 값이 전달되지 않은 빈문자열이 와도 '참'이된다.  -->
	${empty param.n ? '값이 비어있습니다.': param.n }<br>
	${param.n/2}<br> 
</body>
</html>
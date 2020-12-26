<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean_Action Tag</title>
</head>
<body>
	<%--11행은 자바빈즈로 Calculator 클래스를 사용하도록 [ useBean 액션 태그를 작성 ] --%>
	<jsp:useBean id="bean" class="com.dao.ch1.Calculator" />
	<%
	/*
	 1. 아래행은 useBean [ 액션태그에 id 속성값을(bean) 통해 ]
	 2. Calculator 클래스의 [ process() 메소드를 호출 ]하여
	 3. 반환된 결과값을 out 내장 객체 변수를 통해 출력하도록 [ 스크립틀릿 태그를 작성 ]
	*/
		int n = bean.process(5); 
		out.print("5의 3제곱은: "+n);
	%>
</body>
</html>
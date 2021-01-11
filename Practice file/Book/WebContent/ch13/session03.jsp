<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%> <%-- Enumeration 객체타입을 사용하기위해 설정. --%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%	
		String name;
		String value;
		Enumeration en =session.getAttributeNames(); //[ 세션 속성 이름을 ] Enumeration 객체 타입으로 반환
		int i = 0;
		
		while(en.hasMoreElements()){ //세션 속성 이름이 있을때 까지 반복.
			i++;
			name =en.nextElement().toString(); //세션 속성의 이름을 가져와(문자열로 형변환 시킴)
			/*
			24 행은 [ 세션에 저장된 ] [ 세션 속성이름 userID,userPW 를 ] name 변수에 저장하여 
			session 내장 객체의 getAttribute() 메소드를 통해 [ 속성값을 가져옴 ] 
	        - (String) cast연산자로 [ 형변환 ] 또는 
	        - .toString()으로 [ 형 변환을 해도 ] 된다.
			*/
			value=(String)session.getAttribute(name); 
			out.println("설정된 세션의 속성 이름 ["+ i +"]:"+ name +"<br>");
			out.println("설정된 세션의 속성 값 ["+ i +"]:"+ value +"<br>");
		}
	%>
</body>
</html>
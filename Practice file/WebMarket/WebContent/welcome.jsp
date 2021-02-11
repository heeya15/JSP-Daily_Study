<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width", initial-scale="1">
     <title>Welcome</title>
</head>
<body>
	<%@ include file = "menu.jsp" %> <%--메뉴 외부파일 [ include 디렉티브 태그 ] 사용 --%>
    <%--12~14행은 [ 각 변수에 문자열을 저장 ]하도록 선언문 태그 작성 --%>
    <%! String first = "웹 쇼핑몰에 오신 것을 환영합니다.";
        String Second = "Welcome to Web Market";%>
        
    <!--16행~21행은 [ 표현문 태그 ]로 변수에 저장한 문자열을 출력하는형태.  -->
    <div class = "jumbotron">
    	<div class = "container">
    		<h1 class= "display-3"><%= first %></h1>
    	</div>
	</div>
	<!-- 30행 ~35행은 웹페이지 본문을 표현하도록 부트스트랩 css작성 -->	
	<div class = "container">
    	<div class = "text-center">
    		<h3><%=Second %></h3> <%--변수 Second값에 저장된 문자열을 출력하도록 [ 표현문 태그 작성 ] --%>
    	</div>
    	<hr>
	</div>	
	<%--30행 부터 45행은 [ 선언문 태그로 현재 접속 시각을 출력하기 위해 ] 작성한 코드.  --%>
	<%
	   response.setIntHeader("Refresh", 5);//5초마다 jsp 페이지가 갱신되도록 작성
	   Date day = new java.util.Date();
	   String am_pm;
	   int hour = day.getHours();
	   int minuts = day.getMinutes();
	   int second = day.getSeconds();
	   if (hour/12==0){
		   am_pm="AM";
	   }
	   else{
		   am_pm="PM";
		   hour= hour-12;
	   }
	   String ct = hour + ":"+minuts +":" + second+" " + am_pm; // 시:분:초 am or pm 형태 문자열을 저장해놓음.    
	%>
	<div class = "container">
		<div class = "text-center">
		<h3>현재 접속 시간 : <%=ct %></h3>
		</div>
	</div>
	
	<%@ include file = "footer.jsp" %> <%--메뉴 외부파일 include 디렉티브 태그 사용 --%>
</body>
</html>
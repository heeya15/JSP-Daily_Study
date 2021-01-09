<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Exception(예외 처리)</title>
</head>
<body>
	<% //스크립틀릿 태그
		try{
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		int n1 = Integer.parseInt(num1);
		int n2 = Integer.parseInt(num2); //정수로 형변환.
		int result = n1/n2;
		out.print(num1 +"/"+num2 + "="+ result);
		}catch(NumberFormatException e){ //[ 부적절한 문자열을 정수로 변환 ]하려 할 때 오류가 발생.
			RequestDispatcher dispatcher = request.getRequestDispatcher("tryCatch_error.jsp");
			/* p, 374
			 - 페이지 호출하는 순간, [ 서블릿 프로그램이 실행을 멈추며 ] 
             - jsp 페이지로 넘어가서 그곳에서 실행하고 프로그램이 끝남.
            */
			dispatcher.include(request, response); 
		}
	%>
</body>
</html>
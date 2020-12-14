<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<%
	  // 폼 페이지에서 입력한 한글을 처리하도록 [ request 내장 객체 ]의 setCharacterEncoding() 메소드에 
	  // [ 문자 인코딩 유형 ]을 utf-8로 작성
	    request.setCharacterEncoding("utf-8");
	  // [ 폼 페이지에서 입력된 아이디와 비밀번호를 ] request 내장객체의 [ getParameter() 메소드를 작성 ]
		String userid = request.getParameter("id");
		String password = request.getParameter("pass");
		//18행에서 23행 까지는 폼 문으로 전송받은 아이디와 비밀번호가 일치하면 성공페이지로 이동, 
		//일치하지 않으면 실패페이지로 이동하는 [ sendRedirect() 메소드 작성 ]
		if(userid.equals("관리자") && password.equals("1234")){
			response.sendRedirect("response01_sucess.jsp");
		}
		else{
			response.sendRedirect("response01_failed.jsp");
		}
	%>	
</body>
</html>
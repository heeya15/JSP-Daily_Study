<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
<%  // 8~9행은 요청 파라미터 [ 아이디와 비밀번호를 전송받음. ]
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("passwd");
	
	if(user_id.equals("admin") && user_pw.equals("1234")){// 아이디와 비밀번호가 일치하면 
		/*
		- [ 쿠키 이름 ] userID, userPW에 [ 값을설정 하도록 Cookie 객체 생성 ]
		- 생성된 Cookie 객체를 [ 쿠키로 저장하도록 ] response내장객체의 addCookie() 메소드작성
		- 쿠키를 생성한 후 **[ 반드시 response 내장 객체의 addCookie() 메소드로 쿠키설정 ]해야함
		*/
		Cookie cookie_id = new Cookie("userID", user_id); 
		Cookie cookie_pw = new Cookie("userPW", user_pw);
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);
		out.println("쿠키 생성이 성공했습니다<br>");
		out.println(user_id +"님 환영합니다.");
	}else{
		out.println("쿠키 생성이 실패했습니다.");
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		/*16행 설명
		- 아이디, 비밀번호 일치시 [ 세션의 속성이름 ] userID,userPW에 
		사용자 아이디, 비밀번호 값을 설정(할당)시킨다.
		- 아이디, 비밀번호 일치 X 시 실패 메시지 출력.
		*/
		if(user_id.equals("admin")&&user_pw.equals("1234")){
			session.setAttribute("userID", user_id);
			session.setAttribute("userPW", user_pw);
			out.println("세션 설정이 성공했습니다.<br>");
			out.println(user_id+"님 환영합니다.");
		}else{
			out.println("세션 설정이 실패했습니다.");
		}
	%>
</body>
</html>
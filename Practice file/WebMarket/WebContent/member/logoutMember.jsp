<%@ page contentType="text/html; charset=utf-8"%>

<%
	session.invalidate(); // 세션에 저장된 [ 모든 세션 속성을 삭제 ]하는 메소드
	response.sendRedirect("loginMember.jsp"); //그후, 로그인 페이지로 강제로 이동시킨다.
%>
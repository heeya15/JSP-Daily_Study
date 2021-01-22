<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>JSTL(p,586) UPDATE 쿼리문 실행</title>
</head>
<body>
	<form action="sql03_process.jsp" method="post">
		<p> 아이디 : <input type="text" name="id"> 
		<p> 비밀번호 : <input type="password" name="passwd">
		<p> 이름 : <input type="text" name="name">
		<p><input type="submit" value="전송">
	</form>
</body>
</html>
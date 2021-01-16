<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%
	Connection conn = null; // null로 초기화 한다.
	try {
		// 오라클 서버에 접속할 정보 정의
		//앞에 (oracle.jdbc.driver)패키지.(OracleDriver)클래스 사용. -- 데이터 베이스 연동하기위해 사용하는것.
		String driver = "oracle.jdbc.driver.OracleDriver"; 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";// 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "scott"; // 사용자 계정
		String pw = "tiger"; // 사용자 계정의 패스워드
		//Class.forName(driver); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		conn = DriverManager.getConnection(url, id, pw); // DriverManager 객체로부터 Connection 객체를 얻어온다.
		out.println("데이터베이스 연결이 성공했습니다."); // 커넥션이 제대로 연결되면 수행된다.

	} catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException :" + ex.getMessage());

	} finally {
		if (conn != null)
			conn.close();
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*" %>
<%
	/*
	● Connection
	- [ 데이터베이스로의 연결 기능을 제공 ]하며, [ Statement 객체를 생성하는 기능 ] 제공
	- 즉, SQL문을 데이터베이스에 전송하거나, 이러한 SQL문을 커밋하거나 롤백하는데 사용
	*/
	Connection conn = null; // null로 초기화 한다., DB와 어플리케이션 간 통신을 할 수 있는 수단
	try {
		// 오라클 서버에 접속할 정보 정의
		//앞에 (oracle.jdbc.driver)패키지.(OracleDriver)클래스 사용. -- < 데이터 베이스 연동하기위해 사용 >하는것.
		String driver = "oracle.jdbc.driver.OracleDriver"; 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";// 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "jisung"; // 사용자 계정
		String pw = "db2019"; // 사용자 계정의 패스워드
		
		/* 25행 드라이버 로딩 P, 517
		 - JDBC 드라이버 로딩되면 [ 자동으로 객체가 생성 ]되고
		 - [ 데이터베이스와 연동하기 위해 ] [ DriverManager 클래스에 등록 ]된다.
		 - JDBC 드라이버 로딩은 [ 프로그램 수행 시 한 번만 ] 필요합니다.
		*/
		Class.forName(driver); 
		/* 29행 
		 - DriverManager 객체로부터 [ 연결된 Connection 객체를 얻어온다. ]
		*/
		conn = DriverManager.getConnection(url, id, pw); 
		//out.println("데이터베이스 연결이 성공했습니다.<br>"); // 커넥션이 제대로 연결되면 수행된다.

	} catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException :" + ex.getMessage());
	}
%>
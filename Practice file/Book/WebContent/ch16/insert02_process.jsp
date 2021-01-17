<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%@ include file="dbconn.jsp" %> <%--해당 데이터베이스에 접속하는 파일. --%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	PreparedStatement pstmt = null; //PreparedStatement 객체를 null로 초기화
	
	try {
		//22행: 테이블의 각 필드에 폼 페이지에 전송된 [ 아이디,비밀번호, 이름을 삽입하도록 insert 문 ] 작성.
		String sql = "INSERT INTO member(id,passwd,name)VALUES(?,?,?)"; 
	
		pstmt  = conn.prepareStatement(sql); // PreparedStatement 객체를 생성
		pstmt.setString(1, id); // 폼페이지에 전송된 id,passwd, name 필드에 [ 정해지지않는 값을 삽입하도록 작성 ].
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		/* 32행:
		   - INSERT 문을 실행하도록 PreparedStatement 객체의 executeUpdate() 메소드 작성.
		   - 여기서는 매개변수 없음. Statement객체의 executeUpdate()메소드에 sql구문을 인수로 넣었음.
		*/
		pstmt.executeUpdate();
		
		out.println("Member 테이블 삽입에 성공했습니다.<br>");// [ 삽입 성공 ]하면 메시지를 출력.
		
	} catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
		out.println("Member 테이블 삽입이 실패했습니다.<br>");
		out.println("SQLException :" + ex.getMessage());
	} finally {
		 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
		 //- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
		if (pstmt != null) //연결이 된경우 
			pstmt.close(); //Statement 객체를 해제
		if (conn != null) //연결이 되면
			conn.close(); //커넥션 객체를 해제
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%@ include file ="dbconn.jsp" %> <%--해당 데이터베이스에 접속하는 파일. --%>
<%
	request.setCharacterEncoding("utf-8"); 
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	ResultSet rs = null; // 각 객체를 null로 초기화.--> Select한 결과를 저장받기위해 선언.
	Statement stmt = null; //Statement 객체를 null로 초기화
	try {
		conn.setAutoCommit(false);  // 오토커밋을 false로 지정한다
		//22행: member 테이블에서 < form에서 입력한 id와 같은 레코드 >를 추출.
		String sql = " SELECT id, passwd FROM member where id = '"+ id + "'"; 
		
		stmt = conn.createStatement(); // Statement 객체를 생성
		rs = stmt.executeQuery(sql); //SELECT 문을 실행할때 executeQuery() 메소드 사용.
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");	
			
			//32행: [ form에서 전송된 id,pw가 ] 테이블에서 읽은 행 id,pw가 일치하는경우 
			if(id.equals(rId) && passwd.equals(rPasswd)){ 
				if (stmt !=null) // <한번 사용하고는> 무조건 연결해제를 해줘야 [ 다시 저장하여 사용이 가능. ]
					stmt.close();
				//37행: 해당 행의 id필드 값을 폼에서 입력받은 [ ID와, pw가 같은경우의 행을 ]. --삭제하겠다
				sql = " DELETE member WHERE id ='"+ id + "'and passwd = '" + passwd + "' "; 
				stmt = conn.createStatement(); // 다시, Statement 객체를 생성
				stmt.executeUpdate(sql); //UPDATE 하기위해 사용.
				conn.commit(); //저장.
				out.println("Member 테이블에 조건에 맞는 행을 삭제했습니다.<br>");// [ 삭제 성공 ]하면 메시지를 출력.
			} //if문 블록 닫음
			else{
				out.println("일치하는 비밀번호가 아닙니다.");
			}
		} //if문 블록 닫음
		else
			out.println("Member 테이블에 일치하는 아이디가 없습니다.");
	}catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
		out.println("Member 테이블 삭제 실패했습니다.<br>");
		out.println("SQLException :" + ex.getMessage());
	} finally {
		 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
		 //- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
		if (rs !=null)
			rs.close();
		if (stmt != null) //연결이 된경우 
			stmt.close(); //Statement 객체를 해제
		if (conn != null) //연결이 되면
			conn.close(); //커넥션 객체를 해제
	}
%>
</body>
</html>
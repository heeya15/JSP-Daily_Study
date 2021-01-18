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
	PreparedStatement pstmt = null; //PreparedStatement 객체를 null로 초기화
	
	try {
		conn.setAutoCommit(false);  // 오토커밋을 false로 지정한다
		//23행: member 테이블에서 < form에서 입력한 id와 같은 레코드 >를 추출.
		String sql = " SELECT id, passwd FROM member where id = ?"; 
		
		pstmt = conn.prepareStatement(sql); // PreparedStatement 객체를 생성
		pstmt.setString(1, id); // 폼페이지에 전송된 [ 정해지지않는 값을 조건에 대입하도록 작성 ].
		/* 31행:
		   - Select 문을 실행하도록 PreparedStatement 객체의 executeQuery() 메소드 작성.
		   - 여기서는 <매개변수 없음>. Statement객체의 executeQuery()메소드에 sql구문을 인수로 넣었음.
		*/
		rs = pstmt.executeQuery(); 
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");	
			
			//33행: [ form에서 전송된 id,pw가 ] 테이블에서 읽은 행 < id,pw가 일치하는경우 > 
			if(id.equals(rId) && passwd.equals(rPasswd)){ 
				if (pstmt != null) //연결이 된경우 
					pstmt.close(); //PreparedStatement 객체를 해제
				//42행: 해당 행의 id필드 값과 폼에서 입력받은 [ ID와, pw가 같은경우의 행을 ]. --삭제하겠다
				sql = "DELETE member WHERE id = ? AND passwd = ? "; 
				pstmt = conn.prepareStatement(sql); // 다시, PreparedStatement 객체를 생성
				pstmt.setString(1, id); // 폼페이지에 전송된 [ 정해지지않는 값을 조건에 대입하도록 작성 ].
				pstmt.setString(2, passwd);
				pstmt.executeUpdate(); //UPDATE 하기위해 사용.
				conn.commit(); //저장.
				out.println("Member 테이블에 조건에 맞는 행을 삭제했습니다.<br>");// [ 삭제 성공 ]하면 메시지를 출력.
			} //if문 블록 닫음
			else{
				out.println("일치하는 비밀번호가 아닙니다.");
			}
		} //가장 밖의 if문 블록 닫음
		else
			out.println("Member 테이블에 일치하는 아이디가 없습니다.");
	}catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
		out.println("Member 테이블에 원하는행 삭제 실패했습니다.<br>");
		out.println("SQLException :" + ex.getMessage());
	} finally {
		 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
		 //- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
		if (rs !=null)
			rs.close();
		if (pstmt != null) //연결이 된경우 
			pstmt.close(); //PreparedStatement 객체를 해제
		if (conn != null) //연결이 되면
			conn.close(); //커넥션 객체를 해제
	}
%>
</body>
</html>
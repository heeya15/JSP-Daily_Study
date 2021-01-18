<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%@ include file ="dbconn.jsp" %>
<table width ="300" border =1>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
<%
	ResultSet rs = null;   // 각 객체를 null로 초기화.--> Select한 결과를 저장받기위해 선언.
	PreparedStatement pstmt = null;  //PreparedStatement 객체를 null로 초기화
	try {
			//20행: 테이블의 모든 필드 값을 가져오도록 작성
			String sql = "SELECT * FROM MEMBER"; 
			pstmt  = conn.prepareStatement(sql); // PreparedStatement 객체를 생성
			rs = pstmt.executeQuery(sql); //SELECT 문을 실행할때 executeQuery() 메소드 사용.
			
			while(rs.next()){// 첫행 부터 다음행으로 커서를 넘기면서 (다음행이 없을때 종료)
				String id = rs.getString("id");
				String pw = rs.getString("passwd");
				String name = rs.getString("name");		
%>
		<%-- 아래는 각행의 필드값을 가져와서 출력. --%>
		<tr>
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
		</tr>
	
<% 		   } //while문 닫는 블록.				
		} catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException :" + ex.getMessage());
		} finally {
			 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
			//- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
			if (rs !=null)
				rs.close();
			if (pstmt != null) //연결이 된경우 
				pstmt.close(); //Statement 객체를 해제
			if (conn != null) //연결이 되면
				conn.close(); //커넥션 객체를 해제
			}
%>
</table>
</body>
</html>
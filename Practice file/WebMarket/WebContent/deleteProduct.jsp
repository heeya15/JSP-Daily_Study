<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*"%>

<%@ include file="dbconn.jsp"%><%--해당 데이터베이스에 접속하는 파일. --%>
<%
	String productId = request.getParameter("id");	
	
	PreparedStatement pstmt = null; //PreparedStatement 객체를 null로 초기화
	ResultSet rs = null; // 각 객체를 null로 초기화.--> Select한 결과를 저장받기위해 선언.
	try {
		String sql = "select * from product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		if (rs.next()) {
			sql = "delete from product where p_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.executeUpdate();
		} else
			out.println("일치하는 상품이 없습니다");
	}catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
		out.println("Product 테이블에 데이터 삭제를 실패했습니다.<br>");
		out.println("SQLException :" + ex.getMessage());
	} finally {
		 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
		 //- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
		if (rs != null)
			rs.close();
		if (pstmt != null) //연결이 된경우 
			pstmt.close(); //Statement 객체를 해제
		if (conn != null) //연결이 되면
			conn.close(); //커넥션 객체를 해제
			
		response.sendRedirect("editProduct.jsp?edit=delete");
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<%--include [ 액션 태그를 만나 ] 하던 작업을 멈추고 프로그램 제어를 menu.jsp로 이동. --%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%><%--해당 데이터베이스에 접속하는 파일. --%>
			<%
				PreparedStatement pstmt = null; //PreparedStatement 객체를 null로 초기화
			    ResultSet rs = null; // 각 객체를 null로 초기화.--> Select한 결과를 저장받기위해 선언.
			    try {
					String sql = "SELECT * FROM product";
					pstmt = conn.prepareStatement(sql); // PreparedStatement 객체를 생성
					rs = pstmt.executeQuery(); //SELECT 문을 실행할때 executeQuery() 메소드 사용.

					while (rs.next()) {// SELECT문으로 가져온 첫행 부터 다음행으로 커서를 넘기면서 (다음행이 없을때 종료)
			%>
			<%--[ 아래 div태그 안에 행은 ] 상품명, 상품 상세정보, 상품 가격을 출력하는 [ 표현문 태그 ] --%>
			<div class="col-md-4">
				<%-- p, 554 아래 img 태그는 아래 경로에 저장된 상품 이미지를 출력하기 --%>
				<img src="./upload/<%=rs.getString("p_fileName")%>" style="width: 100%" />
				<%-- p, 535 getXXX -->필드의 값을 설정한XXX형태로 가져옵니다. --%>
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getInt("p_unitprice")%>원 
				<%--p,173 [ 상품 상세정보 버튼 ]만들기 부분
    			&raquo는 [ HTML 특수문자 ] ">>"기호를 만들어 준다. --%>
				<p>
					<a href="product.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
			</div>
			<%
					} // 30행 while문(반복문) 블록 닫는 [ 스크립틀릿 태그 작성 ]
				} 
			    catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
					out.println("Product 테이블 호출이 실패했습니다.<br>");
				    out.println("SQLException :" + ex.getMessage());
				} 
			    finally {
					//-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다(해제) ]. ]
					//- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
					if (rs != null)
						rs.close();
					if (pstmt != null) //연결이 된경우 
						pstmt.close(); //Statement 객체를 해제
					if (conn != null) //연결이 되면
						conn.close(); //커넥션 객체를 해제
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
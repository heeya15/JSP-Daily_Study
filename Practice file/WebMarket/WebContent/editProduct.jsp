<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!") == true) // 해당 메시지 선택창을 띄웁니다.(삭제한다고 할경우)
			location.href = "./deleteProduct.jsp?id=" + id; // 해당id로 상품 삭제페이지로 이동시킨후 상품을 삭제한다.
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit"); //요청 파라미터 edit 값을 전달받도록 작성.
%>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%><%--해당 데이터베이스에 접속하는 파일. --%>
			<%
				PreparedStatement pstmt =null; //PreparedStatement 객체를 null로 초기화
				ResultSet rs =null; // 각 객체를 null로 초기화.--> Select한 결과를 저장받기위해 선언.
				
				String sql = "SELECT * FROM product"; // 상품 데이터 조회 쿼리문.
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(); // SELECT문을 실행하도록 작성.
				while (rs.next()){ // SELECT문으로 가져온 레코드가 있을때까지 반복.
			%>
			<div class="col-md-4">
				<img src="./upload/<%=rs.getString("p_fileName")%>" style="width: 100%" />
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getInt("p_UnitPrice")%>원
				<p><%
					  if(edit.equals("update")) { //edit값이 update인경우 <수정> 버튼을 출력
					%>
					<a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>"	
					   class="btn btn-success" role="button"> 수정 &raquo;></a>
					<%
					  }//48행: if문 블록 닫기
					  else if (edit.equals("delete")) { // edit값이 delete인경우 <삭제> 버튼을 출력.
					%>
						<%--p, 567~ 568 [ 상품 편집 페이지 작성 ]. 
						  - <삭제> 버튼을 클릭하면 핸들러함수 
						  --%>
						<a href="#" onClick="deleteConfirm('<%=rs.getString("p_id")%>')" 
						   class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						} //54행: else if 블록 닫기.
					%>						
			</div>
			<%
				}
				 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
				 //- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
				if (rs !=null)
					rs.close();
				if (pstmt != null) //연결이 된경우 
					pstmt.close(); //PreparedStatement 객체를 해제
				if (conn != null) //연결이 되면
					conn.close(); //커넥션 객체를 해제
	 		%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String productId = request.getParameter("id");
	
		PreparedStatement pstmt =null; //PreparedStatement 객체를 null로 초기화 
		ResultSet rs =null; // 각 객체를 null로 초기화.--> Select한 결과를 저장받기위해 선언.
	
		String sql = "SELECT * FROM PRODUCT WHERE p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload/<%=rs.getString("p_fileName")%>" alt="image"
					style="width: 100%" />
			</div>
			
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					
					<div class="form-group row">
						<label class="col-sm-2">상품 코드</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId"
								class="form-control" value='<%=rs.getString("p_id")%>'>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control"
								value="<%=rs.getString("p_name")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice"
								class="form-control" value="<%=rs.getInt("p_unitprice")%>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">상세 설명</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control"><%=rs.getString("p_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제조사</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control"
								value="<%=rs.getString("p_manufacturer")%>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control"
								value="<%=rs.getString("p_category")%>">
						</div>
					</div>
					<%-- Oracle이여서 그런지 Long 데이터형을 설정한 long형이나, int형으로 가져올때 에러가난다.
					    - 그래서, 결국 <재고수 필>드 데이터 타입을 INTEGER로 바꾼뒤 해보니 에러가 안뜬다. 
					    --%>
					<div class="form-group row">
						<label class="col-sm-2">제고 수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock1" name="unitsInStock"
								class="form-control" value="<%=rs.getInt("p_unitsinstock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상태</label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New "> 신규 제품 
							<input type="radio" name="condition" value="Old"> 중고 제품 
							<input type="radio" name="condition" value="Refurbished"> 재생 제품
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="상품수정">
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<%
		}
		 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
		 //- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
		if (rs != null)
			rs.close();
		if (pstmt != null) //연결이 된경우 
			pstmt.close(); //Statement 객체를 해제
		if (conn != null) //연결이 되면
			conn.close(); //커넥션 객체를 해제
 	%>
</body>
</html>

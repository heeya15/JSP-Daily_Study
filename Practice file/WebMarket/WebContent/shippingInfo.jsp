<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>배송 정보</title> <%--p,464 ~ 465 --%>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">배송 정보</h1>
		</div>
	</div>

	<div class="container">
	<%-- [ 등록 ] 버튼을 누르면  --> 배송 정보 처리 페이지( 서버) 로 전달.
		입력 양식에 입력된 데이터를 [ 서버로 전송하여 폼 데이터를 처리 ]하도록 작성 --%>
		<form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
		<%-- 23행은:
			 - 장바구니 id값을 숨겨서 전달하도록 type 속성값을 hidden으로 작성.
			 - value 속성 값은 [ 장바구니 아이디cartId를 전송받도록 ] 작성. --> 나중에 주문 완료후 [ 주문번호로 쓰임. ]
		--%>
			<input type="hidden" name="cartId" value="<%= request.getParameter("cartId") %>"/>
			<div class="form-group row">  <%--하나의 행의 레이아웃 영역. --%>
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input name="shippingDate" type="text" class="form-control"/>(yyyy/mm/dd)
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">국가명</label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="addressName" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
			 <%-- 이전, 등록, 취소 버튼을 작성. <이전> 버튼을 누르면 [ 이전 장바구니id를 통해 ] 장바구니 페이지로 이동. --%>
			  <div class="col-sm-offset-2 col-sm-10">
				 <a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" 
				 class="btn btn-secondary" role="button"> 이전</a>
				 <input type="submit" class="btn btn-primary" value="등록"/>
				 <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
			  </div>
			</div>		
		</form>
	</div>
</body>
</html>
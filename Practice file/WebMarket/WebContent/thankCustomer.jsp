<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body>
<% //p, 470 <주문 완료 페이지 >
	request.setCharacterEncoding("UTF-8"); // [ 세션의 고유한 내장 객체의 아이디 ]를 가져옴.
	
	String cartId = session.getId();
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();  // p,458 모든 쿠키 객체를 가져옴.( 쿠키 정보를 얻어오도록)
	
	if(cookies != null){ // 쿠키가 존재한다면 
		for(int i=0; i<cookies.length; i++){  // 얻어온 쿠키 정보에서 
			Cookie thisCookie = cookies[i]; 
			String n = thisCookie.getName();  // 설정된 [ 쿠키 속성이름을 ] 문자열로 반환
			if(n.equals("Shipping_cartId")) // 장바구니 id인경우
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("Shipping_shippingDate")) // 배송일인 경우 [ 쿠키 속성 값을 가져와 저장. ]
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">주문 완료</h1>
		</div>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p> 주문은 <% out.println(shipping_shippingDate); %>에 배송될 예정입니다!
		<p> 주문 번호 : <% out.println(shipping_cartId); %>
	</div>
	
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
	</div>	
</body>
</html>
<%
	session.invalidate(); // 세션에 저장된 장바구니 정보를 [ 모두 삭제함 ]
	
	/*
	- 아래 for문은 쿠키에 저장된 배송 정보를 모두 삭제하도록 Cookie 객체의 
	- setMaxAge() 메소드에 [ 유효 기간을 0으로 설정. ]
	*/
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0); // 각 쿠키 정보에 [ 유효 기간을 0으로 설정. ] (쿠키를 삭제한다는 뜻.)
		if(n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
	}
%>
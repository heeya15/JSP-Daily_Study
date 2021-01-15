<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<% //p, 467 (주문 정보 페이지)
	request.setCharacterEncoding("UTF-8");
	
	String cartId = session.getId(); // [ 세션의 고유한 내장 객체의 아이디 ]를 가져옴.
	
	String shipping_cartId = ""; //장바구니 id
	String shipping_name = ""; //성명
	String shipping_shippingDate = ""; //배송일
	String shipping_country = ""; //국가
	String shipping_zipCode = ""; // 우편번호
	String shipping_addressName = ""; //주소
	
	Cookie[] cookies = request.getCookies(); // p,458 모든 쿠키 객체를 가져옴.( 쿠키 정보를 얻어오도록)
	if(cookies != null){ // 쿠키가 존재한다면 
		for(int i=0; i<cookies.length; i++){ // 얻어온 쿠키 정보에서 
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName(); // 설정된 [ 쿠키 속성이름을 ] 문자열로 반환
			/*
			 - [ 쿠키 속성이름과 ] 'Shipping_cartId ' 동일한 경우. 
			 - shipping_cartId 문자열 변수에 [ ** 쿠키 속성 값 **을 저장 ]
			*/
			if(n.equals("Shipping_cartId")) 
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	} //if문 닫는 블록.
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">주문정보</h1>
		</div>
	</div>
	
	<div class="container col-8 alert alert-info">
		<div class="container">
			<h1 class="display-3">영수증</h1>
		</div>
		<%--62행 ~73행은 [ 얻어온 쿠키 정보중에서 ] 성명, 우편번호,주소, 배송일을 출력하도록 작성. --%>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송주소</strong>
				<br> 성명 : <% out.println(shipping_name); %>
				<br> 우편번호 : <% out.println(shipping_zipCode); %>
				<br> 주소 : <% out.println(shipping_addressName); %>
				<br> (<% out.println(shipping_country); %>)				
			</div>
			<div class="col-4" align="right">
				<p> <em>배송일 : <% out.println(shipping_shippingDate); %></em>
			</div>
		</div>
		
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">도서</th>
					<th class="text-center">개수</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>			
				</tr>
				<%
					int sum = 0;
				/* 89행은: 
				  [ 세션에 저장된 ] [ 세션 속성이름 cartlist(장바구니)를 ]
				  session 내장 객체의 getAttribute() 메소드를 통해 [ 속성값을 가져옴 ] - 형변환 필수!
				*/
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
					if(cartList == null){//만약 [ 저장된 상품 목록이 없으면 ] [ 장바구니 cartList를 생성. ]
				   	   cartList = new ArrayList<Product>();
					}
				
					/* 97행은
					   cartList(장바구니)에 등록된 [ 모든 상품을 하나씩 가져와 ] 출력.
					*/
					for(int i=0; i<cartList.size(); i++){ // 상품 리스트 하나씩 출력하기.
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity(); //해당 상품가격 * 개수.
						sum = sum + total; //총액 계산
				%>
				<tr>
					<td class="text-center"><em><%=product.getPname()%></em></td>
					<td class="text-center"><%=product.getQuantity() %></td>
					<td class="text-center"><%=product.getUnitPrice() %></td>
					<td class="text-center"><%=total%>원</td>
				</tr>
				<%
					} //for문 닫는 태그
				%>
				<tr>
					<td></td>
					<td></td>  <%-- 중대한 요소에는 <strong> 태그 사용. --%>
					<td class="text-right"><strong>총액 : </strong></td>
					<td class="text-center text-danger"><strong><%=sum %> </strong></td>
				</tr>
			</table>
			
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" 
			   class="btn btn-secondary" role="button">이전</a>
			<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
</body>
</html>
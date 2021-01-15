<%@page contentType="text/html; charset=utf-8"%>
<%@page import ="java.net.URLEncoder" %> <%--java.net.URLEncoder.encode() 메소드를 사용하여 한글이 깨지지 않도록 함. --%>

<% // p, 466 [ 배송 정보 * 처리 * ] 페이지 작성
	request.setCharacterEncoding("UTF-8"); // 한글을 처리하기 위해 문자 인코딩 유형을 utf-8로 설정.
	/*
	- [ 쿠키 이름을 ] Shipping_name, Shipping_country ..등으로 설정하고
	- 두 번째 매개변수는 [ 쿠키 값 ]으로 폼 페이지에 전송된 성명, 국가, 우편번호 등으로 설정.
	*/
	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
	Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));
	// 19~ 23행 쿠키 유효기간을 [24시간으로 설정 ].
	cartId.setMaxAge(24 * 60 * 60); 
	name.setMaxAge(24 * 60 * 60);
	zipCode.setMaxAge(24 * 60 * 60);
	country.setMaxAge(24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);;
	
	// [ 쿠키를 등록하도록 ] addCookie() 메소드 작성. -- [ 쿠키 생성 후 ], 쿠키 객체를 아래와 같이 설정해야함.
	response.addCookie(cartId); 
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("orderConfirmation.jsp"); // [ 쿠키 등록 후 ],[ 주문 정보 페이지 ]로 이동.
%>
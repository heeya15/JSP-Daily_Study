<%@page contentType="text/html; charset=utf-8"%>
<%@page import ="java.net.URLEncoder" %>

<% // p, 466 [ 배송 정보 * 처리 * ] 페이지 작성
	request.setCharacterEncoding("UTF-8"); // 한글을 처리하기 위해 문자 인코딩 유형을 utf-8로 설정.
	
	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
	Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));
	
	// 15~ 19행 쿠키 유효기간을 [24시간으로 설정 ].
	cartId.setMaxAge(24 * 60 * 60); 
	name.setMaxAge(24 * 60 * 60);
	zipCode.setMaxAge(24 * 60 * 60);
	country.setMaxAge(24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);;
	
	// [ 쿠키를 등록하도록 ] addCookie() 메소드 작성.
	response.addCookie(cartId); 
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("orderConfirmation.jsp"); // 쿠키 등록 후,주문 정보 페이지로 이동.
%>
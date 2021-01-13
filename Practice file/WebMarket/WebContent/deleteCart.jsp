<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<% //장바구니에 등록된 [ 전체 상품 삭제 페이지 ]  p,446
	String id = request.getParameter("cartId");// 요청파라미터 cartId를 전송받음.
	if(id == null || id.trim().equals("")){ // cartId가 없을때 
		response.sendRedirect("cart.jsp"); //[ 장바구니 페이지로 강제 이동. ]
		return;
	}
	//즉, 12행은 장바구니에 등록된 [ 모든 상품을 삭제 ]
	session.invalidate(); // 세션에 저장된 [ 모든 세션 속성을 삭제 ]하는 메소드 
	response.sendRedirect("cart.jsp");
%>
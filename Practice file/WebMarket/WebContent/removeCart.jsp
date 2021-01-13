<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<% //[ 장바구니에 등록된 [ 개별 상품 삭제 하기] p, 444
	String id = request.getParameter("id"); // 요청파라미터 해당[ 상품id ]를 전송받음.
	if(id == null || id.trim().equals("")){ //전송된 id가 없을때 
		response.sendRedirect("products.jsp"); //상품 목록 페이지로 이동.
		return;
	}
	/* 상품 데이터 접근 클래스  ProductRepository의 
	   기본 생성자에 대한 객체 변수 instance를 얻어오도록 작성.
	 */
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product == null){  // [ 요청 상품 아이디에대한 상품 정보가 ] 없다면 [ 예외처리 페이지로 이동 ] 
		response.sendRedirect("exceptionNoBookId.jsp");	
	}
	/* 259행은: 
	  [ 세션에 저장된 ] [ 세션 속성이름 cartlist(장바구니)를 ]
	  session 내장 객체의 getAttribute() 메소드를 통해 [ 속성값을 가져옴 ] - 형변환 필수!
	*/
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	for(int i=0; i<cartList.size(); i++){ //장바구니에 저장된 [ 상품수만큼 반복. ]
		goodsQnt = cartList.get(i);
		if(goodsQnt.getProductId().equals(id)){ // 세션에 저장된 모든 상품중 개별 상품 [ 제거요청 id와 같을경우 ]
			cartList.remove(goodsQnt); // cartList에서 삭제한다. (리스트에서 상품을 삭제시킴)
		}
	}
	response.sendRedirect("cart.jsp");
%>
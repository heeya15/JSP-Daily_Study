<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%  
	request.setCharacterEncoding("UTF-8");

	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");//제조사
	String category = request.getParameter("category");
	String unitInStock = request.getParameter("unitInStock"); //재고수 
	String condition = request.getParameter("condition"); //상태
	
	Integer price;
	
	if(unitPrice.isEmpty()) //상품가격 변수에 값이 없으면 가격을 0원으로 저장.
		price =0;
	else // 상품가격 변수에 값이 있으면.
		price =Integer.valueOf(unitPrice);// [ 문자열 상품가격을 ] 정수형으로 형변환시킨다.
	
	long stock;// 재고수
	
	if(unitInStock.isEmpty()) //상품 재고수 변수에 값이 없으면 재고 수 0으로 저장.
		stock =0;
	else // 상품가격 변수에 값이 있으면.
		stock =Long.valueOf(unitInStock);// [ 문자열 상품재고수를 ] Long형으로 형 변환시킨다.
	
	ProductRepository dao = ProductRepository.getInstance();
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	//폼 페이지에서 입력된 데이터를 저장하도록 ProductRepository 클래스의 addProduct()메소드를 호출하여 [ 신규 상품정보를 추가. ]
	dao.addProduct(newProduct); 
	response.sendRedirect("products.jsp");	// 설정한 URL 페이지(상품 목록페이지)로 강제 이동.
%>
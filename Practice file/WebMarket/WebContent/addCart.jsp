<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
	String id = request.getParameter("id"); //요청 파라미터 아이디를 전송받도록
	if(id == null || id.trim().equals("")){//전송된 아이디가 입력하지 않거나, 공백인경우
		response.sendRedirect("products.jsp"); //[ 상품 목록페이지 ]로 강제로 이동시킴.
		return;
	}
	// 기본 생성자에 대한 [ 객체변수 instance얻어옴 ].
	ProductRepository dao = ProductRepository.getInstance();
	/* 19행.
     - [ 해당 상품아이디를 ](가져온다).
     - 상품 아이디에 대한 상품 정보를 얻어오도록 getProductById() 메소드를 호출하고 
     - 이를 [ Product 객체에 저장 ]하도록 합니다.
	*/
	Product product = dao.getProductById(id);  
	if(product == null){ // 상품 아이디에 대한 [ 상품 정보가 없으면 ] 예외 처리 페이지로 이동
		response.sendRedirect("exceptionNoBookId.jsp");	
	}
	//[ 저장된 모든 상품 목록을 가져오는 ]  getAllProducts() 메소드 호출.
	ArrayList<Product> goodsList = dao.getAllProducts(); 
	Product goods = new Product();
	for(int i=0; i<goodsList.size(); i++){ // [ 상품 목록 개수 ]만큼 반복 
		goods = goodsList.get(i); //상품 정보를 가져와 Product 객체타입의 변수 Product에 저장.
		if(goods.getProductId().equals(id)){ // 해당 상품 id와, 장바구니 담기에 요청된 상품id와 같으면
			break; //for 문 나감.
		}
	}
	/*
	- 세션 속성이름 cartlist(장바구니)의 세션정보(장바구니에 등록된 데이터)를 얻어와 
	- [ ArrayList 객체에 저장. ]
	*/
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if(list == null){ // 만약 ArrayList 객체에 [ 세션 정보가 없으면 ] 
		list = new ArrayList<Product>(); // 새로운 ArrayList 객체를 생성하고
		session.setAttribute("cartlist", list); // 이를 세션 속성이름(cartlist)에 [ 속성값을 저장한다. ]
	}
	
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i=0; i<list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0){ // 요청 파라미터 아이디의 상품이 장바구니에 [ 담긴 목록이 아니면 ], 즉 0개라면
		goods.setQuantity(1);// 해당 상품의 수량을 1로하고
		list.add(goods);// [ 장바구니 목록에 추가 ]한다.
	}
	/* 61행
	- 요청 파라미터 id를 설정하여 웹 페이지 product.jsp로 이동.
	- 즉, [ 해당 상품 상세정보 페이지를 그대로 유지 ] 시키기위해 작성.
	*/
	response.sendRedirect("product.jsp?id="+ id);

%>
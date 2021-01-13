<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %><%--dto.Product 패키지를 사용하기위해 작성. --%>
<%@ page import="dao.ProductRepository" %> <%--dao.ProductRepository 패키지를 사용하기위해 작성. --%>

<%
	String id = request.getParameter("id"); //요청 파라미터 아이디를 전송받도록
	if(id == null || id.trim().equals("")){//전송된 아이디가 [ 존재하지 않거나, 공백인경우 ]
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
	Product product = dao.getProductById(id);  //요청 파라미터 상품 id를 매개변수로 넘김 
	if(product == null){ // [ 요청 상품 아이디에 대한 ] [ 상품 정보가 없으면 ] 예외 처리 페이지로 이동
		response.sendRedirect("exceptionNoBookId.jsp");	
	}
	//[ 저장된 모든 상품 목록을 가져오는 ]  getAllProducts() 메소드 호출.
	ArrayList<Product> goodsList = dao.getAllProducts(); 
	Product goods = new Product();
	for(int i=0; i<goodsList.size(); i++){ // [ 상품 목록 개수 ]만큼 반복 
		goods = goodsList.get(i); //상품 정보를 가져와 Product 객체타입의 변수 Product에 저장.
		if(goods.getProductId().equals(id)){ // 해당 상품 id와, [ 장바구니 담기에 요청된 상품id와 ] 같으면
		   break; //for 문 나감.
		} //if문 닫음.
	}
	/* 36행은:
	- 세션 속성이름 cartlist(장바구니)의 세션정보(장바구니에 등록된 데이터)를 얻어와 
	- [ ArrayList 객체에 저장. ] -- 단,처음 장바구니에 담을려고할때 list 객체 변수에 null상태이다.
	*/
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if(list == null){ // 만약 ArrayList 객체에 [ 세션 정보가 없으면 ] 
		list = new ArrayList<Product>(); // 새로운 ArrayList 객체를 생성하고
		session.setAttribute("cartlist", list);// 이를 세션 속성이름(cartlist)에 [ 속성값(장바구니 등록된 데이터)을 저장한다. ]
	}
	// 42행~51행 요청 파라미터 아이디의 상품이 장바구니에 담긴 목록이면 [ 해당 상품의 수량을 증가시키도록 작성 ]
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i=0; i<list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){ // 요청된 상품 id,장바구니에 담긴 상품id와 같다면
			cnt++; //수량 증가.
			int orderQuantity = goodsQnt.getQuantity() + 1; //[ 해당 상품의 수량을 증가 ]시킨다.
			goodsQnt.setQuantity(orderQuantity); // 증가시킨 수량을, [ 장바구니에 담긴 해당상품의 수량 ]으로 정한다.
		}
	}
	
	if(cnt == 0){ // 요청 파라미터 아이디의 상품이 장바구니에 [ 담긴 목록이 아니면 ], 즉 0개라면
		goods.setQuantity(1);// [ 해당 상품의 수량을 1로 ]하고
		list.add(goods);// [ 장바구니 목록에 추가 ]한다.
	}
	/* 61행
	- 요청 파라미터 id를 설정하여 웹 페이지 product.jsp로 이동.
	- 즉, [ 해당 상품의 상세정보 페이지를 그대로 유지 ] 시키기위해 작성.
	*/
	response.sendRedirect("product.jsp?id="+ id);
	//session.invalidate();
%>
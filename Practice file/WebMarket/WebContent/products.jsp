<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %> <%--ArrayList 패키지를 사용하기위해 [ page 디렉티브 태그 ]의 import 속성 작성 --%>
<%@ page import="dto.Product" %> <%--dto.Product 패키지를 사용하기위해 작성. --%>
<%--p,209 )기존의 useBean 액션 태그를 삭제하고 상품 접근 클래스 패키지로 변경한다 --%>
<%@ page import="dao.ProductRepository" %> <%--dao.ProductRepository 패키지를 사용하기위해 작성. --%>
<%--
<jsp:useBean id="productDAO" class = "dao.ProductRepository" scope ="session"/>
자바빈즈로 작성한 ProductRepository 클래스를 사용하도록 useBean 액션 태그를 작성
  --%>

<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품목록</title>
</head>
<body>
	<%--include [ 액션 태그를 만나 ] 하던 작업을 멈추고 프로그램 제어를 menu.jsp로 이동. --%>
	<jsp:include page="menu.jsp"/> 
    <div class = "jumbotron">
    	<div class = "container">
    		<h1 class= "display-3">상품목록</h1>
    	</div>
	</div>
	<% /*
	    [ useBean 액션 태그의 id속성값 productDAO를 통해 ] ProductRepository 클래스의
	    getAllProducts() 메소드를 호출하여 [ 반환된 값을 ] 
	    ArrayList<Product> 객체 타입의 변수 [ listOfProducts에 저장. ]
	    ex) ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	    */
	    /*
	    p,209 ProductRepository 클래스의 getAllProducts()메소드를 호출하여 
	    ** 모든 상품 목록(새로 입력된 상품포함.) **을 들고와 [ 배열 객체타입 변수에 저장 ]
	    */
	    ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts(); 
	%>
		
	<div class = "container">
    	<div class = "row" align ="center">
    		<%
    			for(int i=0; i<listOfProducts.size();i++){ // 상품 목록 개수만큼 반복 
    				Product product =listOfProducts.get(i); //상품 정보를 가져와 Product 객체타입의 변수 Product에 저장. 			
    		%>
    		<%--[ 37행에서 39행은 ] 상품명, 상품 상세정보, 상품 가격을 출력하는 [ 표현문 태그 ] --%>
    		<div class ="col-md-4">
    			<h3><%=product.getPname() %></h3>
    			<p><%=product.getDescription() %>
    			<p><%=product.getUnitPrice() %>원
    			<%--p,173 [ 상품 상세정보 버튼 ]만들기 부분
    			&raquo는 [ HTML 특수문자 ] ">>"기호를 만들어 준다. --%>
    			<p> <a href="product.jsp?id=<%=product.getProductId()%>"
    			class="btn btn-secondary" role="button">상세정보 &raquo;</a>
    		</div>
    		<%
    			} // 32행 for문(반복문) 블록 닫는 [ 스크립틀릿 태그 작성 ]
    		%>
    	</div>
    	<hr>
	</div>	
	
	<jsp:include page="footer.jsp"/>
</body>
</html>
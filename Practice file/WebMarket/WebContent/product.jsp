<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %> <%--dto.Product 패키지를 사용하기위해 작성. 
                                     [ page 디렉티브태그 ]의 import속성작성 --%>
<%--자바빈즈로 작성한 [ ProductRepository 클래스를 ] 사용하도록 useBean 액션 태그를 작성  --%>
<jsp:useBean id="productDAO" class = "dao.ProductRepository" scope ="session"/>
<html>
<head>
<link rel = "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 상세 정보</title>
</head>
<body>
	<%--include [ 액션 태그를 만나 ] 하던 작업을 멈추고 프로그램 제어를 menu.jsp로 이동. (동적일때 사용) --%>
	<jsp:include page="menu.jsp"/> 
    <div class = "jumbotron">
    	<div class = "container">
    		<h1 class= "display-3">상품정보</h1>
    	</div>
	</div>
	<% 
		/*21행은 products.jsp를실행후 상세정보 버튼을 눌러서 상품 코드가 P1234인 상품을 눌러 상세정보를 보려고할경우 
		주소창에는 http://localhost:9090/WebMarket/product.jsp?id=P1234 에서
		[ P1234를 ] 들고와서 id 변수에 저장.*/
	   String id = request.getParameter("id");
		/*그 후 useBean 액션 태그에 id속성값을 통해 ProductRepository클래스에 getProductById()메소드를 호출하여
		반환된 결과 값을 Product 객체타입 변수 product에 저장함. 
		즉, 넘겨받은 [ id에 저장된 상품 코드가 ]  Product 객체중 [ 기존에 저장되어있는 상품코드가 있을경우 저장 ]. */
	   Product product = productDAO.getProductById(id);
	%>
		
	<div class = "container">
    	<div class = "row" >
    		<div class="col-md-6">
    			<h3><%=product.getPname() %></h3>
    			<h3><%=product.getDescription() %></h3>
    			<p><b>상품 코드 :</b><span class="badge badge-danger">
    				<%=product.getProductId() %></span>
    			<p><b>제조사 </b> :<%=product.getManufacturer() %>
    			<p><b>분류 </b> :<%=product.getCategory() %>
    			<p><b>재고 수 </b> :<%=product.getUnitsInStock() %>
    			<h4><%=product.getUnitPrice() %>원</h4>
    			<p> <a href="#" class="btn btn-info">상품 주문 &raquo;</a>
    			<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
    		</div>			
    	</div>
    	<hr>
	</div><%--31행 div태그 닫는부분 --%>
	<jsp:include page="footer.jsp"/>
</body>
</html>
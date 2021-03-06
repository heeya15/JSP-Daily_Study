<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %> <%--dto.Product 패키지를 사용하기위해 작성. 
                                     [ page 디렉티브태그 ]의 import속성작성 --%>
<%--p,209 )기존의 useBean 액션 태그를 삭제하고 상품 접근 클래스 패키지로 변경한다 --%>
<%@ page import="dao.ProductRepository" %> <%--dao.ProductRepository 패키지를 사용하기위해 작성. --%>

<html>
<head>
<link rel = "stylesheet" href= "./resources/css/bootstrap.min.css">
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
		/* products.jsp를실행후 [ 상세정보 버튼을 눌러 ]서 상품 코드가 P1234인 상품을 눌러
		상세정보를 보려고할경우 주소창에는 http://localhost:9090/WebMarket/product.jsp?id=P1234 에서
		[ P1234를 ] 들고와서 id 변수에 저장.*/
	   String id = request.getParameter("id");
		/* p, 209 
		그 후, ProductRepository클래스에 getProductById()메소드를 호출하여
		반환된 결과 값을 Product 객체타입 변수 product에 저장함. 
		즉, 넘겨받은 [ id에 저장된 상품 코드가 ]  Product 객체중 [ 기존에 저장되어있는 상품코드가 있을경우 저장 ]. */
	   ProductRepository dao = ProductRepository.getInstance();
	   Product product = dao.getProductById(id);
	%>
	
	<div class = "container">
    	<div class = "row" > <%--한행에 2개의 div영역으로 나눠서 출력 시키기 위해 영역 구분지음. --%>
    	<%-- p, 242 아래 img 태그는 상품 이미지를 출력하기위해 추가 
    	   <img src="./resources/images/<%=product.getFilename() %>" style="width: 100%"> 
    	    --------------------------------------------------------------------------------
    	     p, 243 아래 div 안에, 아래 img 태그는 아래 경로에 [ 저장된 상품 이미지를 출력 ]하기 위해 추가작성.--%>
    		<div class = "col-md-5">
    			<img src="./upload/<%=product.getFilename()%>" style="width: 100%"/>  
	       </div>	
    		<div class="col-md-6">
    			<h3><%=product.getPname() %></h3>
    			<h3><%=product.getDescription() %></h3>
    			<p><b>상품 코드 :</b><span class="badge badge-danger">
    				<%=product.getProductId() %></span>
    			<p><b>제조사 </b> :<%=product.getManufacturer() %>
    			<p><b>분류 </b> :<%=product.getCategory() %>
    			<p><b>재고 수 </b> :<%=product.getUnitsInStock() %>
    			<h4><%=product.getUnitPrice() %>원</h4>
    			<%--p,439 장바구니 등록하기위해 추가 작성부분. 
    				form 태그 추가.
    				[상품 주문을 클릭]하면 핸들러 함수 addToCart()가 실행되도록 onclick 작성--%>
    			<p><form name ="addForm" action = "./addCart.jsp?id=<%=product.getProductId()%>"
    			     method ="post">
    			   <a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
    			   <a href="./cart.jsp" class="btn btn-warning" > 장바구니 &raquo;</a>
    			   <a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
    			</form>
    		</div>			
    	</div>
    	<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
	function addToCart() { //장바구니에 등록하기 위한 [ 핸들러 함수 작성. ]
		var form = document.addForm;
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){ //메시지창을 뛰우고 [ 확인을] 클릭시. 
			form.submit();// 폼 페이지에서 입력한 데이터 값을 [ 서버로 전송 ]합니다. (수동 submit 처리)
		}
		else{ //취소를 클릭하면 [ 폼 문의 실행을 취소. ]
			form.reset();
		}	
	}
</script>
</html>
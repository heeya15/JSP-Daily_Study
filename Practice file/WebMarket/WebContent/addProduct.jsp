<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href= "./resources/css/bootstrap.min.css">
<title>상품 등록</title>
</head>
<body>
	<%--include [ 액션 태그를 만나 ] 하던 작업을 멈추고 프로그램 제어를 menu.jsp로 이동. (동적일때 사용) --%>
	<jsp:include page="menu.jsp"/> 
    <div class = "jumbotron">
    	<div class = "container">
    		<h1 class= "display-3">상품 등록</h1>
    	</div>
	</div>
	<div class = "container">
	    <%--p, 243 enctype 추가 파일 전송을 위해 사용 --%>
		<form name = "newProduct" action="./processAddProduct.jsp" class="form-horizontal" 
		method="post" enctype="multipart/form-data"> 
    		<div class = "form-group row" >
    			<label class="col-sm-2">상품 코드</label>
    			<div class="col-sm-3">
    				<input type="text" name = "productId" class = "form-control">
    			</div>
    		</div>
    		<div class = "form-group row" >
    			<label class="col-sm-2">상품명</label>
    			<div class="col-sm-3">
    				<input type="text" name = "name" class = "form-control">
    			</div>
    		</div>
    		<div class = "form-group row" >
    			<label class="col-sm-2">가격</label>
    			<div class="col-sm-3">
    				<input type="text" name = "unitPrice" class = "form-control">
    			</div>
    		</div>
    		<div class = "form-group row" >
    			<label class="col-sm-2">상세 정보</label>
    			<div class="col-sm-5">
    				<textarea name = "description" class = "form-control" 
    				rows="2" cols="50"></textarea> 
    			</div>
    		</div>
    		<div class = "form-group row" >
    			<label class="col-sm-2">제조사</label>
    			<div class="col-sm-3">
    				<input type="text" name = "manufacturer" class = "form-control">
    			</div>
    		</div>
    		<div class = "form-group row" >
    			<label class="col-sm-2">분류</label>
    			<div class="col-sm-3">
    				<input type="text" name = "category" class = "form-control">
    			</div>
    		</div>
    		<div class = "form-group row" >
    			<label class="col-sm-2">재고 수</label>
    			<div class="col-sm-3">
    				<input type="text" name = "unitInStock" class = "form-control">
    			</div>
    		</div>
    		<div class = "form-group row" >
    			<label class="col-sm-2">상태</label>
    			<div class="col-sm-5">
    				<input type="radio" name = "condition" value="New"> 신규 제품
    				<input type="radio" name = "condition" value="New"> 중고 제품
    				<input type="radio" name = "condition" value="Refurbished"> 재생 제품
    			</div>
    		</div>
    		<%--p, 244 아래 이미지 label 부분은 [ 상품 이미지 파일 업로드하기위해 추가 작성 ]  --%>
    		<div class = "form-group row" >
    			<label class="col-sm-2">이미지</label>
    			<div class="col-sm-5">
    				<input type="file" name = "productImage" class ="form-control">
    			</div>
    		</div>
    		<div class = "form-group row" >
    			<div class="col-sm-offset-2 col-sm-10">
    				<input type="submit" class = "btn btn-primary" value="등록">
    			</div>
    		</div>
    	</form>
</body>
</html>
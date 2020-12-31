<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 6행은 [ MultipartRequest 클래스를 사용 ]하도록
 	 page 디렉티브 태그의 import 속성 값에 패키지를 작성 
 --%>
<%@ page import="com.oreilly.servlet.*" %> 
 <%-- 10행은 DefaultFileRenamePolicy 클래스를 사용하도록
 	  page 디렉티브 태그의 import 속성 값에 패키지를 작성 
 --%> 
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%  
	request.setCharacterEncoding("UTF-8");

	/* p,245 [ 24행~28행 부분 ]
	서버의 "C:\\JSP폴더\\test1\\WebMarket\\WebContent\\upload" 경로에 저장, 파일의 최대 크기는 5MB, 
	[ 파일명 인코딩 유형 ]은 utf-8로 설정
	서버에 저장된 [ 파일명 중복을 처리 ]하기 위해 [ DeafaultFileRenamePolicy 클래스를 사용 ]
	*/
	String fileName ="";
	String realFolder = "C:\\JSP폴더\\test1\\WebMarket\\WebContent\\upload"; //웹 애플리케이션 상의 절대 경로
	int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일 크기 5MB
	String encType ="utf-8"; // 파일명 인코딩 유형
	MultipartRequest multi = new MultipartRequest (request,realFolder,
			                  maxSize, encType, new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");//제조사
	String category = multi.getParameter("category");
	String unitInStock = multi.getParameter("unitInStock"); //재고수 
	String condition = multi.getParameter("condition"); //상태
	
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
	
	/* p,246 부분 [ 62행에서 ~ 67행 추가작성 ]
	  	1. MultipartRequest 객체타입의 getFileNames()메소드를 작성한 후 
	  	   Enumeration 객체 타입으로 반환.
	  64행: form에서 name = "productImage"으로 설정하여 productImage가 fname 변수에 저장.
	  65행: 서버에 실제로 업로드된 파일명을 반환. 즉, [ 파일명 ** 중복시 ** ] --> 변경된 파일명을 반환
	  66행 : 서버에 업로드된 파일에 대한 파일 객체를 반환. 업로드된 파일이없으면 null반환.  
	   - ** 66행이 없으면 상품 새로 등록한 이미지가 상품 목록 페이지에 표시가 되지않음.
	 */	
	 Enumeration files = multi.getFileNames();  // 62행은 : input type="file" 로 설정된 [ 요청 파라미터 이름 ]을 반환
	 while (files.hasMoreElements()){ //요청된 파라미터중 [ 파일이 없을때 까지 반복 ]
		    String fname = (String)files.nextElement(); 
		    fileName = multi.getFilesystemName(fname);
	    	File file = multi.getFile(fname);    	
	 }
	
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
	newProduct.setFilename(fileName);
	//폼 페이지에서 입력된 데이터를 저장하도록 ProductRepository 클래스의 addProduct()메소드를 호출하여 [ 신규 상품정보를 추가. ]
	dao.addProduct(newProduct); 
	response.sendRedirect("products.jsp");	// 설정한 URL 페이지(상품 목록페이지)로 강제 이동.
%>
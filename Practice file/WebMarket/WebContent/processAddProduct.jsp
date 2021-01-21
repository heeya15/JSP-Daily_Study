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
<%@ page import="java.io.*" %> <%--File 객체를 사용하기위해 사용. --%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*"%>

<%@ include file="dbconn.jsp"%><%--해당 데이터베이스에 접속하는 파일. --%>
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
	String description = multi.getParameter("description"); //상품 설명
	String manufacturer = multi.getParameter("manufacturer");//제조사
	String category = multi.getParameter("category");
	String unitInStock = multi.getParameter("unitInStock"); //재고수 
	String condition = multi.getParameter("condition"); //상태
	Integer price; //변수 선언.
	
	if(unitPrice.isEmpty()) //상품가격 변수에 값이 없으면 가격을 0원으로 저장.
		price =0;
	else // 상품가격 변수에 값이 있으면.
		price =Integer.valueOf(unitPrice);// [ 문자열 상품가격을 ] 정수형으로 형변환시킨다.
	
	Integer stock;// 재고수
	
	if(unitInStock.isEmpty()) //[ 상품 재고수 변수 ]에 값이 없으면 재고 수 0으로 저장.
		stock =0;
	else // 상품가격 변수에 [ 값이 있으면. ]
		stock =Integer.valueOf(unitInStock);// [ 문자열 상품재고수를 ] Long형으로 형 변환시킨다.
	
	/* p,246 부분 [ 62행에서 ~ 67행 추가작성 ]
	  	1. MultipartRequest 객체타입의 getFileNames()메소드를 작성한 후 
	  	   Enumeration 객체 타입으로 반환.
	  64행: form에서 name = "productImage"으로 설정하여 < productImage가 fname 변수에 저장.>
	  65행: 서버에 실제로 업로드된 파일명을 반환. 즉, [ 파일명 ** 중복시 ** ] --> 변경된 파일명을 반환
	  66행: 서버에 업로드된 파일에 대한 [ 파일 객체를 반환 ]. 업로드된 파일이없으면 null반환.  
	   - ** 66행이 없으면 [ 상품 새로 등록한 이미지가] 상품 목록 페이지에 표시가 되지않음.
	 */	
	 Enumeration files = multi.getFileNames();  // 62행은 : input type="file" 로 설정된 [ 요청 파라미터 이름 ]을 반환
	 while (files.hasMoreElements()){ //요청된 파라미터중 [ 파일이 없을때 까지 반복 ]
		    String fname = (String)files.nextElement(); 
		    fileName = multi.getFilesystemName(fname);
	    	File file = multi.getFile(fname);    	
	 }
	
	 PreparedStatement pstmt = null; //PreparedStatement 객체를 null로 초기화
	 try {
			//72행: 테이블의 각 필드에 폼 페이지에 전송된 [ 데이터들을 삽입하도록 insert 문 ] 작성.
		String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?,?,?)"; 
		
		pstmt  = conn.prepareStatement(sql); // PreparedStatement 객체를 생성
		// 폼페이지에 전송된 [ 정해지지않는 값을 < product 테이블에 삽입 >하도록 작성 ].
		pstmt.setString(1, productId); 
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, description); 
		pstmt.setString(5, manufacturer);// 제조사
		pstmt.setString(6, category); //분류
		pstmt.setInt(7, stock); //상품 재고수
		pstmt.setString(8, condition);
		pstmt.setString(9, fileName);
		/* 90 행:
	      - INSERT 문을 실행하도록 PreparedStatement 객체의 executeUpdate() 메소드 작성.
	      - 여기서는 [ 매개변수 없음. ] Statement객체의 executeUpdate()메소드에 sql구문을 인수로 넣었음.
		*/
		pstmt.executeUpdate();
			
		out.println("Product 테이블 삽입에 성공했습니다.<br>");// [ 삽입 성공 ]하면 메시지를 출력.
			
		} catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
			out.println("Product 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException :" + ex.getMessage());
		} finally {
			 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
			 //- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
			if (pstmt != null) //연결이 된경우 
				pstmt.close(); //Statement 객체를 해제
			if (conn != null) //연결이 되면
				conn.close(); //커넥션 객체를 해제
				
			response.sendRedirect("products.jsp");	// 설정한 URL 페이지(상품 목록페이지)로 강제 이동.
		}
%>
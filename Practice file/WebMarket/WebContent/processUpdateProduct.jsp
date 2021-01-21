<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- 6행은 [ MultipartRequest 클래스를 사용 ]하도록
 	 page 디렉티브 태그의 import 속성 값에 패키지를 작성 
 --%>
<%@ page import="com.oreilly.servlet.*"%>
<%-- 10행은 DefaultFileRenamePolicy 클래스를 사용하도록
 	  page 디렉티브 태그의 import 속성 값에 패키지를 작성 
 --%> 
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>

<%@ page import="java.io.*" %> <%--File 객체를 사용하기위해 사용. --%>
<!-- JSP에서 [ JDBC의 객체를 사용하기 위해 ] java.sql 패키지를 import 한다 -->
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%><%--해당 데이터베이스에 접속하는 파일. --%>

<%
	request.setCharacterEncoding("UTF-8");
	
	/* p,245 [ 26행~30행 부분 ]
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
	String unitInStock = multi.getParameter("unitsInStock"); //재고수 
	String condition = multi.getParameter("condition"); //상태
	
	Integer price; //변수 선언.
	
	if(unitPrice.isEmpty()) //상품가격 변수에 값이 없으면 가격을 0원으로 저장.
		price =0;
	else // 상품가격 변수에 값이 있으면.
		price =Integer.valueOf(unitPrice);// [ 문자열 상품가격을 ] 정수형으로 형변환시킨다.
	
	long stock;// 재고수
	
	if(unitInStock.isEmpty()) //[ 상품 재고수 변수 ]에 값이 없으면 재고 수 0으로 저장.
		stock =0;
	else // 상품가격 변수에 [ 값이 있으면. ]
		stock =Long.valueOf(unitInStock);// [ 문자열 상품재고수를 ] Long형으로 형 변환시킨다.
	
	/* p,246 부분 [ 64행에서 ~ 69행 추가작성 ]
	  1. MultipartRequest 객체타입의 getFileNames()메소드를 작성한 후 
	  	   Enumeration 객체 타입으로 반환.
	  66행: form에서 name = "productImage"으로 설정하여 < productImage가 fname 변수에 저장.>
	  67행: 서버에 실제로 업로드된 파일명을 반환. 즉, [ 파일명 ** 중복시 ** ] --> 변경된 파일명을 반환
	  68행: 서버에 업로드된 파일에 대한 [ 파일 객체를 반환 ]. 업로드된 파일이없으면 null반환.  
	   - ** 68행이 없으면 [ 상품 새로 등록한 이미지가] 상품 목록 페이지에 표시가 되지않음.
	 */	
	 Enumeration files = multi.getFileNames();  // 62행은 : input type="file" 로 설정된 [ 요청 파라미터 이름 ]을 반환
	 while (files.hasMoreElements()){ //요청된 파라미터중 [ 파일이 없을때 까지 반복 ]
		    String fname = (String)files.nextElement(); 
		    fileName = multi.getFilesystemName(fname);
	    	File file = multi.getFile(fname);    	
	 }
	
	 PreparedStatement pstmt = null; //PreparedStatement 객체를 null로 초기화
	 ResultSet rs = null; // 각 객체를 null로 초기화.--> Select한 결과를 저장받기위해 선언.
	 try {
		 String sql = "SELECT * FROM PRODUCT where p_id = ?";
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, productId);
		 rs = pstmt.executeQuery();
		 
		if (rs.next()) {
			if (fileName != null) { //요청 파라미터중 [ 이미지 파일이 있으면 ] 실행
				sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=?, p_fileName=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setString(3, description);
				pstmt.setString(4, manufacturer);//제조사
				pstmt.setString(5, category);//분류
				pstmt.setLong(6, stock);//재고수
				pstmt.setString(7, condition);
				pstmt.setString(8, fileName);
				pstmt.setString(9, productId);
				pstmt.executeUpdate();
			} else { //요청 파라미터중 [ 이미지 파일이 없으면 ] 실행
				sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setString(3, description);
				pstmt.setString(4, manufacturer);
				pstmt.setString(5, category);
				pstmt.setLong(6, stock);
				pstmt.setString(7, condition);
				pstmt.setString(8, productId);
				pstmt.executeUpdate();
			}
		}
	}catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.
		out.println("PRODUCT 테이블 수정이 실패했습니다.<br>");
		out.println("SQLException :" + ex.getMessage());
	} finally {
		 //-  진행된 순서의 [ 역방향 ]으로 [ 연결된 객체를 끊어준다. ]
		 //- (ResultSet → PreparedStatement → Connection) 이때 사용되는 메서드는 close()이다.
		if (rs !=null)
			rs.close();
		if (pstmt != null) //연결이 된경우 
			pstmt.close(); //PreparedStatement 객체를 해제
		if (conn != null) //연결이 되면
			conn.close(); //커넥션 객체를 해제
			
		response.sendRedirect("editProduct.jsp?edit=update");
	}
%>



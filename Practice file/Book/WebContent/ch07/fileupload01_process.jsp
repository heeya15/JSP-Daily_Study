<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- 6행은 MultipartRequest 클래스를 사용하도록
 	page 디렉티브 태그의 import 속성 값에 패키지를 작성 
 --%>
<%@ page import="com.oreilly.servlet.*" %> 
 <%-- 10행은 DefaultFileRenamePolicy 클래스를 사용하도록
 	  page 디렉티브 태그의 import 속성 값에 패키지를 작성 
 --%> 
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	/* p,222 [ 14행 부분 ]
	 서버의 "C:\\JSP폴더\\test1\\Book\\WebContent\\upload" 경로에 저장, 파일의 최대 크기는 5MB, 
	 [ 파일명 인코딩 유형 ]은 utf-8로 설정
	 서버에 저장된 [ 파일명 중복을 처리 ]하기 위해 
  	[ DeafaultFileRenamePolicy 클래스를 사용 ]
	*/
	MultipartRequest  multi = new MultipartRequest (request,
		"C:\\JSP폴더\\test1\\Book\\WebContent\\upload",5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	/* [ 요청 파라미터 이름을 받도록 ], 즉 [ 일반 데이터에 접근함 ] . input type ="file"로 둔것을 제외하고
	   MultipartRequest 객체타입의 getParameterNames()메소드를 작성한 후 
	   Enumeration 객체 타입으로 반환. 
	   */
	Enumeration params = multi.getParameterNames(); 
    
    while (params.hasMoreElements()){ //폼 페이지에 [ 요청 파라미터가 없을 때까지 반복 ] 현재 2개 name, subject 
    	String name = (String) params.nextElement(); //요청 파라미터 이름을 가져옴
    	String value = multi.getParameter(name); //요청 파라미터 이름으로 입력한 파라미터 값을 저장.
    	out.println(name+" = " + value + "<br>");
    }
    out.println("----------------------------<br>");
    
 	// 36행은 : input type="file" 로 설정된 [ 요청 파라미터 이름 ]을 반환 
    Enumeration files = multi.getFileNames(); 
    
    while (files.hasMoreElements()){ //요청된 파라미터중 [ 파일이 없을때 까지 반복 ]
    	//40행: form에서 name = "filename"으로 설정하여 filename이 name 변수에 저장.
    	String name = (String) files.nextElement(); 
    	//42행: 서버에 실제로 업로드된 파일명을 반환. 즉, [ 파일명 **중복시** ] 변경된 파일명을 반환
    	String filename = multi.getFilesystemName(name); 
    	String original = multi.getOriginalFileName(name); //사용자가 실제로 업로드한 파일명을 반환(파일명 중복시 변경전의 파일명)
    	String type = multi.getContentType(name); // 업로드된 [ 파일의 콘텐츠 유형을 반환. ]
    	File file = multi.getFile(name); //폼 페이지에서 전송된 [ 파일을 가져오도록함 ].즉 파일을 해당 디렉토리에 저장시켜줌.
    	
    	out.println("요청 파라미터 이름 : " + name + "<br>");
    	out.println("실제 파일 이름 : " + original + "<br>");
    	out.println("저장 파일 이름 : " + filename + "<br>"); //파일명 중복시 [ 변경된 파일명을 반환 ]
    	out.println("파일 콘텐츠 유형 : " + type + "<br>");
    	
    	if(file != null){
    		out.println(" 파일 크기 : " + file.length());
    		out.println("<br>");
    	}
    }  
%>
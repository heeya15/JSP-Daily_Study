<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- 6행은 [ Commons-FileUpload 클래스를 사용하도록 ]
 	page 디렉티브 태그의 import 속성 값에 패키지를 작성 
 --%>
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>File Upload(Commons-FileUpload를 이용한 파일 업로드)</title>
</head>
<body>
<%
	/* p,233 [ 18행 부분 ]
	 서버의 "C:\\JSP폴더\\test1\\Book\\WebContent\\upload" 경로에 저장, 
	*/
	String fileUploadPath = "C:\\JSP폴더\\test1\\Book\\WebContent\\upload"; //즉, 저장할 경로 작성.
	DiskFileUpload upload = new DiskFileUpload(); //파일 업로드를 위해 DiskFileUpload 클래스 생성.
	/*
	multipart/form-data 유형의 요청 파라미터를 가져옴.(List 유형으로 가져와서) List 객체 생성.
	List는 [ 순서를 유지하는 데이터의 집합 ]이다. 데이터의 [ 중복이 허용 ]
	*/
	List items = upload.parseRequest(request);
	
	Iterator params = items.iterator();// 데이터의 어떠한 집합체든 동일한 방식으로 처리하기위해 [ Iterator 클래스로 변환 ]
	while(params.hasNext()){ // 폼페이지에서 전송된 요청 파라미터가 없을때까지 반복.(요소가 있을때 까지 반복.)
		/* 32행.
		FileItem 클래스는 multipart/form-data 형식으로 
		전송된 폼 데이터를 [ 파일 ] 또는 [ 폼 아이템 ]으로 표현하는 객체다
		*/
		FileItem fileItem = (FileItem) params.next();// 전송된 요청 파라미터 이름을 가져옴
		if(!fileItem.isFormField()){ //일반 데이터가 아닌 [ 파일 데이터 인경우 ]
			/* 38행
			//업로드된 파일(경로포함)의 이름을 얻어온다.
			 ex) Cat.jpg 파일명 파일선택하면 Cat.jpg가 저장.
			*/
			String fileName = fileItem.getName(); 	
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1); //사용자가 선택한 파일명이 저장.ex) Cat.jpg 
			//fileName = fileName.substring(0); 이렇게 작성해도 결과는 같다.
			//42행:  저장할 파일경로/ [ 사용자가 선택한 파일명으로 파일을 저장 ]하게끔 하는 [ File 객체생성. ]
			File file = new File(fileUploadPath +"/"+fileName);
			fileItem.write(file);// 서버의 [ 파일 저장경로에 ] 저장하도록 함.	
		}	
	}
%>
</body>
</html>
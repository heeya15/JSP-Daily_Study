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
<html>
<head>
<title>File Upload(파일 업로드)</title>
</head>
<body>
<%
	/* p,226 [ 25행 부분 ]
	 서버의 "C:\\JSP폴더\\test1\\Book\\WebContent\\upload" 경로에 저장, 파일의 최대 크기는 5MB, 
	 [ 파일명 인코딩 유형 ]은 utf-8로 설정
	 서버에 저장된 [ 파일명 중복을 처리 ]하기 위해 
  	[ DeafaultFileRenamePolicy 클래스를 사용 ]
	*/
	MultipartRequest  multi = new MultipartRequest (request,
		"C:\\JSP폴더\\test1\\Book\\WebContent\\upload",5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	request.getParameter("name1");
	String name1 =multi.getParameter("name1");
	String subject1 = multi.getParameter("subject1");
	String name2 =multi.getParameter("name2");
	String subject2 = multi.getParameter("subject2");
	String name3 =multi.getParameter("name3"); // 이름3
	String subject3 = multi.getParameter("subject3"); // 제목3
	
 	// 36행은 : input type="file" 로 설정된 [ 요청 파라미터 이름 ]을 반환 
    Enumeration files = multi.getFileNames();
	
  	//38행: form에서 name = "filename1"으로 설정하여 filename1이 name 변수에 저장.
	String file1 = (String) files.nextElement(); 
	//40행: 서버에 실제로 업로드된 파일명을 반환. 즉, [ 파일명 ** 중복시 ** ] 변경된 파일명을 반환
	String filename1 = multi.getFilesystemName(file1); 
	
	String file2 = (String) files.nextElement(); 
	String filename2 = multi.getFilesystemName(file2); 
	String file3 = (String) files.nextElement(); 
	String filename3 = multi.getFilesystemName(file3); 
%>
	<table border="1">
		<tr>
			<th width="100">이 름</th>
			<th width="100">제 목</th>
			<th width="100">파 일</th>
		</tr> <%--[ 한 행이 끝나는 ] 태그. --%>		
		<%		  	
    	out.println("<tr><td>" + name1 +"</td>");   	
    	out.println("<td>" + subject1 + "</td>"); 
    	out.println("<td>" + filename1 + "</td></tr>\n"); //1개행 3개열 종료부분.
    	out.println("<tr><td>" + name2 +"</td>");   	
    	out.println("<td>" + subject2 + "</td>"); 
    	out.println("<td>" + filename2 + "</td></tr>\n"); //2개행 3개열 종료부분
    	out.println("<tr><td>" + name3 +"</td>");   	
    	out.println("<td>" + subject3 + "</td>"); 
    	out.println("<td>" + filename3 + "</td></tr>\n"); //3개행 3개열 종료부분
		%>
	</table>
</body>
</html>
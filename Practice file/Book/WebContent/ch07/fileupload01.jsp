<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload(파일 업로드)</title>
</head>
<body>
	<%--
	  파일 업로드를 위한 폼태그에 method 속성 값은 post로 작성!
	  enctype 속성값은 "multipart/form-data
	 --%>
	<form action="fileupload01_process.jsp" name ="fileForm" method="post"
	      enctype="multipart/form-data">
		<p> 이 름 : <input type="text" name="name">
		<p> 제 목 : <input type="text" name="subject">
		<p> 파 일 : <input type="file" name="filename">
		<p><input type="submit" value = "파일 올리기">
	</form>
</body>
</html>
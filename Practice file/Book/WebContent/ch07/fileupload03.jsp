<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload(Commons-FileUpload를 이용한 파일 업로드)</title>
</head>
<body>
	<%-- p, 232
	  파일 업로드를 위한 폼태그에 method 속성 값은 post로 작성!
	  enctype 속성값은 "multipart/form-data
	 --%>
	<form action="fileupload03_process.jsp" method="post"
	      enctype="multipart/form-data">
		<p> 파 일 : <input type="file" name="filename">
		<p><input type="submit" value = "파일 올리기">
	</form>
</body>
</html>
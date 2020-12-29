<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload(파일 업로드)</title>
</head>
<body>
	<%-- p, 225
	  파일 업로드를 위한 폼태그에 method 속성 값은 post로 작성!
	  enctype 속성값은 "multipart/form-data
	 --%>
	<form action="fileupload02_process.jsp" name ="fileForm" method="post"
	      enctype="multipart/form-data">
		<p> 이 름1 : <input type="text" name="name1">
		    제 목1 : <input type="text" name="subject1">
		    파 일1 : <input type="file" name="filename1">
		
		<p> 이 름2 : <input type="text" name="name2">
		    제 목2 : <input type="text" name="subject2">
		    파 일2 : <input type="file" name="filename2">
		
		<p> 이 름3 : <input type="text" name="name3">
		    제 목3 : <input type="text" name="subject3">
		    파 일3 : <input type="file" name="filename3">
		<p><input type="submit" value = "파일 올리기">
	</form>
</body>
</html>
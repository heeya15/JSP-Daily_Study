<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Validation(유효성 검사) p,257</title>
</head>
<body>
<%-- 13행: 전송을 클릭하면 핸들러함수 CheckForm()이 실행되도록 onclick 속성 작성. --%>
	<form name="loginForm" >
		<p>아이디 : <input type ="text" name= "id">
		<p>비밀번호 : <input type ="password" name= "passwd">
		<p><input type ="submit" value="전송"  onclick="CheckForm()">
	</form>
</body>
<%--폼 페이지에 입력 항목의 데이터를 검사하는 
    핸들러 함수 CheckForm()작성 --%>
<script type="text/javascript">
	function CheckForm() {
		
		alert("아이디: " +document.loginForm.id.value +"\n" +
	          "비밀번호: "+document.loginForm.passwd.value);
	}
</script>
</html>
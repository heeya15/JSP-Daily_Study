<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Validation(기본 유효성 검사)길이 검사 p,263</title>
</head>
<body>
<%-- 13행: 전송을 클릭하면 핸들러함수 CheckForm()이 실행되도록 onclick 속성 작성. --%>
	<form name="loginForm" action="validation03_process.jsp" method="post">
		<p>아이디 : <input type ="text" name= "id">
		<p>비밀번호 : <input type ="password" name= "passwd">
		<p><input type ="button" value="전송"  onclick="checkLogin()">
	</form>
</body>
<%--폼 페이지에 입력 항목의 데이터를 검사하는 
    핸들러 함수 CheckForm()작성 --%>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm;
		//아이디가 4보다 작거나, 12보다 크게 입력된 경우 에러메시지 출력.
		if(form.id.value.length < 4 || form.id.value.length > 12){ 
			alert("아이디는 4~12자 이내로 입력해주세요.");
			form.id.focus();
			return false;
		}
		else if(form.passwd.value.length <4){//비밀번호가 4보다 작게 입력할경우 오류메시지 출력.
			alert("비밀번호는 4자 이상으로 입력해야 합니다!");
			form.passwd.focus(); //해당 입력항목에 커서가 놓임.
			return false;
		}
		form.submit();// 폼 페이지에서 입력한 데이터 값을 [ 서버로 전송 ]합니다. (수동 submit 처리)
	}
</script>
</html>
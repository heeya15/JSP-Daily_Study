<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Validation(기본 유효성 검사) p,260</title>
</head>
<body>
<%-- 13행: 전송을 클릭하면 핸들러함수 CheckForm()이 실행되도록 onclick 속성 작성. --%>
	<form name="loginForm" action="validation02_process.jsp" method="post">
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
		if(form.id.value == ""){ //아이디가 입력되지 않으면 오류메시지 출력, 해당 입력항목에 커서가 놓임.
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return false;
		}
		else if(form.passwd.value==""){//비밀번호가 입력되지 않으면 오류메시지 출력, 
			alert("비밀번호를 입력해주세요.");
			form.passwd.focus(); //해당 입력항목에 커서가 놓임.
			return false;
		}
		form.submit();// 폼 페이지에서 입력한 데이터 값을 [ 서버로 전송 ]합니다. (수동 submit 처리)
	}
</script>
</html>
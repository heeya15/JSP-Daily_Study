<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Validation(기본 유효성 검사)값이 숫자인지 검사하기 p,267</title>
</head>
<body>
<%-- 13행: 전송을 클릭하면 핸들러함수 CheckForm()이 실행되도록 onclick 속성 작성. --%>
	<form name="loginForm" action="validation04_process.jsp" method="post">
		<p>아이디 : <input type ="text" name= "id">
		<p>비밀번호 : <input type ="password" name= "passwd">
		<p><input type ="button" value="검사하기"  onclick="checkLogin()">
	</form>
</body>
<%--p,267 폼 페이지에 입력한 데이터 값이 숫자인지 검사하기 
    핸들러 함수 checkLogin()작성 --%>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm;
		
		for(i=0;i<form.id.value.length;i++){
			var ch = form.id.value.charAt(i); //문자열에서 인덱스에 위치하는 [ 유니코드 단일문자 반환 ]
					/*
			1. 33보다(특수문자 !) 작거나, 122(소문자z)보다 큰경우
			2. 65보다 크고, 90보다 작은경우
			3. 숫자인경우 에러메시지 출력. -- 즉, [ 영문 소문자를 제외한 경우 ] 에러메시지 출력.
			*/
			if((ch<'a'||ch >'z') && (ch >'A' ||ch <'Z') &&(ch>'0'||ch<'9')){ 
				alert("아이디는 영문 소문자만 입력가능");
				form.id.select();// [ 해당 입력항목에 커서가 놓이도록함. ]
				return;
			}
		} //for문 닫음.
		
		/*
		 - [ 숫자가 아닌경우 true로 ] 에러메시지 출력
		 즉, 비밀번호가 숫자로만 구성된경우 에러메시지 출력 x
		*/
		 if(isNaN(form.passwd.value)){
			alert("비밀번호는 숫자만 입력 가능합니다!");
			form.passwd.select(); //해당 입력항목에 커서가 놓임.
			return;
		}
		form.submit();// 폼 페이지에서 입력한 데이터 값을 [ 서버로 전송 ]합니다. (수동 submit 처리)
	}
</script>
</html>
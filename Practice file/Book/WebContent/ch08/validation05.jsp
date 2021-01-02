<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원 가입 폼페이지에 입력한 Validation(데이터 형식 유효성 검사) p,274</title>
</head>
<body>
	<h3>회원 가입</h3>		
	<form action="validation05_process.jsp" name = "Member" method="post">
		<%-- 텍스트 입력양식중 [ 입력양식을 식별 하기위해 ] [ name 속성을 작성 ] --%>
		<p>아이디 : <input type="text" name="id">   
	    <%-- 입력되는 [ 비밀번호가 보이지 않도록 ] input 태그의 type 속성값을 =[password]로 작성 --%>
		<p>비밀번호 : <input type="password" name="passwd">
		<p>이름 : <input type="text" name="name" >
		<%-- 
			1. [ 21행 에서 29행중 ] 첫 번째 번호는 [ ** 사용자가 번호 **를 [ 선택할 수 있도록 ] ] 
		    select 태그와 [ option 태그 ]로 작성
		    2. 두 번째와 세 번째 번호는 [ 사용자가 직접 번호를 입력 ]하도록 
		    input 태그의 type 속성 값을 text로 작성하고 name 속성을 작성 --%>
		<p>연락처 : <select name="phone1" size="1">
					  <option value="010">010</option>
					  <option value="011">011</option>
					  <option value="016">016</option>
					  <option value="017">017</option>
					  <option value="019">019</option>
				  </select> -
		          <input type="text" maxlength="4" size="4" name="phone2"> -
		          <input type="text" maxlength="4" size="4" name="phone3">
		
		<p>이메일: <input type="text" name ="email">
		<p><input type="button" value="가입하기" onclick="checkMember()">	
		   <input type="reset" value="다시쓰기">
	</form>
</body>
<%--
	p,274 폼 페이지에 입력한 데이터 값을 데이터 유효성 검사하기 
    핸들러 함수 checkMember()작성 --%>
    
<script type="text/javascript">
	function checkMember() {
		//영문 대문자와 소문자,한글, 한글의 자음과 모음만 검사하도록 정규 표현식 작성
		var regExpId = /^[a-z|A-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var regExpName = /^[가-힣]*$/;
		var regExpPasswd = /^[0-9]*$/; //비밀번호는 숫자만 검사하도록 정규 표현식 작성.
		
		/* 50행
		휴대폰 번호는 숫자로 처음은 3글자- 
		두번째는 [ 최소3개 최대 4개 숫자로 이뤄야함 ]
		세번째는 4개 숫자로 이뤄진 형태로 이뤄야함.
		*/
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/; 
		var regExpEmail =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var form = document.Member;
		var id = form.id.value;
		var passwd = form.passwd.value;
		var name = form.name.value;
		var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		var email = form.email.value;
		//정규 표현식 형식에 맞게 입력하지않으면 false가 부정이되어 true가되어 if문 성립.
		if(!regExpId.test(id)){ 
        	alert("아이디는 문자로 시작해주세요!.");
      		form.id.select();
        	return;
        }
		if(!regExpPasswd.test(passwd)){
        	alert("비밀번호는 숫자만 입력해주세요!.");
        	//form.passwd.select();
        	return;
        }
		if(!regExpName.test(name)){
        	alert("이름은 한글만 입력해주세요!.");
      		form.name.select();
        	return;
        }
		if(!regExpPhone.test(phone)){
        	alert("(두번째 번호는 3~4글자로)연락처 입력을 다시 확인해주세요.");
        	return;
        }
		if(!regExpEmail.test(email)){
        	alert("이메일 입력을 확인해주세요!.");
        	return;
        }
		form.submit();// 폼 페이지에서 입력한 데이터 값을 [ 서버로 전송 ]합니다. (수동 submit 처리)
	}
</script>
</html>
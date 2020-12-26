<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing(폼 처리)</title>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="#" method="post">
		<%-- 텍스트 입력양식중 입력양식을 식별 하기위해 [ name 속성을 작성 ] --%>
		<p>아이디 : <input type="text" name="id">
			      <input type="button" value="아이디 중복 검사">
	    <%-- 입력되는 비밀번호가 보이지 않도록 input 태그의 type 속성값을 =[password]로 작성 --%>
		<p>비밀번호 : <input type="password" name="passwd">
		<p>이름 : <input type="text" name="name" >
		<%-- [ 20행 에서 22행은 ] 연락처 값을 입력받도록 input 태그 3개의 type 속성을 text로 작성하고 
		     name 속성을 작성하여 각 입력양식을 식별--%>
		<p>연락처 : <input type="text" maxlength="4" size="4" name="phone1">-
		          <input type="text" maxlength="4" size="4" name="phone2">-
		          <input type="text" maxlength="4" size="4" name="phone3">
		<%-- 성별 값 중 [ 하나만 선택 ] 입력받도록 input 태그 2개의 type 속성을 radio로 작성
		     그리고 '남성'이 ** 초깃값 **으로 선택되도록 [ checked 속성을 설정 ] --%>
		<p><input type="radio" name="sex" value="남성" checked>남성
		   <input type="radio" name="sex" value="여성">여성
		<%-- 취미 값 중 [ 여러 개를 선택 ] 입력받도록 input 태그 3개의 type 속성을 checkbox로 작성
		     그리고 '독서'가 ** 초깃값 **으로 선택되도록 [ checked 속성을 설정 ] --%>
		<p><input type="checkbox" name="hobby1" value="독서" checked>독서
		   <input type="checkbox" name="hobby2" value="운동">운동
		   <input type="checkbox" name="hobby3" value="영화">영화
		 <%-- 입력된 데이터를 [ 서버로 전송 ]하도록 input 태그의 type 속성 값을 [ submit로 작성 ]
		     또한 [ 입력된 데이터를 지우도록 ] input 태그의 type 속성 값을 reset으로 작성 --%>  
		<p><input type="submit" value="가입하기">	
		   <input type="reset" value="다시쓰기">
	</form>
</body>
</html>
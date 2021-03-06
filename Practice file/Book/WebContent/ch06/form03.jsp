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
		<%-- p,195 action 속성을 아래와 같이 수정. --%>
	<form action="form03_process.jsp" name = "member" method="post">
		<%-- 텍스트 입력양식중 입력양식을 식별 하기위해 [ name 속성을 작성 ] --%>
		<p>아이디 : <input type="text" name="id">
			      <input type="button" value="아이디 중복 검사">
	    <%-- 입력되는 비밀번호가 보이지 않도록 input 태그의 type 속성값을 =[password]로 작성 --%>
		<p>비밀번호 : <input type="password" name="passwd">
		<p>이름 : <input type="text" name="name" >
		<%-- [ 22행 에서 30행중 ] 첫 번째 번호는 [ ** 사용자가 번호 **를 선택할 수 있도록 ] 
		    select 태그와 option 태그로 작성
		    두 번째와 세 번째 번호는 [ 사용자가 직접 번호를 입력 ]하도록 
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
		<%-- 성별 값 중 [ 하나만 선택 ] 입력받도록 input 태그 2개의 type 속성을 radio로 작성
		     그리고 '남성'이 ** 초깃값 **으로 선택되도록 [ checked 속성을 설정 ] --%>
		<p><input type="radio" name="sex" value="남성" checked>남성
		   <input type="radio" name="sex" value="여성">여성
		<%-- 취미 값 중 [ 여러 개를 선택 ] 입력받도록 input 태그 3개의 type 속성을 checkbox로 작성
		     그리고 '독서'가 ** 초깃값 **으로 선택되도록 [ checked 속성을 설정 ] 
		     p,197 수정 부분은 name 속성 값을 동일하게 hobby로 작성.--%>
		<p><input type="checkbox" name = "hobby" value="독서" checked>독서
		   <input type="checkbox" name = "hobby" value="운동">운동
		   <input type="checkbox" name = "hobby" value="영화">영화
		   
		 <%-- 입력된 데이터를 [ 서버로 전송 ]하도록 input 태그의 type 속성 값을 [ submit로 작성 ]
		     또한 [ 입력된 데이터를 지우도록 ] input 태그의 type 속성 값을 reset으로 작성 --%> 
		 <%--가입 인사 값을 여러 줄로 입력받도록 너비(cols)와, 높이(rows)를 30,3으로하여 
		     textarea 태그를 작성  --%> 
		<p><textarea name = "comment" rows="3" cols="30" placeholder="가입 인사를 입력해주세요" ></textarea>
		<p><input type="submit" value="가입하기">	
		   <input type="reset" value="다시쓰기">
	</form>
</body>
</html>
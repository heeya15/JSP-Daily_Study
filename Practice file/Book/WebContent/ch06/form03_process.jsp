<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing(폼 데이터 처리)</title>
</head>
<body>
	<%
	//P,196 예제 request 내장 객체의 getParameter()메소드를 호출하여 전송하는 데이터를 받습니다.
	//그 후 [ 표현문 태그 ]에서 폼 페이지에서 전달받은 [ 폼 데이터 값을 출력 ].
		request.setCharacterEncoding("UTF-8");
		String id =	request.getParameter("id");
		String passwd =	request.getParameter("passwd");
		String name = request.getParameter("name");
		String phone1 =	request.getParameter("phone1");
		String phone2 =	request.getParameter("phone2");
		String phone3 =	request.getParameter("phone3");
		String sex = request.getParameter("sex");
		//아래는 폼 페이지에서 [ 입력된 취미 값을 배열로 얻어 오도록 ] 요청.  
		String hobby[] = request.getParameterValues("hobby"); 
		String comment = request.getParameter("comment");		
	%>
	<p> 아이디 : <%=id %>
	<p> 비밀번호 : <%=passwd %>
	<p> 이름 : <%=name %>
	<p> 연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %>
	<p> 성별 : <%=sex %>
	<p> 취미 : <%
				if(hobby !=null){ // 22행 배열에 저장된 취미 값을 출력하도록 [ 표현문 태그를 작성. ]
					for(int i=0; i<hobby.length;i++){
						out.println(" " + hobby[i]);
					}
				}
			  %>
	<p> 가입 인사 : <%=comment %>
</body>
</html>
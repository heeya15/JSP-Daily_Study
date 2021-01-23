<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="/menu1.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>

	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) { //msg 변수에 값이 있다면.
				if (msg.equals("0")) // 설정된 msg 값이 0이면 --> 정상적으로 회원정보 수정.
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				
				else if (msg.equals("1")) //설정된 msg 값이 1이면 --> 회원가입 축하드린다 메시지 출력.
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				
				else if (msg.equals("2")) { //설정된 msg 값이 2이면 --> 정상적으로 로그인
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
		%>
	</div>	
</body>
</html>
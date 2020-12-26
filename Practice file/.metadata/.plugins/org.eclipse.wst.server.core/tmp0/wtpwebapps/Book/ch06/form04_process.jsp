<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing(폼 데이터 처리)</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>요청 파라미터 이름</td>
			<td>요청 파라미터 값</td>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			Enumeration paramNames = request.getParameterNames();
			while(paramNames.hasMoreElements()){ // 전송된 요청 파라미터가 없을 때까지 반복
				String name = (String)paramNames.nextElement(); //요청 파라미터 [이름을] 가져옴
				out.println("<tr><td>"+name+"</td>");
				String paramValue = request.getParameter(name);//19행에서 얻어온 요청 파라미터 이름으로 "값을" 들고옴
				out.println("<td>"+paramValue+"</td></tr>\n");
			}
		%>
	</table>
</body>
</html>
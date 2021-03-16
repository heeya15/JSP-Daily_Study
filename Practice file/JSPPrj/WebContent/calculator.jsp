<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input {
	width: 50px;
	height: 50px;
}

.output {
	height: 50px;
	background: #e9e9e9;
	font-size: 24px;
	font-weight: bold;
	text-align: right;
	padding: 0px, 5px;
}
</style>
<%
	int x = 3;
	int y = 4;
%>
</head>
<body>

	<%-- 중요한 것은 사용자가 입력을 해서 전달할때 method를 post로 했다라는 것  --%>
	<form action="calc4" method="post"> 
		<table>
		<!-- 맨 위에 값을 띄우는 행의 열은 하나만 있으면 된다. 
		colspan=4 로 한 이유는 다른아이들은 '4열'로 구성되있으니, 똑같이 4열을 쓰겠다 라는 뜻.-->
			<tr> 
				<td class="output" colspan="4">${3+4}</td>
			</tr>
			
			<tr> <!-- '한개의 행'에 4개의 열이 있다. -->
				<td><input type="submit" name="operator" value="CE" /></td>
				<td><input type="submit" name="operator" value="C" /></td>
				<td><input type="submit" name="operator" value="BS" /></td>
				<td><input type="submit" name="operator" value="/" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="value" value="7" /></td>
				<td><input type="submit" name="value" value="8" /></td>
				<td><input type="submit" name="value" value="9" /></td>
				<td><input type="submit" name="operator" value="*" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="value" value="4" /></td>
				<td><input type="submit" name="value" value="5" /></td>
				<td><input type="submit" name="value" value="6" /></td>
				<td><input type="submit" name="operator" value="-" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="value" value="1" /></td>
				<td><input type="submit" name="value" value="2" /></td>
				<td><input type="submit" name="value" value="3" /></td>
				<td><input type="submit" name="operator" value="+" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="value" value="0" /></td>
				<td><input type="submit" name="dot" value="." /></td>
				<td><input type="submit" name="operator" value="=" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--6~7행:
	- JSP 페이지에 JSTL의 Core 태그, sql태그를 사용하도록 taglib 디렉티브 태그를 작성.
    --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
<title>JSTL</title>
</head>
<body>
	<%
	    request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");	
	%>
   <%-- p,582 < Sql 태그종류 설명> 
	 - 23행 : DataSource를 설정하는데 사용. -> 
	 - [ 데이터베이스를 ** 연결 **하기 위한 ] 기본 설정을 함
	 --%>
	<sql:setDataSource var="dataSource" 
	       url="jdbc:oracle:thin:@localhost:1521:xe" 
	       driver="oracle.jdbc.driver.OracleDriver" user="jisung" password="db2019"/>
	       
	 <%-- resultSet 변수에 member 테이블에 id와 비밀번호가 같을경우 --> [이름] 을 변경한다.. --%>
	<sql:update var="resultSet" dataSource="${dataSource }">
		UPDATE MEMBER 
		SET name = ? 
		WHERE id = ? and passwd = ?
		<sql:param value="<%=name %>"/>
		<sql:param value="<%=id %>"/>   <%-- 폼 페이지에 전송된 데이터를 [ 물음표에 설정 ]하도록 작성. --%>
		<sql:param value="<%=passwd %>"/>
	</sql:update>
    <c:import var="url" url="sql01.jsp"/> <%--url을 사용하여 [ 다른 리소스의 결과를 삽입 ]함.즉 테이블 조회하는 결과 삽입. --%>
     	${url}
</body>
</html>
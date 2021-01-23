<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%--6~7행:
	- JSP 페이지에 JSTL의 Core 태그, sql태그를 사용하도록 taglib 디렉티브 태그를 작성.
    --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>

	<%-- p,582 < Sql 태그종류 설명> 
	 - 23행 : DataSource를 설정하는데 사용. -> 
	 - [ 데이터베이스를 ** 연결 **하기 위한 ] 기본 설정을 함
	 --%>
	<sql:setDataSource var="dataSource" 
	       url="jdbc:oracle:thin:@localhost:1521:xe" 
	       driver="oracle.jdbc.driver.OracleDriver" user="jisung" password="db2019"/>
	       
    <%-- resultSet 변수에 < member 테이블 조회 쿼리 결과를 저장. > --%>
	<sql:query dataSource="${dataSource}" var="resultSet">
	   SELECT * 
	   FROM MEMBER 
	   WHERE id =? and password = ?  
	   <sql:param value="<%=id%>" /> <%-- 폼 페이지에 전송된 데이터를 [ 물음표에 설정 ]하도록 작성. --%>
	   <sql:param value="<%=password%>" />
	</sql:query>

	<c:forEach var="row" items="${resultSet.rows}">
		<%
			session.setAttribute("sessionId", id); // 로그인 id를 [ 세션 id로 설정. ]
		%>
		<c:redirect url="resultMember.jsp?msg=2" />
	</c:forEach>
	
	<c:redirect url="loginMember.jsp?error=1" />

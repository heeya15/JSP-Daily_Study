<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원 탈퇴 페이지 이다. --%>
<%--6~7행:
	- JSP 페이지에 JSTL의 Core 태그, sql태그를 사용하도록 taglib 디렉티브 태그를 작성.
    --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
	 <%-- p,582 < Sql 태그종류 설명> 
	 - 23행 : DataSource를 설정하는데 사용. -> 
	 - [ 데이터베이스를 ** 연결 **하기 위한 ] 기본 설정을 함
	 --%>
	<sql:setDataSource var="dataSource" 
	       url="jdbc:oracle:thin:@localhost:1521:xe" 
	       driver="oracle.jdbc.driver.OracleDriver" user="jisung" password="db2019"/>
	       
 <%-- resultSet 변수에 member 테이블에 id와 세션 id가 같을경우 --> 해당 행을 [ 삭제 ]한다.. --%>
	<sql:update dataSource="${dataSource}" var="resultSet">
	   DELETE 
	   FROM member 
	   WHERE id = ?
	   <sql:param value="<%=sessionId%>" />
	</sql:update>
	
	<c:if test="${resultSet>=1}"> <%-- [ 새로 삭제한 데이터가 ] 1개 이상인 경우. --%>
		<c:import var="url" url="logoutMember.jsp" />  <%--url을 사용하여 [ 다른 리소스의 결과를 삽입 ]함. --%>
		<c:redirect url="resultMember.jsp" /> <%-- 설정한 경로로 이동한다 --%>
	</c:if>


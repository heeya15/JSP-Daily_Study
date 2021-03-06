<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%> <%-- Date 객체를 사용하기위해 작성 --%>
<%--6~7행:
	- JSP 페이지에 JSTL의 Core 태그, sql태그를 사용하도록 taglib 디렉티브 태그를 작성.
    --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy"); //년 
	/* getParameterValues() 메소드는 
	   이름이 birthmm인 <모든 파라미터의 값을> 배열로 구한다. 
	   존재하지 않을 경우 null을 리턴 */
	String month = request.getParameterValues("birthmm")[0]; //월.
	String day = request.getParameter("birthdd");
	String birth = year + "/" + month + "/" + day;
	
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

 	<%-- p,582 < Sql 태그종류 설명> 
	 - 23행 : DataSource를 설정하는데 사용. -> 
	 - [ 데이터베이스를 ** 연결 **하기 위한 ] 기본 설정을 함
	 --%>
	<sql:setDataSource var="dataSource" 
	       url="jdbc:oracle:thin:@localhost:1521:xe" 
	       driver="oracle.jdbc.driver.OracleDriver" user="jisung" password="db2019"/>
	       
	<%-- resultSet 변수에 member 테이블에 새로운 데이터 <삽입> 쿼리 결과를 저장. --%>
	<sql:update dataSource="${dataSource}" var="resultSet">
	   INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
	    <sql:param value="<%=id%>" />
		<sql:param value="<%=password%>" />
		<sql:param value="<%=name%>" />
		<sql:param value="<%=gender%>" />
		<sql:param value="<%=birth%>" />
		<sql:param value="<%=mail%>" />
		<sql:param value="<%=phone%>" />
		<sql:param value="<%=address%>" />
		<sql:param value="<%=timestamp%>" /> <%--가입 일자 --%>
	</sql:update>
<c:if test="${resultSet>=1}"> <%-- [ 새로 가입한 데이터가 ] 1개 이상인 경우. --%>
	<c:redirect url="resultMember.jsp?msg=1" /> <%-- 설정한 경로로 이동한다. msg의 값을 1로 설정해서. --%>
</c:if>


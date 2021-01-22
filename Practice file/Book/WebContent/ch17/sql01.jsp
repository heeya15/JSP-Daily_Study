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
   <%-- p,582 < Sql 태그종류 설명> 
	 - 17행 : DataSource를 설정하는데 사용. -> 
	 - [ 데이터베이스를 ** 연결 **하기 위한 ] 기본 설정을 함
	 --%>
	<sql:setDataSource var="dataSource" 
	       url="jdbc:oracle:thin:@localhost:1521:xe" 
	       driver="oracle.jdbc.driver.OracleDriver" user="jisung" password="db2019"/>
	       
	 <%-- resultSet 변수에 member 테이블 조회 쿼리 결과를 저장. --%>
	<sql:query var="resultSet" dataSource="${dataSource }">
		select * from member
	</sql:query>
	
	<table border="1">
	
		<tr>		
			<%-- 테이블조회 결과중 해당 [ 컬럼명 ] 출력한다. --%>
		  <c:forEach var="columnName" items="${resultSet.columnNames}">
		     <th width ="100"><c:out value="${columnName}"/></th>
		  </c:forEach>
		</tr>
		
		<%-- 레코드의 수 만큼 반복한다. 
		     items 속성은 = Collection 객체(List, Map) --%>
	 	<c:forEach var="row" items="${resultSet.rowsByIndex}">
    	<tr>
			<%-- var= "column"은 --> for문안에서 사용할 변수 이름이다. 
				레코드의 [ 필드수 ] 만큼 반복한다. --%>
     	 	<c:forEach var="column" items="${row}">
 			<td>
 			<%-- 45행: 조건문을 처리할때 사용하는 태그다  --%>
      			<c:if test="${column != null }"> <%--해당 [ 필드값이 ] null이 아니면--%>
      				<c:out value="${column }"/>
      			</c:if>
      			<c:if test="${column == null }"> <%--해당 필드값이 null이면 --%>
      				 &nbsp;
      			</c:if>
      		</td>
      		</c:forEach>
      	</tr><%-- 38행 tr태그 닫는부분. --%>
        </c:forEach>
        
	</table>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ page import="mvc.model.BoardDAO" %>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Board</title>
<!-- 아래는 이페이지에서 사용되는 링크태그에 글색깔을 검은색으로 하고 밑줄을 없애는 방법이다. -->
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("sessionId") != null){
			userID = (String)session.getAttribute("sessionId");
		}
		int pageNumber = 1; //[ 기본은 ]--> 1 페이지를 할당
		// 만약 [ 파라미터로 넘어온 ] 오브젝트 타입 'pageNumber'가 존재한다면
		// 물론 파라미터는 정수형'int'타입으로 캐스팅(형변환)을 해주고 그 값을 'pageNumber'변수에 저장한다
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<jsp:include page="../menu1.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
		<!-- table table-striped은 홀수와 짝수를 번갈아가면서 
		색상이 변경되도록 해서 보다 더 보기좋은 테이블이 나오게 해주는 요소입니다. -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">글쓴이(작성자)</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<!-- 게시판 글 목록 -->
					<%
						BoardDAO bbsDAO = new BoardDAO(); // 인스턴스 생성
						//현재의 리스트에서 가져온 게시글 목록을 의미함.
						ArrayList<BoardDTO> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getNum() %></td>
						<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
						<td><a href="view.jsp?bbsID=<%= list.get(i).getNum() %>">
							<%= list.get(i).getSubject().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
							</a>
						</td>
						<td><%= list.get(i).getName() %> ( <%=list.get(i).getId() %> ) </td>
						<td><%= list.get(i).getRegist_day().substring(0, 11) + 
						        list.get(i).getRegist_day().substring(11, 13) + "시"
							     + list.get(i).getRegist_day().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			
		<!-- 게시판 페이지 이동 버튼 -->
		<!-- 아래는 페이징 처리 영역 -->
		<table width="100%">
		  <tr>
				<%
				   // [ 페이지가 1이 아니라면 ] '이전' 으로 돌아갈수 있는 버튼이 필요하겠다.
					if(pageNumber != 1){
				%>
				    <td align="left">
					<a href="list.jsp?pageNumber=<%=pageNumber - 1 %>"
						class="btn btn-success btn-arraw-left">이전</a></td>
				<%
					} //if문 블록 닫기.
					// 만약 다음페이지가 존재한다면 다음페이지로 이동하게 '다음' 페이지로 이동하게끔 한다
				    if(bbsDAO.nextPage(pageNumber + 1)){
				%>  
				    <td align="left">
					<a href="list.jsp?pageNumber=<%=pageNumber + 1 %>"
						class="btn btn-success btn-arraw-left">다음</a></td>
				<%
					}
				%>
			       <td align="right"><a href="writeForm.jsp" class ="btn btn-primary pull-right">글쓰기</a></td>
			</tr>
		</table>
		
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>
<%@page import="mvc.model.BoardDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="mvc.model.BoardDTO"%>
<!-- 데이터 베이스 접근 객체또한 가져온다 -->
<%@ page import="mvc.model.BoardDAO"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
<body>
    <%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("sessionId") != null){
			userID = (String)session.getAttribute("sessionId");
		}
		
		// bbsID를 초기화 시키고
		// 'bbsID'라는 데이터가 넘어온 것이 존재한다면 캐스팅을 하여 변수에 담는다
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){ //즉, ** 게시글 제목을 클릭 **하였다면.
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		// 만약 넘어온 데이터가 없다면
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='./list.jsp'");
			script.println("</script");
		}
		
		// [ 유효한 글 ]이라면 구체적인 정보를 'bbs'라는 인스턴스에 담는다
		BoardDTO bbs = new BoardDAO().getBoardDTO(bbsID);
	%>
	<jsp:include page="../menu1.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판 글 보기</h1>
		</div>
	</div>

	<div class="container">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control"	value=" <%=bbs.getName()%>" disabled>
				</div>
			</div>
			<%-- 
				- 여기서 중요한 문제점이 있다 .
				- 맵 해킹 공격으로서 크로스 사이트 스크립팅(XSS) 공격으로
				  게시판에 글을 작성할때 스크립트문장을 삽입함으로써 글을 보는 사람한테
				  어떠한 영향을 끼치는 [ 해킹 기법 ]이다.
				- 만약 특수문자 처리가 잘 되어있지 않는다면 다음과 같은 문제가 생긴다.
				- 따라서 아래와 같이 replaceAll로 특수문자를 치환하여 처리 해주면된다.
				※ 또한 [ 게시글 목록을 보여주는 list.jsp 파일 ]에서도 제목에 해당하는 부분에 아래와 같이 추가로 작성해주면 된다.
				정리하자면 특수문자를 치환함으로써 [ 보안상의 문제도 ] 해결할 수 있는 것이다.
			 --%>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" value="<%=bbs.getSubject().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>" disabled >
				</div>
			</div>
			 <%--  
		      - 데이터베이스에 넣은 글자에 꺾세가 들어있으면 
			    그게 html 기호인지 출력을하는 용도인지 우리의 웹 브라우저는 모르기때문에
			    우리가 등록한 글과 다르게 출력할수 있다.
		      - 그래서 내용을 출력하는 부분에서 replaceAll() 메소드를 이용하여 
		         이러한 특수문자를 출력하는 부분을 제대로 처리해주면 된다.
		      - 본인은 아래 방법을 안해도 특수문자가 제대로 출력되었었다. --%>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="70" rows="10" disabled><%=bbs.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "") %>
					</textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				<!-- 해당 글의 [ 작성자가 본인 ]이라면 수정과 삭제가 가능하도록 코드 추가 -->
					<c:set var="userId" value="<%=bbs.getId()%>" />
					<c:if test="${sessionId == userId}">
						<a	href="updateForm.jsp?bbsID=<%= bbsID %>" class="btn btn-success" ">수정</a>
						<%-- onclick 이벤트로 아래와 같은 삭제할거냐는 메시지를 띄운다.  --%>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-danger"> 삭제</a> 	
					</c:if>
					<a href="./list.jsp" class="btn btn-primary"> 목록</a>
				</div>
			</div>
	</div>
	<hr>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>



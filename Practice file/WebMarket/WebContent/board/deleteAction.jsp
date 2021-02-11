<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="mvc.model.BoardDAO"%>
<%@ page import="mvc.model.BoardDTO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	   
		// 현재 세션 상태를 체크한다
		String userID = null;
		if(session.getAttribute("sessionId") != null){
			userID = (String)session.getAttribute("sessionId");
		}
		// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='../member/loginMember.jsp'");
			script.println("</script>");
		}
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='list.jsp'");
			script.println("</script>");
		}
		//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 [ 본인이 맞는지 체크한다. ]
		// 왜냐하면 도메인 창에서 자기가 쓴글이 아닌것을 deleteAction.jsp?bbsID=14 이런식으로 삭제를 할 수도 있기 때문.
		BoardDTO bbs = new BoardDAO().getBoardDTO(bbsID);
		if(!userID.equals(bbs.getId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='list.jsp'");
			script.println("</script>");
		} //한칸 내어쓰기 단축키 (shift+ tab)
		
		//작성자 본인이 맞는경우 게시글 삭제를 한다. 
		else{ 
			// 글 [ 삭제 로직 ]을 수행한다
			BoardDAO bbsDAO = new BoardDAO();
			int result = bbsDAO.delete(bbsID);
			// 데이터베이스 오류인 경우
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제하기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			// 글 수정이 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제하기 성공')");
				script.println("location.href='list.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
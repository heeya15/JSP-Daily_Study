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
	   //아래와 같이 한글처리 안깨지게 해줘야함!! 꼭
	    request.setCharacterEncoding("UTF-8"); // 한글을 처리하기 위해 문자 인코딩 유형을 utf-8로 설정.
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
		//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
		BoardDTO bbs = new BoardDAO().getBoardDTO(bbsID);
		if(!userID.equals(bbs.getId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='list.jsp'");
			script.println("</script>");
		} else{
				// 넘겨받은 요청 데이터가 [ 입력이 안 됐거나 빈 값이 있는지 체크 ]한다
				if(request.getParameter("subject") == null || request.getParameter("content") == null
					|| request.getParameter("subject").equals("") || request.getParameter("content").equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					// 정상적으로 입력이 되었다면 [ 글 수정 로직을 수행(제목, 내용을) ]한다
					BoardDAO bbsDAO = new BoardDAO();
					int result = bbsDAO.update(bbsID, request.getParameter("subject"), request.getParameter("content"));
					// 데이터베이스 오류인 경우
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정하기에 실패했습니다')");
						script.println("history.back()");
						script.println("</script>");
					}
					// 글 수정이 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
					else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정하기 성공')");
						script.println("location.href='list.jsp'");
						script.println("</script>");
					}
				}
		}
	
	%>
</body>
</html>
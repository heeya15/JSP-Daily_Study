package com.newlecture.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.Notice;
//아래 주석으로 [ 서블릿과 URL의 매핑정보 ]를 남길 수 있다. 그래서 web.xml 가서 불필요한 설정 필요없음.
@WebServlet("/notice/detail")
public class NoticeDetailController extends HttpServlet{
     @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			             throws ServletException, IOException {
		int id1 = Integer.parseInt(request.getParameter("id"));
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";// 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "NEWLEC"; // 사용자 계정
		String pw = "oradb"; // 사용자 계정의 패스워드
		String sql = "SELECT * FROM NOTICE WHERE ID = ?";

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, id, pw);
			PreparedStatement st = con.prepareStatement(sql); // 쿼리문을 넘겨받아 미리 준비한다.
			// 일반적인 인덱스 번호와 달리 1부터 인덱스가 시작된다.
			st.setInt(1, id1); // 인덱스 번호, 넣어줄 데이터
			ResultSet rs = st.executeQuery(); // 위에 쿼리를 조회한 결과가 서버쪽에 만들어짐.

			rs.next();// 서버 쪽에 만든 결과를 가져오기 위해 [ rs의 next 메소드를 호출 ].
			String title = rs.getString("TITLE");
			Date regdate = rs.getDate("REGDATE");
			String writerId = rs.getString("WRITER_ID");
			String hit = rs.getString("HIT");
			String files = rs.getString("FILES");
			String content = rs.getString("CONTENT");
			
			Notice notice = new Notice(id1,title,regdate,writerId,hit,files,content);
			request.setAttribute("n", notice);
			/*
			request.setAttribute("title", title);
		    request.setAttribute("regdate", regdate);
		    request.setAttribute("writerId", writerId);
		    request.setAttribute("hit", hit);
		    request.setAttribute("files", files);
		    request.setAttribute("content", content);
		    */
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        
		request.getRequestDispatcher("/WEB-INF/view/notice/detail.jsp")
		.forward(request, response);
	}
}

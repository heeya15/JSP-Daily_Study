package com.newlecture.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.Notice;
@WebServlet("/notice/list")
public class NoticeListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			                               throws ServletException, IOException {
		List<Notice> list = new ArrayList<>();
		String driver = "oracle.jdbc.driver.OracleDriver"; 
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";// 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "NEWLEC"; // 사용자 계정
	    String pw = "oradb"; // 사용자 계정의 패스워드
		String sql = "SELECT * FROM NOTICE ";				
		
	    try {
			Class.forName(driver);
			/* 
			   - DriverManager 객체로부터 [ 연결된 Connection 객체를 얻어온다. ]
			*/
			Connection con = DriverManager.getConnection(url, id, pw); 
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			//위에서는 데이터베이스 연결 과정이 끝났다하겠다 
			while (rs.next()) { // 테이블에서 가져온게 있으면, true여서 아래코드 수행.
				int id1 = rs.getInt("ID");
				String title = rs.getString("TITLE");
				Date regdate = rs.getDate("REGDATE");
				String writerId = rs.getString("WRITER_ID");
				String hit = rs.getString("HIT");
				String files = rs.getString("FILES");
				String content = rs.getString("CONTENT");	
				
				Notice notice = new Notice(id1,title,regdate,writerId,hit,files,content);
				
				list.add(notice);// 객체를 하나 만들어 줄때마다 [ List에 하나의 객체 추가. ]
			}		
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
	    request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/notice/list.jsp")
		.forward(request, response);
	}
}

package com.newlecture.app.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.newlecture.app.entity.Notice;

public class NoticeService {
	private String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
	private String uid = "NEWLEC"; // 사용자 계정
	private String pwd = "oradb"; // 사용자 계정의 패스워드
	private String driver = "oracle.jdbc.driver.OracleDriver";
	public List<Notice> getList(int page) throws ClassNotFoundException, SQLException {
		
		int start = 1 + ( page-1 ) * 10;   // 1, 11 , 21 , 31 -- 규칙있는 수의 나열이니 [ 수열 ]
		int end = 10*page; // 1페이지면 10,2페이지면 20 ... 이런식으로 간다.
		String sql = "SELECT * FROM NOTICE_VIEW WHERE NUM BETWEEN ? AND ?";
		

		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uid, pwd);
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, start);
		st.setInt(2, end);
		ResultSet rs = st.executeQuery();

		List<Notice> list = new ArrayList<Notice>();

		// 위에서는 데이터베이스 연결 과정이 끝났다
		while (rs.next()) { // 테이블에서 가져온게 있으면, true여서 아래코드 수행.
			int id1 = rs.getInt("ID");
			String title = rs.getString("TITLE"); // TITLE 컬럼에 값을 가져와서
			String writer_id = rs.getString("WRITER_ID");
			String content = rs.getString("CONTENT");
			Date regdate = rs.getDate("REGDATE");
			int hit = rs.getInt("HIT");
			String files = rs.getString("FILES");
			// 생성자의 인수와 똑같이 담아준다.
			Notice notice = new Notice(id1, title, writer_id, content, regdate, hit, files);
			list.add(notice);
		}
		rs.close();
		st.close();
		con.close();
		return list;
	}
	// [ 단일값을 얻어온다는 것 ]을 말할때 흔히 [ Scalar 값을얻어 온다고 ] 말한다.
	public int getCount() throws ClassNotFoundException, SQLException { //총게시글 개수를 얻어내기 위해 select 구문이 필요
		int count = 0; // 반환하는 변수
		String sql = "SELECT COUNT(ID) AS COUNT FROM NOTICE";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uid, pwd);
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery(sql);

		if (rs.next()) //결과집합을 가져온게 있으면 총 게시글 수를 count 변수에 담아 반환해 준다.
			count = rs.getInt("COUNT");
		
		rs.close();
		st.close();
		con.close();
		return count;
	}
	public int insert(Notice notice) throws SQLException, ClassNotFoundException {
		String title = notice.getTitle();
		String writerId = notice.getWriter_id();
		String content = notice.getContent();
		String files = notice.getFiles() ;
		

		String sql = "INSERT INTO notice ("
				+ "    title,"
				+ "    writer_id,"
				+ "    content,"
				+ "    files    "
				+ ") VALUES (?,?,?,?)";		
		
	    Class.forName(driver); 
		
		Connection con = DriverManager.getConnection(url, uid, pwd);
		PreparedStatement st =con.prepareStatement(sql);
		// 일반적인 인덱스 번호와 달리 1부터 인덱스가 시작된다.
		st.setString(1, title); // 인덱스 번호, 넣어줄 데이터
		st.setString(2, writerId);
		st.setString(3, content);
		st.setString(4, files);
		
		int result = st.executeUpdate();

		st.close();
		con.close();
		return result;
	}

	public int update(Notice notice) throws ClassNotFoundException, SQLException {
		String title = notice.getTitle();
		String content = notice.getContent();
		String files = notice.getFiles();
		int Id = notice.getId1();
		
		String sql = "UPDATE NOTICE "
				+ "SET TITLE = ?, CONTENT = ?, FILES = ?"
				+ "WHERE ID = ?";		
		
	    Class.forName(driver); 
		/* - DriverManager 객체로부터 [ 연결된 Connection 객체를 얻어온다. ]*/
		Connection con = DriverManager.getConnection(url, uid, pwd);
		
		//Statement st = con.createStatement();
		PreparedStatement st =con.prepareStatement(sql);
		// 일반적인 인덱스 번호와 달리 1부터 인덱스가 시작된다.
		st.setString(1, title); // 인덱스 번호, 넣어줄 데이터
		st.setString(2, content);
		st.setString(3, files);
		st.setInt(4, Id);
		
		int result = st.executeUpdate();
		
		st.close();
		con.close();
		return result;
	}

	public int delete(int id) throws ClassNotFoundException, SQLException {
		
		String sql = "DELETE NOTICE WHERE ID = ?";		
		
		/* - JDBC 드라이버 로딩되면 [ 자동으로 객체가 생성 ]되고
		 - [ 데이터베이스와 연동하기 위해 ] [ DriverManager 클래스에 등록 ]된다.
		- JDBC 드라이버 로딩은 [ 프로그램 수행 시 한 번만 ] 필요합니다.
		*/
	    Class.forName(driver); 
		/* - DriverManager 객체로부터 [ 연결된 Connection 객체를 얻어온다. ]*/
		Connection con = DriverManager.getConnection(url, uid, pwd);
		
		//Statement st = con.createStatement();
		PreparedStatement st =con.prepareStatement(sql);
		// 일반적인 인덱스 번호와 달리 1부터 인덱스가 시작된다.
		st.setInt(1, id); // 인덱스 번호, 넣어줄 데이터
			
		int result = st.executeUpdate();
		
		st.close();
		con.close();
		return result;
	}

	
}

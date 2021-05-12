package com.newlecture.app.service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.newlecture.app.entity.Notice;

public class NoticeService {
	public List<Notice> getList() throws ClassNotFoundException, SQLException{
		// 오라클 서버에 접속할 정보 정의
				//앞에 (oracle.jdbc.driver)패키지.(OracleDriver)클래스 사용. -- < 데이터 베이스 연동하기위해 사용 >하는것.
				String driver = "oracle.jdbc.driver.OracleDriver"; 
				String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";// 사용하려는 데이터베이스명을 포함한 URL 기술
				String id = "NEWLEC"; // 사용자 계정
			    String pw = "oradb"; // 사용자 계정의 패스워드
				String sql = "SELECT * FROM NOTICE WHERE HIT >10";				
				
			    Class.forName(driver); 		
				Connection con = DriverManager.getConnection(url, id, pw); 
				
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql);
				
				List<Notice> list = new ArrayList<Notice>();
			
				//위에서는 데이터베이스 연결 과정이 끝났다
				while (rs.next()) { // 테이블에서 가져온게 있으면, true여서 아래코드 수행.
					int id1 = rs.getInt("ID");
					String title = rs.getString("TITLE"); // TITLE 컬럼에 값을 가져와서
					String writer_id = rs.getString("WRITER_ID");
					String content = rs.getString("CONTENT");
					Date regdate = rs.getDate("REGDATE");
					int hit = rs.getInt("HIT");	
					// 생성자의 인수와 똑같이 담아준다.
					Notice notice = new Notice(id1,title,writer_id,content,regdate,hit);
					list.add(notice);	
				} 	
				rs.close();
				st.close();
				con.close();
		return list;
	}
}

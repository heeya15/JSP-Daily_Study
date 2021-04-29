package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Program {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// 오라클 서버에 접속할 정보 정의
		//앞에 (oracle.jdbc.driver)패키지.(OracleDriver)클래스 사용. -- < 데이터 베이스 연동하기위해 사용 >하는것.
		String driver = "oracle.jdbc.driver.OracleDriver"; 
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";// 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "NEWLEC"; // 사용자 계정
	    String pw = "oradb"; // 사용자 계정의 패스워드
		String sql = "SELECT * FROM NOTICE";				
		/* 25행 드라이버 로딩 P, 517
		 - JDBC 드라이버 로딩되면 [ 자동으로 객체가 생성 ]되고
		 - [ 데이터베이스와 연동하기 위해 ] [ DriverManager 클래스에 등록 ]된다.
		- JDBC 드라이버 로딩은 [ 프로그램 수행 시 한 번만 ] 필요합니다.
		*/
	    Class.forName(driver); 
		/* 29행 
		- DriverManager 객체로부터 [ 연결된 Connection 객체를 얻어온다. ]
		*/
		Connection con = DriverManager.getConnection(url, id, pw); 
		//out.println("데이터베이스 연결이 성공했습니다.<br>"); // 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		//위에서는 데이터베이스 연결 과정이 끝났다
		
		if(rs.next()) { // 테이블에서 가져온게 있으면, true여서 아래코드 수행.
			String title = rs.getString("TITLE"); // TITLE 컬럼에 값을 가져와서
			System.out.println(title);
		} // 한줄 씩 가져오는 것. 
		
		rs.close();
		st.close();
		con.close();
	}

}

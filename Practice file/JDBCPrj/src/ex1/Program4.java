package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Program4 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		int Id = 11;
		// 오라클 서버에 접속할 정보 정의
		//앞에 (oracle.jdbc.driver)패키지.(OracleDriver)클래스 사용. -- < 데이터 베이스 연동하기위해 사용 >하는것.
		String driver = "oracle.jdbc.driver.OracleDriver"; 
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";// 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "NEWLEC"; // 사용자 계정
	    String pw = "oradb"; // 사용자 계정의 패스워드
		String sql = "DELETE NOTICE WHERE ID = ?";		
		
		/* - JDBC 드라이버 로딩되면 [ 자동으로 객체가 생성 ]되고
		 - [ 데이터베이스와 연동하기 위해 ] [ DriverManager 클래스에 등록 ]된다.
		- JDBC 드라이버 로딩은 [ 프로그램 수행 시 한 번만 ] 필요합니다.
		*/
	    Class.forName(driver); 
		/* - DriverManager 객체로부터 [ 연결된 Connection 객체를 얻어온다. ]*/
		Connection con = DriverManager.getConnection(url, id, pw); 
		
		//Statement st = con.createStatement();
		PreparedStatement st =con.prepareStatement(sql);
		// 일반적인 인덱스 번호와 달리 1부터 인덱스가 시작된다.
		st.setInt(1, Id); // 인덱스 번호, 넣어줄 데이터
			
		int result = st.executeUpdate();
		System.out.println(result);
		
		st.close();
		con.close();
	}

}

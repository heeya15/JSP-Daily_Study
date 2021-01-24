package mvc.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection()throws SQLException, ClassNotFoundException  {		

			Connection conn = null;		
	
			// 오라클 서버에 접속할 정보 정의
			//앞에 (oracle.jdbc.driver)패키지.(OracleDriver)클래스 사용. -- < 데이터 베이스 연동하기위해 사용 >하는것.
			String driver = "oracle.jdbc.driver.OracleDriver"; 
			String url = "jdbc:oracle:thin:@localhost:1521:xe";// 사용하려는 데이터베이스명을 포함한 URL 기술
			String id = "jisung"; // 사용자 계정
			String pw = "db2019"; // 사용자 계정의 패스워드
				
			/* 25행 드라이버 로딩 P, 517
			 - JDBC 드라이버 로딩되면 [ 자동으로 객체가 생성 ]되고
			 - [ 데이터베이스와 연동하기 위해 ] [ DriverManager 클래스에 등록 ]된다.
			 - JDBC 드라이버 로딩은 [ 프로그램 수행 시 한 번만 ] 필요합니다.
			*/
			Class.forName(driver); 
			/* 29행 
			 - DriverManager 객체로부터 [ 연결된 Connection 객체를 얻어온다. ]
			*/
			conn = DriverManager.getConnection(url, id, pw); 
			//out.println("데이터베이스 연결이 성공했습니다.<br>"); // 커넥션이 제대로 연결되면 수행된다.
		
		return conn;
	}	
}

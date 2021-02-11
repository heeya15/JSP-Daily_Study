package mvc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//DAO 클래스 같은경우는 데이터 접근 객체의 약자로서
//실제로 데이터베이스에 접근해서 데이터를 빼오는 역할을 하는 클래스
import java.util.ArrayList;
public class BoardDAO {

		 Connection conn = null;	
		 ResultSet rs;
		public BoardDAO() {
			try {
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
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//현재의 시간을 가져오는 함수
		public String getDate() {
			String SQL = "select sysdate from dual";
			try {
				//sql 문장을 실행 준비단계로 해준다.
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return ""; //데이터베이스 오류
		}
		//
		public int getNext() {
			String SQL = "select num from board order by num desc";
			try {
				//sql 문장을 실행 준비단계로 해준다.
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; //첫 번째 게시물인 경우
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		public int getHitNext() {
			String SQL = "select hit from board order by hit desc";
			try {
				//sql 문장을 실행 준비단계로 해준다.
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; //첫 번째 게시물인 경우
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		//실제로 글을 작성하는 write 함수 작성.
		public int write( String id, String name,String subject, String content) {
			String SQL = "INSERT INTO board VALUES(?,?,?,?,?,?,?,?)";
			try {
				//sql 문장을 실행 준비단계로 해준다.
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, id);
				pstmt.setString(3, name);
				pstmt.setString(4, subject);
				pstmt.setString(5, content);
				pstmt.setString(6, getDate());
				pstmt.setInt(7, getHitNext());
				pstmt.setInt(8, 1); // 당연히 처음 글을 작성할때는 , 삭제가 안된거닌깐 1을 넣어줌.
				return pstmt.executeUpdate(); // 성공적으로 수행했을때 0이상을 반환.
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		/*
		 * 아래 2개의 함수로 게시판 메인 화면에서 실제로
		 * 목록을 출력하는 방법을 알아 보겠다.
		 * ----------------------------------
		 * getList() 이 함수를 실행했을때 특정한 페이지에 맞는 게시글 리스트가 리스트에 
		 * 담겨서 반환한다.
		 */
		 
		public ArrayList<BoardDTO> getList(int pageNumber){
			// 삭제가 되지 않을 글만 들고오거 , 게시판 번호를 내림차순으로 10개만 제한해서 가져온다.
			String SQL = "select * from \r\n"
					      + "(select * from board \r\n"
					      + "where num < ? and available = 1 \r\n"
					      + "order by num desc )\r\n"
					      + "WHERE ROWNUM <=10";
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			try {
				//sql 문장을 실행 준비단계로 해준다.
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				// getNext()함수는 그다음에 들고올 게시글 번호를 의미
				// 혀
				pstmt.setInt(1, getNext() - (pageNumber - 1) *10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					//결과로 나온 게시글 목록을 [ 리스트에 담아서 ] 반환하면 된다..
					BoardDTO bbs = new BoardDTO();
					bbs.setNum(rs.getInt(1));
					bbs.setId(rs.getString(2));
					bbs.setName(rs.getString(3));
					bbs.setSubject(rs.getString(4));
					bbs.setContent(rs.getString(5));
					bbs.setRegist_day(rs.getString(6));
					bbs.setHit(rs.getInt(7));
					bbs.setAvailable(rs.getInt(8));
					list.add(bbs);	
				}	
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list ; // 게시글 목록을 담은 것을 반환
		}
		/*
		 * 이 아래 함수가 왜 필요하냐면
		 * 게시글이 10개씩 끊긴다고 생각해보자
		 * 쉽게 말하면 [ 페이징 처리 ]를 위해 만든다.
		 * 게시글이 21개면, 페이지가 3으로 늘어나야 하기 때문에 
		 * 특정한 페이지가 존재하는지 물어보는 함수이다.
		 */
		public boolean nextPage(int pageNumber) {
			String SQL = "select * from \r\n"
				         + "(select * from board \r\n"
				         + "where num < ? and available = 1 \r\n"
				         + "order by num desc )\r\n"
				         + "WHERE ROWNUM <=10";
			try {
				//sql 문장을 실행 준비단계로 해준다.
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber - 1) *10);
				rs = pstmt.executeQuery();
				// 결과가 하나라도 존재한다면 다음페이지로 넘어갈수 있다는것을 알려준다.
				if (rs.next()) {
					return true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false; // 그렇지 않으면 false 반환.
		}
			
}

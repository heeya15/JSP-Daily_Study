package ex1;

import java.sql.SQLException;

import com.newlecture.app.console.NoticeConsole;

public class Program5 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// notice를 관리하는 콘솔 하나 생성
		NoticeConsole console = new NoticeConsole();
		//int page ; // 페이지를 저장하기위한 상태변수
		
		//제어구조 앞에 EXIT라는 라벨을 붙이면 [ 아래에서 라벨을 써서 break; ]하게되면은 while 문까지 한번에 벗어난다.
		EXIT:
			while(true) {  
			console.printNoticeList(); // 콘솔을 통해서 공지사항 목록을 출력해달라고 할 것이다.
			int menu = console.inputNoticeMenu(); // 콘솔을 통해 공지사항 메뉴 입력을 호출.
			
			switch(menu) {
			case 1: //상세조회
				break;
			case 2: //이전
				console.movePrevList();
				//page--;
				break;
			case 3: //다음
				console.moveNextList();
				//page++;
				break;
			case 4: //글쓰기
				break;
			case 5: //검색
				console.inputSearchWord();
				break;
			case 6: //종료
				System.out.println("bye~~~~~~");
				break EXIT;	 // 해당 라벨로 이동하여 while 문 까지 벗어난다.
			default:
				System.out.println("<<사용방법>> 메뉴는 1~4까지만 입력할 수 있습니다.");
				break;
			}
		}
	}

}

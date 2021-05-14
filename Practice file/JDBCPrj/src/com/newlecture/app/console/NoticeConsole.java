package com.newlecture.app.console;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import com.newlecture.app.entity.Notice;
import com.newlecture.app.service.NoticeService;

public class NoticeConsole {

	private NoticeService service; //데이터 서비스를 위한 NoticeService 객체 준비.
	private int page; //페이지를 저장하기 위한 [ 상태 변수 ]
	private int count; // 공지사항의 전체 개수를 의미.
	
	public NoticeConsole() { //생성자에서 그 서비스 객체를(요소) 생성해 달라고 해야한다.
		service = new NoticeService();
		page = 1; // 페이지의 기본값은 1로 설정
		count = 1;
	}
	public void printNoticeList() throws ClassNotFoundException, SQLException { // 콘솔창에 목록을 출력하는 부분 .
		List<Notice> list = service.getList(page);
		count = service.getCount();
		
		System.out.println("─────────────────────────────────");
		System.out.printf("<공지사항> 총 %d 게시글\n", count);
		System.out.println("─────────────────────────────────");
		
		for(Notice n : list) { //가져온 목록 수 만큼 반복된다.
		System.out.printf("%d. %s / %s / %s\n",
				n.getId1(), n.getTitle(), n.getWriter_id(), n.getRegdate());
		}
		System.out.println("─────────────────────────────────");
		System.out.printf("           %d/%d  pages \n", 1,2);
	}

	public int inputNoticeMenu() {
		Scanner scan = new Scanner(System.in); //콘솔을 위한 스캐너 준비
		System.out.printf("1.상세조회/ 2.이전 / 3.다음 / 4. 글쓰기 / 5. 종료 > ");
		String menu_ = scan.nextLine();// 정수형태로 입력받았는지 확인하기 위해 문자열로 임시저장. 
		int menu = Integer.parseInt(menu_); // 정수형태인 경우 정수형으로 형 변환.
		return menu;
	}
	public void movePrevList() { 
		if (page == 1){ // 1페이지 보다 작은 페이지를 갈수 없어서 조건문 추가.
			System.out.println("이전 페이지가 없습니다.");
			return;
		}
		page--;
	}
	public void moveNextList() { // 마지막 페이지를 구하는 로직을 구할때 까지는 아래 부분은 구현x
//		if (page == ?){ 
//			System.out.println("이전 페이지가 없습니다.");
//			return;
//		}
		page++;
		
	}
	

}

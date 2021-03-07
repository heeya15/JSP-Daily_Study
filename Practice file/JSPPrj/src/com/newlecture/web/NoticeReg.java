package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 아래 주석으로 [ 서블릿과 URL의 매핑정보 ]를 남길 수 있다. 그래서 web.xml 가서 불필요한 설정 필요없음.
@WebServlet("/notice-reg") // [ 클래스 ]나 [ 메서드 ]에 붙여지는 ‘ 주석 ’이다. --> 컴파일러에 의해 사라지지 않을수 있다
                           //옵션에 따라 사라질 수 있지만, 일반적으로는 컴파일하면 남아 있다. 
 
//아래 [객체]를 사용할때 그 객체에 뭍어있는 '주석정보'를 꺼내서 활용할 수 있다 --> [ 메타 데이터 ]라고 할 수 있다.
public class NoticeReg extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			               throws ServletException, IOException {
		//내가 클라이언트로 보내는 단위는 'UTF-8'이다 라고 지정해야함, 그래야 정상적인 byte로 데이터를 전달한다.
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		//request.setCharacterEncoding("UTF-8"); // 이것을 해야 사용자가 입력한 한글이 안깨지고 들고와서, 전달함.
		
		PrintWriter out = response.getWriter();
		// request 입력도구
		// request.getParameter("키워드"); 해당하는 키워드를 읽는 것.
		// request는 무조건 문자열로 전달된다, 따라서 정수형으로 형 변환 해야한다.
		
		String title = request.getParameter("title"); // 전달하는 키값을 들고옴.
		String content = request.getParameter("content"); // 전달하는 키값을 들고옴.
		
		out.println(title);
		out.println(content);
	}
}

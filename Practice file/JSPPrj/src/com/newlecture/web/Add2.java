package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 아래 주석으로 [ 서블릿과 URL의 매핑정보 ]를 남길 수 있다. 그래서 web.xml 가서 불필요한 설정 필요없음.
@WebServlet("/add2") // [ 클래스 ]나 [ 메서드 ]에 붙여지는 ‘ 주석 ’이다. --> 컴파일러에 의해 사라지지 않을수 있다
                    //옵션에 따라 사라질 수 있지만, 일반적으로는 컴파일하면 남아 있다. 
//아래 [객체]를 사용할때 그 객체에 뭍어있는 '주석정보'를 꺼내서 활용할 수 있다 --> [ 메타 데이터 ]라고 할 수 있다.
public class Add2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			               throws ServletException, IOException {
		//내가 클라이언트로 보내는 단위는 'UTF-8'이다 라고 지정해야함, 그래야 정상적인 byte로 데이터를 전달한다.
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		/* 
		    하나의 파라미터가 여러 값을( 동일한 이름이 여러 개 올 때) 가질 때
            request.getParameterValues() 메소드 사용.
		 */
		String num_ [] = request.getParameterValues("num"); // 전달하는 키값을 들고옴.
		
		int result = 0; // 결과를 담아낼 변수 초기화 선언.
		
		for (int i=0; i<num_.length;i++) { //i가 "num_" 이 가지고 있는 개수 만큼 반복.
			/*
			 * for문 안에 변수 선언했으니, 반복할 때마다 변수 선언하는것 아니냐?
			 * 그렇지 않다. [ for문 안에서 변수가 ] 반복할때 사용되는 연산이 아니다.
			 * 선언이기 때문에 [ 반복되기 전에 한 번만 ] 만들어진다.
			 * 그래서, 지역적 으로만 쓰기위해 선언한것이고, [ 지역변수가 됨 ]으로 훨씬더 바람직하다. 
			 */
			int num = Integer.parseInt(num_[i]);// 정수형으로 형 변환 
			result += num;
		}
		out.print("결과는 " + result);
	}
}

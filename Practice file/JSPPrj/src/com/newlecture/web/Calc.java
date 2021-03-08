package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 아래 주석으로 [ 서블릿과 URL의 매핑정보 ]를 남길 수 있다. 그래서 web.xml 가서 불필요한 설정 필요없음.
@WebServlet("/calc") // [ 클래스 ]나 [ 메서드 ]에 붙여지는 ‘ 주석 ’이다. --> 컴파일러에 의해 사라지지 않을수 있다
                    //옵션에 따라 사라질 수 있지만, 일반적으로는 컴파일하면 남아 있다. 
//아래 [객체]를 사용할때 그 객체에 뭍어있는 '주석정보'를 꺼내서 활용할 수 있다 --> [ 메타 데이터 ]라고 할 수 있다.
public class Calc extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			               throws ServletException, IOException {
		//내가 클라이언트로 보내는 단위는 'UTF-8'이다 라고 지정해야함, 그래야 정상적인 byte로 데이터를 전달한다.
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		/* request는 무조건 문자열로 전달된다, 따라서 정수형으로 형 변환 해야한다.
		   이때 [ 빈 문자열이 오거나 ] or 진짜 담긴 값이 오는 경우 발생
		   add.html을 보면 [ name 키 값 ]이 있어서 submit 버튼을 누르면 null이 오는 경우 x */
		String X_ = request.getParameter("x"); // 전달하는 키값을 들고옴.
		String Y_ = request.getParameter("y"); // 전달하는 키값을 들고옴.
		String op = request.getParameter("operator");
		
		int X =0;//빈 문자열이 올 경우 x= 0으로 왔다고 가정 하겠다. 
		int Y =0; 
		// X, Y [ 사용자 입력 값이 ] 빈 문자열이 아닌 경우 정수형으로 형 변환해 준다.
		if (!X_.equals("")) X = Integer.parseInt(X_);
	
		if (!Y_.equals("")) Y = Integer.parseInt(Y_);
		
		int result =0;
		//operator가 가지고 있는 value(값이) 덧셈, 뺄셈에 따라 값을 돌려준다.
		if(op.equals("덧셈"))
			result = X + Y;
		else
			result = X - Y;
		out.println(result);		
	}
}

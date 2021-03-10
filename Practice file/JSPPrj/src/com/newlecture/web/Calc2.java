package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


// 아래 주석으로 [ 서블릿과 URL의 매핑정보 ]를 남길 수 있다. 그래서 web.xml 가서 불필요한 설정 필요없음.
@WebServlet("/calc2") // [ 클래스 ]나 [ 메서드 ]에 붙여지는 ‘ 주석 ’이다. --> 컴파일러에 의해 사라지지 않을수 있다
                    //옵션에 따라 사라질 수 있지만, 일반적으로는 컴파일하면 남아 있다. 
//아래 [객체]를 사용할때 그 객체에 뭍어있는 '주석정보'를 꺼내서 활용할 수 있다 --> [ 메타 데이터 ]라고 할 수 있다.
public class Calc2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			               throws ServletException, IOException {
		//내가 [ 클라이언트로 보내는 단위 ]는 'UTF-8'이다 라고 지정해야함, 그래야 정상적인 byte로 데이터를 전달한다.
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		/* add.html을 보면 [ name 키 값 ]이 있어서 submit 버튼을 누르면 null이 오는 경우 x */
		String v_ = request.getParameter("v"); // 전달하는 키값을 들고옴.
		String op = request.getParameter("operator");
		
		int v =0; //빈 문자열이 올 경우(값이 오지않을경우) x= 0으로 왔다고 가정 하겠다. 
		
		// v[ 사용자 입력 값이 ] 빈 문자열이 아닌 경우 정수형으로 형 변환해 준다.
		if (!v_.equals("")) v = Integer.parseInt(v_);
		
		/* 값을 저장해야하는데, 그것을 어디다 저장하냐면, 
	       request를 보면 getServletContext() 가 있는데, 이 [ 서블릿 컨텍스트 ]가 어플리케이션(서블릿) 저장소다.
		   이 녀석을 [ ServletContext 변수 하나 만들어 ]서 application 이름으로 저장하겠다. 라는 뜻.
		 */ 
		ServletContext application =request.getServletContext();
		HttpSession session = request.getSession();
		// 계산
		if (op.equals("=")) { //이퀄(=) 버튼을 눌렀을 경우. -- 계산을 수행.
			// 어플리케이션 저장소에서 "값을" 들고온다. --> 담을때 사용했던 (키워드를) 그대로 사용
			//int x = (Integer)application.getAttribute("value"); //맨 처음에 요청이 들어와서 저장했던 값.
			int x = (Integer)session.getAttribute("value");
			int y = v; // [ 지금 사용자가 전달한 값 ]을 의미.
			
			// op로 이름을 지으면 빨간줄이 생긴다. 밖에 지역변수 op와 안에서 사용되는 op라는 변수명이 충돌이 되기 때문.
			// 그래서 여기서 지역변수는 operator로 (풀 네임으로) 해 준다. 
			//String operator = (String)application.getAttribute("operator");
			String operator = (String)session.getAttribute("operator");
			int result = 0;
			
			//operator가 가지고 있는 value(값이) 덧셈, 뺄셈에 따라 값을 돌려준다.
			if(operator.equals("+"))
				result = x + y;
			else
				result = x - y;
			out.println(result);
		}
		//"+", "-"버튼을 누를경우 [ 값을 저장. ]	
		else {	
			//application.setAttribute("value", v);
			//application.setAttribute("operator", op); // 29~30번 줄의 값을 저장한 것이다.
			session.setAttribute("value", v);
			session.setAttribute("operator", op); 
		}
				
	}
}

package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


// 아래 주석으로 [ 서블릿과 URL의 매핑정보 ]를 남길 수 있다. 그래서 web.xml 가서 불필요한 설정 필요없음.
@WebServlet("/calc3") // [ 클래스 ]나 [ 메서드 ]에 붙여지는 ‘ 주석 ’이다. --> 컴파일러에 의해 사라지지 않을수 있다
                    //옵션에 따라 사라질 수 있지만, 일반적으로는 컴파일하면 남아 있다. 
//아래 [객체]를 사용할때 그 객체에 뭍어있는 '주석정보'를 꺼내서 활용할 수 있다 --> [ 메타 데이터 ]라고 할 수 있다.
public class Calc3 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			               throws ServletException, IOException {
		
		/* 값을 저장해야하는데, 그것을 어디다 저장하냐면, 
	       request를 보면 getServletContext() 가 있는데, 이 [ 서블릿 컨텍스트 ]가 어플리케이션(서블릿) 저장소다.
		   이 녀석을 [ ServletContext 변수 하나 만들어 ]서 application 이름으로 저장하겠다. 라는 뜻.
		 */ 
		ServletContext application =request.getServletContext();
		HttpSession session = request.getSession();
		
		// 사용자가 [ 쿠키를 보냈으닌깐 ] 다음에 요청이 들어오면, [ 쿠키를 읽어들일 것 ]이다.
		// 쿠키가 하나가 아닌 [ 여러 개가 심어질 수 있기 때문 ]에 배열로 저장
		Cookie[] cookies = request.getCookies();  // 쿠키 읽기
		
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
		
		// 계산
		if (op.equals("=")) { //이퀄(=) 버튼을 눌렀을 경우. -- 계산을 수행.
			int x = 0;
			// [ 읽어들인 쿠키 만큼 ] 반복된다.
		    for(int i =0 ; i < cookies.length; i++) { // 찾는 작업이 여러번 이닌깐 for문을 돌려야함
		    	if(cookies[i].getName().equals("value")) { //쿠키 이름중 [ 내가 설정한 쿠키 이름과 같으면 ]
					x = Integer.parseInt(cookies[i].getValue()); // 키에 해당하는 값을 저장.(정수형으로 형 변환해서)
					break; //찾았스면 더이상 검색하지 말라! 그래서 for문을 나와준다. 
		    	}
		    }
		    int y = v; // [ 지금 사용자가 전달한 값 ]을 의미.
		    
		    String operator = ""; // operator 키 값을 저장받기 위한 변수.
		    for(Cookie c : cookies) { // 찾는 작업이 여러번 이닌깐 for문을 돌려야함
		    	if(c.getName().equals("operator")) { //쿠키 이름중 내가 설정한 쿠키 이름과 같으면
					operator = c.getValue(); 
					break; //찾았스면 더이상 검색하지 말라! 그래서 for문을 나와준다. 
		    	}
		    }
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
			
			//쿠키 값으로 보낼수 있는 것은 반드시 URL에 사용할수 있는 형태의 [ 문자열 형 ]으로 보내야한다.
			Cookie valuecookie = new Cookie("value",String.valueOf(v)); // 따라서 문자열 형태로 형변환.
			Cookie operatorcookie = new Cookie("operator", op);
			//쿠키가 [ 어느 경우에 사용자로부터 전달되어야 하는지 ]의 경로이다.
			valuecookie.setPath("/calc3"); //루트(/)로 지정할 경우 모든 페이지를 요청할 때마다 [ valuecookie를 가져오라는 것이다. ] 
			valuecookie.setMaxAge(24*60*60);
			
			operatorcookie.setPath("/calc3"); //어떠한 서비스를 요청하든 (value값과 operator)는 무조건 전달된다. 
			//클라이언트에게 보내기 위해서 addCookie() 메소드 사용. response 헤더에 심어지는 그러한 형태로 전달.
			response.addCookie(valuecookie);
			response.addCookie(operatorcookie);
			
			response.sendRedirect("calc3.html");// redirect 사용 [ 경로 우회 ]
		}
				
	}
}

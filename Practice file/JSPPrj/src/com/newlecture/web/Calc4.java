package com.newlecture.web;

import java.io.IOException;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 아래 주석으로 [ 서블릿과 URL의 매핑정보 ]를 남길 수 있다. 그래서 web.xml 가서 불필요한 설정 필요없음.
@WebServlet("/calc4") // [ 클래스 ]나 [ 메서드 ]에 붙여지는 ‘ 주석 ’이다. --> 컴파일러에 의해 사라지지 않을수 있다
                    //옵션에 따라 사라질 수 있지만, 일반적으로는 컴파일하면 남아 있다. 
//아래 [객체]를 사용할때 그 객체에 뭍어있는 '주석정보'를 꺼내서 활용할 수 있다 --> [ 메타 데이터 ]라고 할 수 있다.
public class Calc4 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			               throws ServletException, IOException {
		// 사용자가 [ 쿠키를 보냈으닌깐 ] 다음에 요청이 들어오면, [ 쿠키를 읽어들일 것 ]이다.
		// 쿠키가 하나가 아닌 [ 여러 개가 심어질 수 있기 때문 ]에 배열로 저장
		Cookie[] cookies = request.getCookies();  // 쿠키 읽기
		
		String value = request.getParameter("value"); // 전달하는 키값을 들고옴.
		String operator = request.getParameter("operator");
		String dot = request.getParameter("dot");
		
		// [ 위에 부분 코드는 ] 사용자 입력이 들어오는 부분. 아래는 기존의 exp 코드.
		String exp = "";
		
		if (cookies != null) { //읽어온 쿠키가 [ null이 아니면 ]
			 // 쿠키에 저장되는게 연산식이기 때문에 [ 연산식 자체를 그대로 들고와주고 ] 출력하도록 함.
		    for(Cookie c : cookies) { // 찾는 작업이 여러번 이닌깐 for문을 돌려야함
		    	if(c.getName().equals("exp")) { //쿠키 이름중 내가 설정한 쿠키 이름과 같으면
		    		exp = c.getValue(); // ** [ 쿠키에서 읽은 값으로 ] ** 바뀐다.
					break; //찾았스면 더이상 검색하지 말라! 그래서 for문을 나와준다. 
		    	}
		    }
		}
		// null이 아니고, [ "="이퀄 인경우 ] [ 계산을 ] 수행한다.
		if(operator != null && operator.equals("=")) {
			ScriptEngine engine = new ScriptEngineManager().getEngineByName("nashorn");
			try {
				exp = String.valueOf(engine.eval(exp));
			} catch (ScriptException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {// 그렇지 않은 경우만 한다. 
			//만약에 숫자 버튼을 누르면 value 빼고 operator, dot은 null이다.
			// [ value가 null이면 ] < 빈 문자열 >, value가 null이 [ 아니면 ] [ 값을 exp에 누적. ]
			// 3가지 조건중 [ 하나만 exp에 누적되는 형태 ]이다.
			exp += (value == null)?"":value;
			exp += (operator == null)?"":operator;
			exp += (dot == null)?"":dot;
		}
		
		
		Cookie expCookie = new Cookie("exp",exp);
		response.addCookie(expCookie);
		response.sendRedirect("/calcpage");
	}
}

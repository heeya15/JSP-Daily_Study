package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 아래 주석으로 [ 서블릿과 URL의 매핑정보 ]를 남길 수 있다. 그래서 web.xml 가서 불필요한 설정 필요없음.
@WebServlet("/calcpage") // [ 클래스 ]나 [ 메서드 ]에 붙여지는 ‘ 주석 ’이다. --> 컴파일러에 의해 사라지지 않을수 있다
                     
public class CalcPage extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			               throws ServletException, IOException {
		// 사용자가 [ 쿠키를 보냈으닌깐 ] 다음에 요청이 들어오면, [ 쿠키를 읽어들일 것 ]이다.
		// 쿠키가 하나가 아닌 [ 여러 개가 심어질 수 있기 때문 ]에 배열로 저장
		// 만약 브라우저에서 쿠키가 하나도 없을 경우에 null을 반환 받기 때문에, < null이 아닐경우로 조건처리! >
		Cookie[] cookies = request.getCookies();  // 쿠키 읽기
		
		String exp = "0"; //
		if (cookies != null) { //쿠키가 [ null이 아니면 ]
			 // 쿠키에 저장되는게 연산식이기 때문에 [ 연산식 자체를 그대로 들고와주고 ] 출력하도록 함.
		    for(Cookie c : cookies) { // 찾는 작업이 여러번 이닌깐 for문을 돌려야함
		    	if(c.getName().equals("exp")) { //쿠키 이름중 내가 설정한 쿠키 이름과 같으면
		    		exp = c.getValue(); // ** [ 쿠키에서 읽은 값으로 ] ** 바뀐다.
					break; //찾았스면 더이상 검색하지 말라! 그래서 for문을 나와준다. 
		    	}
		    }
		}
		//내가 [ 클라이언트로 보내는 단위 ]는 'UTF-8'이다 라고 지정해야함, 그래야 정상적인 byte로 데이터를 전달한다.
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out =response.getWriter(); //이 out을 가지고 아래에 있는 html을 출력할 것이다.
		out.write("<!DOCTYPE html>");
		out.write("<html>");
		out.write("<head>");
		out.write("<meta charset=\"UTF-8\">");
		out.write("<title>Insert title here</title>");
		out.write("<style>");
		out.write("input {");
		out.write("width: 50px;");
		out.write("height: 50px;");
		out.write("}");

		out.write(".output {");
		out.write("	height: 50px;");
		out.write("	background: #e9e9e9;");
		out.write("	font-size: 24px;");
		out.write("	font-weight: bold;");
		out.write("	text-align: right;");
		out.write("	padding: 0px, 5px;");
		out.write("}");
		out.write("</style>");
		out.write("</head>");
		out.write("<body>");
			// 중요한 것은 사용자가 입력을 해서 전달할때 method를 post로 했다라는 것, 
		out.write("		<form action=\"calc4\" method=\"post\">");
		out.write("			<table>");
			// 맨 위에 값을 띄우는 행의 열은 하나만 있으면 된다. 
			//colspan=4 로 한 이유는 다른아이들은 '4열'로 구성되있으니, 똑같이 4열을 쓰겠다 라는 뜻.-->
		out.write("				<tr> ");
		out.printf("					<td class=\"output\" colspan=\"4\">%s</td>",exp);
		out.write("				</tr>");
					
		out.write("				<tr>"); //<!-- '한개의 행'에 4개의 열이 있다. -->
		out.write("					<td><input type=\"submit\" name=\"operator\" value=\"CE\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"operator\" value=\"C\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"operator\" value=\"BS\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"operator\" value=\"/\" /></td>");
		out.write("				</tr>");
		out.write("				<tr>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"7\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"8\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"9\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"operator\" value=\"*\" /></td>");
		out.write("				</tr>");
		out.write("				<tr>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"4\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"5\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"6\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"operator\" value=\"-\" /></td>");
		out.write("				</tr>");
		out.write("				<tr>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"1\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"2\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"3\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"operator\" value=\"+\" /></td>");
		out.write("				</tr>");
		out.write("				<tr>");
		out.write("					<td></td>");
		out.write("					<td><input type=\"submit\" name=\"value\" value=\"0\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"dot\" value=\".\" /></td>");
		out.write("					<td><input type=\"submit\" name=\"operator\" value=\"=\" /></td>");
		out.write("				</tr>");
		out.write("		</table>");
		out.write("	</form>");
		out.write("</body>");
		out.write("</html>");	
	}
}

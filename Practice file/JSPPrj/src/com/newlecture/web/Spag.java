package com.newlecture.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/spag")
public class Spag extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			             throws ServletException, IOException {	
	    //Controller (자바 코드 부분.)
		int num = 0; //[ 사용자가 전달할 수 없을때  ]사용하는 값을 '0'으로 초기화
		String num_ = request.getParameter("n");
		if(num_ != null && !num_.equals(""))
			num = Integer.parseInt(num_); //사용자가 전달받았으면 정수형으로 형 변환.
		
		String result; // model을 만들어 준비해 놨다.
		
		if (num %2 !=0 )
			result = "홀수";
		else
			result = "짝수";
		
		request.setAttribute("result", result); //모델데이터를 심어놨다.
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("spag.jsp"); // spag.jsp는 서블릿이다.
		/* dispatcher를 통해 forward 가능.
		   현재 작업 내용을 request, response에 담고있다면 
		   그 내용이 spag.jsp로 이어져서 요청이 진행된다.
		*/
		dispatcher.forward(request, response);
	}
}

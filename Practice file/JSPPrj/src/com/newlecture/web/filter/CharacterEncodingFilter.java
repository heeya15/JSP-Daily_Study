package com.newlecture.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {


	@Override
	public void doFilter(ServletRequest request, 
			             ServletResponse response,
			             FilterChain chain)
			throws IOException, ServletException {
		// 요청이 올때마다도 실행되지만, 톰캣이 처음실행될때도 한번 실행된다. -- 그래서 처음 요청하는 순간 2번의
		// hello filter가 나온다. --> 그다음은 요청될때마다 1번의 hello filter가 나온다.
		
		System.out.println("before filter"); // 필터 전 
		chain.doFilter(request, response); // 요청이 오면 흐름을 넘겨서, 다음 필터 또는 서블릿을 실행되게 한다.
		                                   // [ 그 후에 결과가 돌아오면 ] 아래 출력문이 실행된다.
		System.out.println("after filter"); // 필터 후
		

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}

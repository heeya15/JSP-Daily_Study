package com.newlecture.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/*
 우리가 web.xml에다가 필터를 설정할때는 필터와, 필터 매핑을 연결시키기위해
 필터이름, 필터 클래스 등을 해줘야하는데 [ 어노테이션을 이용하여 설정 ] 하는 것은
 설정 방법이 굉장히 간단하고, 불필요한 작업을 줄일 수 있다.
 */
@WebFilter("/*")  // 필터 매핑되는 주소만 쓴다. (모든 URL에 대해서 무조건 동작하게 하겠다.)
public class CharacterEncodingFilter implements Filter {


	@Override
	public void doFilter(ServletRequest request, 
			             ServletResponse response,
			             FilterChain chain)
			throws IOException, ServletException {
		// 요청이 올때마다도 실행되지만, 톰캣이 처음실행될때도 한번 실행된다. -- 그래서 처음 요청하는 순간 2번의
		// hello filter가 나온다. --> 그다음은 요청될때마다 1번의 hello filter가 나온다.
		
		request.setCharacterEncoding("UTF-8"); // 필터 전 (서블릿이 실행되기 전에 )- 인코딩 필터가 적용된다.
		chain.doFilter(request, response); // 요청이 오면 흐름을 넘겨서, 다음 필터 또는 서블릿을 실행되게 한다.
		                                   // [ 그 후에 결과가 돌아오면 ] 아래 출력문이 실행된다.
		
		

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

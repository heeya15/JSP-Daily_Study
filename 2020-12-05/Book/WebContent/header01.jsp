<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%! int count=0;
	    
		void addCount(){
	       count++;
	    }
	 %>
	
	<%addCount(); %>
	<p>이 사이트 방문은 <%=count %> 번째 입니다.</p>

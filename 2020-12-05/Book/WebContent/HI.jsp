<html>
<head>
     <title> Scripting Tag</title>
</head>
<body>
     <!-- HTML 태그 -->
    <h1> Scripting tag</h1>
     Nice meet you too<br>
     <%! int count =3;  // 스크립트 태그 종류중 [ 선언문 태그 부분. ]
      String makeItLower(String data){ //문자열을 입력받아 소문자로 출력하는 메소드 
    	  return data.toLowerCase();
      }
     %>
     <% //처리부 부분. (자바 로직 코드 작성하는 부분)
    
     for (int i=0; i<count;i++){
    	 out.println("Java Server Pages " + i+ ".<br>");
     }
     %>
     <%--주석태그 --%>
     <p>Today<%= //현재 날짜를 출력하도록 표현문 태그
                 new java.util.Date() %></p>
     <%= // 메소드 호출결과를 통해 소문자로 변경되어 문자열 형태로 출력한다.
     makeItLower("Hello World") %> 
</body>
</html>
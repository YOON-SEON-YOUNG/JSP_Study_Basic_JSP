<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attributerTest1.jsp</title>
</head>
<body>
<!--  값 저장 -->
<h1>attributerTest1.jsp</h1>
<%
// 	request.setCharacterEncoding("utf-8"); // post 요청인 경우 한글처리

// application은 서버당 1개 존재

	//지역변수 지정
	String name = request.getParameter("name");
	String id = request.getParameter("id");
// 	out.println("name: " + name);
// 	out.println("id: " + id);
	if ((name != null && !name.equals("")) && (id != null && !id.equals("")))	{
		// application 영역에 데이터 저장
		application.setAttribute("name", name); // attribute에 속성을 설정한다.
		application.setAttribute("id", id); 
	}
%>
<h2>application 영역에 저장 완료</h2>

<%
// session은 접속마다 1개. 사용자마다 다름.

	String email =request.getParameter("email");
	String addr =request.getParameter("addr");
	String tel =request.getParameter("tel");
	
	if (email != null && !email.equals("")
			&& addr != null && !addr.equals("")
			&& tel != null && !tel.equals(""))	{
		// session 영역에 데이터 저장
		session.setAttribute("email", email); // attribute에 속성을 설정한다.
		session.setAttribute("addr", addr);
		session.setAttribute("tel", tel);
	}
%>
</body>
</html>
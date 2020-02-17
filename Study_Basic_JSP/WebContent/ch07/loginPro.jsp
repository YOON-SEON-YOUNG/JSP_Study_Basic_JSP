<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro.jsp</title>
</head>
<body>
<h1>loginPro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");

	// chimchim , 1234 / 지민, 5678
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if ((id.equals("chimchim") && pw.equals("1234"))
			|| (id.equals("지민") && pw.equals("5678")) )	{
		session.setAttribute("id", id);
%>
		<script>
			alert("로그인 성공");
			location.href = "main.jsp";			// response.sendRedirect("main.jsp")	
		</script>
<%
		//로그인 성공
	} else {
%>
		<script>
			alert("로그인 실패");
			location.href = "loginForm.jsp";	// response.sendRedirect("loginForm.jsp")	
		</script>
<%
		//로그인 실패
	} // if
%>
</body>
</html>
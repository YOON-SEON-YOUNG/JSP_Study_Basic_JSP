<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
<h1>main.jsp</h1>
<%
	String objid = (String)session.getAttribute("id");	// id로 되어있는 값을 가져와서
%>
<div>
<%
	if (objid != null)	{
%>	
		<%=objid %>님 반갑습니다.
		<a href="logout.jsp">로그아웃</a>
<%
	} else {
%>
	<a href="loginForm.jsp">로그인</a></div>
<%
	} //if
%>
<div>메인페이지</div>
</body>
</html>
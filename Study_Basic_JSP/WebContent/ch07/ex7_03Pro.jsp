<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex7_03Pro.jsp</title>
</head>
<body>
<h1>ex7_03Pro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	
	String hak = request.getParameter("hak");
	String name = request.getParameter("name");
	String major = request.getParameter("major");
%>

	학번:<%=hak %> <br>
	이름:<%=name %><br>
	전공:<%=major %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseRedirect.jsp</title>
</head>
<body>
<h1>responseRedirect.jsp</h1>
<%
	// 브라우저에 강제 재요청 시킴
	response.sendRedirect("responseRedirected.jsp");

%>

</body>
</html>
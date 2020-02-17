<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>runError.jsp</title>
</head>
<body>
<h1>runError.jsp</h1>
<%
	String str = null;
	str.substring(0, 10);	// NullpointerException 발생
%>
</body>
</html>
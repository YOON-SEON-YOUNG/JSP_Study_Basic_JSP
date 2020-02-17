<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageDirectiveImport.jsp</title>
</head>
<body>
<h2>page 디렉티브 연습 - import 속성</h2>
<%
	Timestamp now = new Timestamp(System.currentTimeMillis());
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String nowStr = format.format(now);
%>
오늘은 <%=nowStr %> 입니다.
</body>
</html>
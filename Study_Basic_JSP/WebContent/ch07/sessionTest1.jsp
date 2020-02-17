<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTest1.jsp</title>
</head>
<body>
<h1>sessionTest1.jsp</h1>
<table border="1">
	<tr>
		<td>isNew</td>
		<td><%=session.isNew() %>
	</tr>
	<tr>
		<td>최종 접속시간</td>
		<td><%=session.getLastAccessedTime() %>
	</tr>
	<tr>
		<td>세션ID</td>
		<td><%=session.getId() %>
	</tr>
</table>
</body>
</html>
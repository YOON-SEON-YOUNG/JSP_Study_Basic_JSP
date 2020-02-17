<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>applicationTest.jsp</title>
</head>
<body>
<h1>applicationTest.jsp</h1>
<table border="1">
	<tr>
		<td>WAS 이름과 버전</td>
		<td><%=application.getServerInfo() %></td>
	</tr>
	<tr>
		<td>현재 프로젝트의 경로</td>
		<td><%=application.getRealPath("/") %></td>
	</tr>

</table>
</body>
</html>
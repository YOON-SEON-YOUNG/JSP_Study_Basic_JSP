<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
</head>
<body>
<h1>loginForm.jsp</h1>
<form action="loginPro.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;"><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</body>
</html>
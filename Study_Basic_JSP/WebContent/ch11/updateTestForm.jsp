<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateTestForm.jsp</title>
</head>
<body>
<!-- 폼 -->
<h1>updateTestForm.jsp</h1>
<form action="updateTestPro.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디: </td>
			<td><input type="text" name="id" maxlength="20"></td>
		</tr>
		<tr>
			<td>패스워드: </td>
			<td><input type="password" name="passwd" maxlength="20"></td>
		</tr>
		<tr>
			<td>이름: </td>
			<td><input type="text" name="name" maxlength="6"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;"><input type="submit" value="완료"></td>
		</tr>
	</table>
</form>

</body>
</html>
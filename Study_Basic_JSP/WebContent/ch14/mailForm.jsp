<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailForm.jsp</title>
</head>
<body>
<h1>메일 보내기</h1>
<hr>
<form action="mailSend.jsp" method="post">
	<table border="1">
		<tr>
			<th>보내는 사람 메일</th>
			<td><input type="email" name="sender"></td>
		</tr>
		<tr>
			<th>받는 사람 메일</th>
			<td><input type="email" name="receiver"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="보내기"></td>
		</tr>
	</table>
</form>
</body>
</html>
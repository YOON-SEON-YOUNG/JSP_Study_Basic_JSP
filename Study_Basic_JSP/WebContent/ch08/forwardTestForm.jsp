<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTestForm.jsp</title>
</head>
<body>
<!-- 페이지 입력처리 -->
<h1>forwardTestForm.jsp</h1>
<form action="forwardTest.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<select name="hobby">
					<option value="WOW">WOW</option>
					<option value="만화보기">만화보기</option>
					<option value="스타2-군단의 심장">스타2-군단의 심장</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="완료"/></td>
		</tr>
	</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex6_03Form.jsp</title>
</head>
<body>
<h1>ex6_03Form2.jsp</h1>
	<h2>아이디와 패스워드를 입력하세요.</h2>
	<form method="post" action="ex6_03Pro.jsp">
		아이디:		<input type="text" name="id"> <br>
		패스워드:	<input type="password" name="passwd"> <br>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>
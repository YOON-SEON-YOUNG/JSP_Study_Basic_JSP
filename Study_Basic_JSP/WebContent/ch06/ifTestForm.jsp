<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTestForm.jsp</title>
</head>
<body>
	<h1>ifTestForm.jsp</h1>
	<form method="get" action="ifTestPro.jsp"> <%-- method="get" 생략하면 기본값이 get --%>
		<input type="text" name="number">
		<input type="submit" value="입력완료">
	</form>
</body>
</html>
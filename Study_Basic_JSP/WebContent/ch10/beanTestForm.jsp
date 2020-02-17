<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTestForm.jsp</title>
</head>
<body>
<!-- 이름 -->
<h1>beanTestForm.jsp</h1>
<h2>이름을 입력하세요.</h2>
<form action="beanTestPro.jsp" method="get">
	<table border="1">
		<tr>
			<td>이름:</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;"><input type="submit" value="완료"></td>
		</tr>
	</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTestForm.jsp</title>
</head>
<body>
<!-- 폼 -->
<h1>includeTestForm.jsp</h1>
<h2>include 액션태그</h2>
<form action="includeTest.jsp" method="post">
	<table border="1">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="민윤기"></td>
		</tr>	
		<tr>
			<td>페이지 이름</td>
			<td><input type="text" name="pageName" value="includedTest"></td>
		</tr>	
		<tr>
			<td colspan="2" style="text-align:center;"><input type="submit" value="완료"></td>
		</tr>	
	</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifMultiTestForm.jsp</title>
</head>
<body>
<h1>ifMultiTestForm.jsp</h1>
	<form method="post" action="ifMultiTestPro.jsp">
	이름:		<input type="text" name="name"><br>
	전화번호:	<select name="local">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
				</select> - <input type="text" name="tel"><br>
	<input type="submit" value="입력완료">
	</form>
</body>
</html>
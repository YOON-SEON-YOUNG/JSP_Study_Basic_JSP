<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test2.jsp</title>
</head>
<body>
	세션에 저장된 정보 :  ${sessionScope.id}<br>
	영역 생략 : ${id}
	<hr>
	<form action="el_test3.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
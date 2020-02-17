<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attributerTest1Form.jsp</title>
</head>
<body>
<h1>attributerTest1Form.jsp</h1>
<!--  값 입력 -->
<!-- 이름, 아이디 -->
<h2>application 영역에 저장할 데이터</h2>
<form action="attributerTest1.jsp" method="get">
	<table border="1">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		
		<tr>
			<td colspan="2" style="text-align:center;"><input type="submit" value="완료"></td>
		</tr>
	</table>
</form>

<hr>

<h2>session 영역에 저장할 데이터</h2>
<form action="attributerTest1.jsp" method="get">
	<table border="1">
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="tel"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;"><input type="submit" value="확인"></td>
		</tr>
	</table>
</form>

</body>
</html>
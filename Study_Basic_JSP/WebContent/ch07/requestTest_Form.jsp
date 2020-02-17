<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestTest_Form.jsp</title>
</head>
<body>
<h1>requestTest_Form.jsp</h1>
<h2>학번, 이름, 학년, 선택과목을 입력하는 폼</h2>
	<form method="get" action="requestTest_Pro.jsp">
		학번: <input type="text" name="num"><br>
		이름: <input type="text" name="name"><br>
		학년: <input type="radio" name="grade" value="1" checked>1학년&nbsp;
			  <input type="radio" name="grade" value="2">2학년&nbsp;
			  <input type="radio" name="grade" value="3">3학년&nbsp;
			  <input type="radio" name="grade" value="4">4학년&nbsp;<br>
		선택과목:
		<select name="subject">
			<option value="JAVA">JAVA</option>
			<option value="JSP" selected>JSP</option>
			<option value="XML">XML</option>
		</select><br>
		취미: <input type="checkbox" name="hobby" value="game">게임
			  <input type="checkbox" name="hobby" value="drink">술
			  <input type="checkbox" name="hobby" value="programing">프로그래밍<br>
		
		<input type="submit" value="입력완료">
		</form>
</body>
</html>
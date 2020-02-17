<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTestPro.jsp</title>
</head>
<body>
	<h1>ifTestPro.jsp</h1>
	<%
		String number = request.getParameter("number");
		int iNumber = Integer.parseInt(number);
	%>
	<h2>요청받은 값: <%= number %></h2>
	<%
		if (iNumber % 2 == 0) {
			out.println("짝수입니다.");
		} else {
			out.println("홀수입니다.");
		}
	%>
</body>
</html>
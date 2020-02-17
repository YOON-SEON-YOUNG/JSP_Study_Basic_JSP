<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex6_04Pro.jsp</title>
</head>
<body>
<h1>ex6_04Pro.jsp</h1>
	<%--getParameter는 String으로 받아야함--%>
<%
	String strNum = request.getParameter("num"); 
	int iNum = Integer.parseInt(strNum);

%>
	<h2>입력한 숫자만큼 반복수행</h2>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>글내용</th>
		</tr>
		<% 
		for (int i = iNum; i > 0; i--)	{
		%>
		
		<tr>
			<td><%=i %></td>
			<td>제목<%=i %></td>
			<td>내용<%=i %></td>
		</tr>
		
		<%
		} // for
		%>
	</table>

</body>
</html>
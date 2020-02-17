<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template.jsp</title>
</head>
<body>
<h1>template.jsp</h1>
<%
// 	content1,2,3 페이지 받기
	String content = request.getParameter("content");
	if (content == null || content.equals(""))	{
		content = "content1.jsp";
	} else	{
		content = content + ".jsp";
	}
%>
<table border="1" style="width:900px; height:500px;">
	<tr>
		<td colspan="2"><jsp:include page="top.jsp"/></td>
	</tr>
	<tr>
		<td><jsp:include page="left.jsp"/></td>
		<td><jsp:include page="<%=content %>"/></td> <!-- 여기에 content 페이지 -->
	</tr>
	<tr>
		<td colspan="2"><jsp:include page="bottom.jsp"/></td>
	</tr>
</table>
</body>
</html>
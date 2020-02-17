<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestTest_Pro.jsp</title>
</head>
<body>
<h1>requestTest_Pro.jsp</h1>

<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String subject = request.getParameter("subject");
// 	String hobby = request.getParameter("hobby");	// 1개만 처리
	String[] strHobby = request.getParameterValues("hobby");
%>

<h2>학생 정보</h2>
<table border="1">
	<tr>
		<td>학번</td>
		<td><%=num %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>학년</td>
		<td><%=grade %>학년</td>
	</tr>
	<tr>
		<td>선택과목</td>
		<td><%=subject %></td>
	</tr>
	<tr>
		<td>취미</td>
		<td><%
				for (int i = 0; i < strHobby.length; i++){
					out.print(strHobby[i]);
					if (i < strHobby.length - 1){
						out.print(",");
					}
				}
		%></td>
	</tr>
</table>

</body>
</html>
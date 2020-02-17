<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardToTest.jsp</title>
</head>
<body>
<!-- 페이지 응답, 출력 처리 -->
<h1>forwardToTest.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String hobby = request.getParameter("hobby");
%>
아이디: <%=id %><br>
취미: 	<%=hobby %><br>
</body>
</html>

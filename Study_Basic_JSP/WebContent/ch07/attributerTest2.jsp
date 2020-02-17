<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attributerTest2.jsp</title>
</head>
<body>
<!--  브라우저를 껐다가 켜서 요청 -->
<!--  옆 자리 ip로 요청 -->
<h1>attributerTest2.jsps</h1>
<h2>application 영역에 저장된 정보</h2>
<%
	String name = (String)application.getAttribute("name");
	String id = (String)application.getAttribute("id");
%>
<table border="1">
	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=id %></td>
	</tr>
</table>

<h2>session 영역에 저장된 정보</h2>
<%
	String email = (String)session.getAttribute("email");
	String addr = (String)session.getAttribute("addr");
	String tel = (String)session.getAttribute("tel");
%>
<table border="1">
	<tr>
		<td>이메일</td>
		<td><%=email %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=addr %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=tel %></td>
	</tr>
</table>
</body>
</html>
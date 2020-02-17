<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 되어있는 경우 메인페이지로 이동
	String id = (String)session.getAttribute("id");
	if (id != null && !id.equals("")){
		response.sendRedirect("main.jsp");
	}
	// 로그인이 되어있지 않다면
	// 쿠키 정보 얻기
	String savedId = "";
	Cookie[] cookies = request.getCookies();
	for (Cookie cookie : cookies) {
		String cookieName = cookie.getName();
		if (cookieName.equals("id")){
			savedId = cookie.getValue();
			break;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
</head>
<body>
<h1>loginForm.jsp</h1>
<form action="loginPro.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="<%=savedId%>"></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="checkbox" name="saveId"
			<%
				if (savedId != null && !savedId.equals("")){
					out.print("checked");
				}
			%>
			>아이디 저장</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
			<input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</body>
</html>
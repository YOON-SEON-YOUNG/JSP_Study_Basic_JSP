<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTest.jsp</title>
</head>
<body>
<h1>scriptTest.jsp</h1>
<hr>
	<%-- 선언문 --%>
	<%!
		String str = "전역변수입니다"; // 멤버 필드 // 잘안씀
	
		String getStr() {	// 멤버 메서드
			return str;
		}
	%>
	<%-- 스트립트릿 --%>
	<%
		String str = "지역변수입니다."; // _jspService(), 지역변수
		// 내장객체 : out
		out.println(str + "<br>");
		out.println(getStr() + "<br>");
	%>
	<%--  표현식 out 내장객체 --%>
	str : <%=str %><br>
	this.str <%= getStr() %>
	
</body>
</html>
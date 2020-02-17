<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifMultiTestPro.jsp.jsp</title>
</head>
<body>
<h1>ifMultiTestPro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");	// POST 방식 요청에대한 한글처리 <완전중요쓰~>
	String name = request.getParameter("name");
	String local = request.getParameter("local");
	String tel = request.getParameter("tel");
// 	out.println(name + "<br>");
// 	out.println(local + "<br>");
// 	out.println(tel + "<br>");
	String strLocal = " ";
	if (local.equals("서울"))	{
		strLocal = "02";
	} else if (local.equals("경기"))	{
		strLocal = "031";
	} else if (local.equals("강원"))	{
		strLocal = "033";
	}
%>
<%=name %>님의 전화 번호: <%=strLocal %> - <%=tel %>입니다.
</body>
</html>
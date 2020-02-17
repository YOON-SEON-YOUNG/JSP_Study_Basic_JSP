<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>visitCount.jsp</title>
</head>
<body>
<h1>visitCount.jsp</h1>
<%
	Object objCount = application.getAttribute("count");
	if (objCount == null)	{
		application.setAttribute("count", 0);
	}
	int count = (Integer)application.getAttribute("count");
	application.setAttribute("count", ++count);	// 새로고침할때마다 늘어날거임
// 	out.println("count: " + count);
%>
<h2>총 방문객수 : <%=count %></h2>
</body>
</html>
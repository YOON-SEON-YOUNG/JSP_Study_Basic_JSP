<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest2.jsp</title>
</head>
<body>
<!-- 포함하는 페이지(포함되는 페이지로 파라미터 전달) -->
<h1>includeTest2.jsp</h1>
<%
// 	request.setCharacterEncoding("utf-8");
	String name = "전정국";
	String pageName = "includedTest2.jsp";
%>
<h2>포함하는 페이지 상단</h2>
<%-- <jsp:include page="includedTest2.jsp"></jsp:include> --%>
<!-- 표현식 사용가능 -->
<!-- 위에 선언된 변수의 값을 포함되는 페이지(includedTest2.jsp)로 파라미터로 전달 -->
<jsp:include page="<%=pageName %>">
	<jsp:param value='<%=URLEncoder.encode(name, "utf-8") %>' name="name"/>
	<jsp:param value="<%=pageName %>" name="pageName"/>
</jsp:include> 
<h2>포함하는 페이지 하단</h2>
</body>
</html>
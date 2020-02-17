<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest.jsp</title>
</head>
<body>
<!-- 폼 처리 페이지 -->
<h1>includeTest.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	String pageName = request.getParameter("pageName");
	pageName += ".jsp";
%>
<h2>포함하는 페이지 상단입니다.</h2>
<!-- 여는태그와 닫는태그 같이 사용-->
<%-- <jsp:include page="includedTest.jsp"></jsp:include> --%>
<%-- <jsp:include page="includedTest.jsp"/> --%>
<!-- 표현식 사용가능 -->
<jsp:include page="<%=pageName %>"/>
<h2>포함하는 페이지 하단입니다.</h2>
</body>
</html>
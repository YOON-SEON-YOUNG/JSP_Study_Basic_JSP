<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test1.jsp</title>
</head>
<body>
<%--
	jsp 영역객체
	pageScope, requestScope, sessionScope, applicationScope
	session.getAttribute("id") -> ${sessionScope.id}
	xxxScope 는 생략 가능 : 생략시 작은 범위에서 큰 범위 순으로 자동 검색
	${id} : page -> request -> session -> appliation
	
	파라미터 값 : request.getParameter("id")
	-> ${param.id}
	
	쿠키 값 : ${cookie.id}
 --%>
<%
	session.setAttribute("id", "hong");
	response.sendRedirect("el_test2.jsp");
%>
</body>
</html>
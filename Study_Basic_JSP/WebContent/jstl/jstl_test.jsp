<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test.jsp</title>
</head>
<body>
<%-- 변수에 값 설정 --%>
<c:set var="test" value="Hello"></c:set>

<%-- 변수에 설정된 값 출력--%>
<div>
	test : <c:out value="${test}"></c:out>
</div>

<%-- 설정된 변수 제거 --%>
<c:remove var="test"/>
<div>
	test : <c:out value="${test}"></c:out>
</div>

<%-- if문 --%>
<c:if test="${1 + 5 == 6}">
	결과: <div> 1 + 5는 6입니다.</div>
</c:if>

<%-- if ~ else, switch~case --%>
<c:choose>
	<c:when test="${ 1 + 5 == 50 }">
		<div>1 + 5는 50 입니다.</div>
	</c:when>
	<c:when test="${ 1 + 5 == 30 }">
		<div>1 + 5는 30 입니다.</div>
	</c:when>
	<c:otherwise>
		<div>1 + 5는 50도 30도 아닙니다.</div>
	</c:otherwise>
</c:choose>

<%-- for문 --%>
<%-- for (int i = 1; i <= 10; i += 2) --%>
<c:forEach var="i" begin="1" end="10" step="2">
	${i}<br>
</c:forEach>
<hr>

<%
	ArrayList<String> names = new ArrayList<>();
	names.add("김남준");
	names.add("김석진");
	names.add("민윤기");
	names.add("정호석");
	names.add("박지민");
	names.add("김태형");
	names.add("전정국");
	
	request.setAttribute("names", names);
	System.out.println(names);
%>
${names}<br>
<%-- for (String name : names) --%>
<c:forEach items="${names}" var="name">
	${name}<br>
</c:forEach>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makeCookie.jsp</title>
</head>
<body>
<h1>makeCookie.jsp</h1>
<h2>쿠키를 생성하는 페이지</h2>
<%
	// 쿠키 생성
	Cookie cookie = new Cookie("id", "YOON");	// (쿠키 이름, 쿠키 값)
	// 유효기간 설정 초단위
	cookie.setMaxAge(60 * 2);	// 2분
	// 응답객체(response)에 쿠키를 추가
	response.addCookie(cookie);
%>
<h2>아이디를 쿠키로 저장하였습니다.</h2>
</body>
</html>
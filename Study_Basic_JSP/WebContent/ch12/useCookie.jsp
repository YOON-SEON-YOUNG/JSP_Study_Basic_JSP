<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useCookie.jsp</title>
</head>
<body>
<h1>useCookie.jsp</h1>
<h2>웹 브라우저에 저장된 쿠키를 가져오는 페이지</h2>
<%
	String id = "";
	// 요청 객체(request)로 부터 쿠키 얻기
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies) {
		// 쿠키의 이름 얻기("id")
		String cookieName = cookie.getName();	
		// 쿠키의 이름으로 쿠키의 값 얻기
		String cookieValue = cookie.getValue();
		// 쿠키들 중에서 관심있는 쿠키만 보여죠!
		if (cookieName.equals("id")) {
			id = cookieValue;
			break;
		} // if
	} // for
%>
<%=id %>님 반갑습니다.
</body>
</html>
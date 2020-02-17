<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestTest2.jsp</title>
</head>
<body>
<h1>requestTest2.jsp</h1>
<%

	String[] names = {
			"프로토콜 이름", 
			"서버 이름", 
			"Method 방식",
			"컨텍스트 경로", 
			"URI", 
			"접속한 클라이언트IP"};

	String[] values = {
			request.getProtocol(),
			request.getServerName(),
			request.getMethod(),
			request.getContextPath(),
			request.getRequestURI(),
			request.getRemoteAddr()
	};
%>
<h2>웹 브라우저와 웹 서버 정보 표시</h2>
<table border="1">
<%
	for (int i = 0; i < names.length; i++) {
%>
		<tr>
			<th><%=names[i] %>
			<td><%=values[i] %>
		</tr>

<%
	} // for
%>

</table>

<table border="1">
<%	
	Enumeration<String> enumer = request.getHeaderNames();
	// hasMoreElements() : 남은 엘리먼크가 있느지 여부
	// nexElement() : 다음 항목 얻기
	
	while (enumer.hasMoreElements() == true) {
		String headerName = enumer.nextElement();
		String headerValue = request.getHeader(headerName);
		
		if (headerName.equals("user-agent")) {	// 브라우저
			if (headerValue.contains("Chrome") || headerValue.contains("Safari")){
				out.println("<b>인터넷 익스플로어를 사용해주세요.</b>");
			} // if
		} // if
%>
		<tr>
			<td><%=headerName %>
			<td><%=headerValue %>
		</tr>
<%
	} // while

%>
</table>
</body>
</html>
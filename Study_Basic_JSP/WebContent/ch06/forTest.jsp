<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>forTest.jsps</h1>
<% 
	String[] strArray = {"JAVA", "JSP", "Android", "HTML5"};
	// out 내장 객체, 표현식
	for (int i = 0; i < strArray.length; i++) {
// 		out.print("<label>" + (i+1)+"번째 값: </label>");
%> 
		<!-- html이라서 따로 씀--> 
		<label><%=i+1%>번째 값:</label> <%= strArray[i]%> <br>
		
<%	
	}// for
%>

</body>
</html>
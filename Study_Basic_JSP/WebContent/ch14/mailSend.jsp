<%@page import="ch14.mail.MyMailSender"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	boolean result = MyMailSender.sendMail(sender, receiver, subject, content);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailSend.jsp</title>
</head>
<body>
<%
	if (result == true){
%>
	<h1>메일 보내기 성공</h1>
<%
	} else {
%>
	<h1>메일 보내기 실패</h1>
<%
	} // if
%>
</body>
</html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>driverTest.jsp</title>
</head>
<body>
<h1>driverTest.jsp</h1>
<%
	// JSP / 1234 사용자로 작업
	String DRIVER = "oracle.jdbc.driver.OracleDriver";	// 메모리에 로드할 드라이버 이름(클래스)
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";	// 접속할 컴퓨터(위치)
	String ID = "JSP";									// 접속할 사용자 아이디
	String PW = "1234";									// 접속할 사용자 패스워드

	Connection conn = null;
	try{
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, ID, PW);
		out.println("conn:" + conn);
	} catch(Exception e) {
		e.printStackTrace();
	} finally	{
		if (conn != null) try { conn.close(); } catch (Exception e) {	}
		
	}
%>
</body>
</html>
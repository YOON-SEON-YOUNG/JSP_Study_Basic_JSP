<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateTestPro.jsp</title>
</head>
<body>
<!-- 처리 -->
<h1>updateTestPro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	
	//JSP / 1234 사용자로 작업
	String DRIVER = "oracle.jdbc.driver.OracleDriver";	// 메모리에 로드할 드라이버 이름(클래스)
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";	// 접속할 컴퓨터(위치)
	String ID = "JSP";									// 접속할 사용자 아이디
	String PW = "1234";									// 접속할 사용자 패스워드

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "수정 성공";
	try{
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, ID, PW);
		String sql = "update member set"
				+    " name =? "
				+    " where id =? and passwd = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, passwd);
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
		str = "수정 실패";
	} finally	{
		if (pstmt != null) 	try { pstmt.close(); } 	catch (Exception e) {	}
		if (conn != null) 	try { conn.close(); }	catch (Exception e) {	}
	}
%>
<h2><%=str %></h2>

</body>
</html>
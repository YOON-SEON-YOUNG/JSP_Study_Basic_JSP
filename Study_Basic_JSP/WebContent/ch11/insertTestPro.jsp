<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertTestPro.jsp</title>
</head>
<body>
<!-- 처리 -->
<h1>insertTestPro.jsp</h1>
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
	String str = "";
	try{
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, ID, PW);
		String sql = "insert into member(id, passwd, name)"
				+    "values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		int count = pstmt.executeUpdate();
		
		if (count > 0) {
			str = "가입 성공";
		} else {
			str = "가입 실패";
		}
	} catch(Exception e) {
		e.printStackTrace();
		str = "가입 실패";
	} finally	{
		if (pstmt != null) 	try { pstmt.close(); } 	catch (Exception e) {	}
		if (conn != null) 	try { conn.close(); }	catch (Exception e) {	}
	}
%>
<h2><%=str %></h2>

</body>
</html>
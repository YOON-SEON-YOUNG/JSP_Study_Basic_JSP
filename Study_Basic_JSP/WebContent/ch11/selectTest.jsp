<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectTest.jsp</title>
</head>
<body>
<h1>selectTest.jsp</h1>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>가입일</td>
	</tr>
<%
	//JSP / 1234 사용자로 작업
	String DRIVER = "oracle.jdbc.driver.OracleDriver";	// 메모리에 로드할 드라이버 이름(클래스)
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";	// 접속할 컴퓨터(위치)
	String ID = "JSP";									// 접속할 사용자 아이디
	String PW = "1234";									// 접속할 사용자 패스워드
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, ID, PW);
		String sql = "select * from member"
				+ "	  order by reg_date desc";
			
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next())	{
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				String reg_date = rs.getString("reg_date");
%>
			<tr>
				<td><%=id %></td>
				<td><%=passwd %></td>
				<td><%=name %></td>
				<td><%=reg_date %></td>
			</tr>
<%
		} // while
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if (rs != null) 	try { rs.close(); } 	catch (Exception e) {	}
		if (pstmt != null) 	try { pstmt.close(); } 	catch (Exception e) {	}
		if (conn != null) 	try { conn.close(); }	catch (Exception e) {	}
	}
%>
</table>
</body>
</html>
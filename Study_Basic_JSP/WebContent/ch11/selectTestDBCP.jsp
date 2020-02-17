<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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
<title>selectTestDBCP.jsp</title>
</head>
<body>
<h1>selectTestDBCP.jsp</h1>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>가입일</td>
	</tr>
<%	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		// context.xml의 <Context> 얻기
		Context initCtx = new InitialContext();
		Context envCts = (Context)initCtx.lookup("java:comp/env");	// 정해진 이름
		// 커넥션 풀 얻기
		DataSource ds = (DataSource)envCts.lookup("jdbc/basicjsp");
		/* <Context>									|
				<Resource								|
					name="jdbc/basicjsp"> <-------------
		*/
	
		// 커넥션 풀에 올려진 Connection 얻기
		conn = ds.getConnection();
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
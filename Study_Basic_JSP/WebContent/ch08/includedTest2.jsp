<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("name");
	String pageName = request.getParameter("pageName");
%>
<h2>이름:<%=URLDecoder.decode(name, "utf-8") %></h2>
<h2>페이지이름:<%=pageName %></h2>


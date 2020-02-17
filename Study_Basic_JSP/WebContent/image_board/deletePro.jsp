<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strNum = request.getParameter("num");
	int num = Integer.parseInt(strNum);
	String passwd = request.getParameter("passwd");
	
	BoardDao boardDao = BoardDao.getInstance();
	boardDao.deleteArticle(num, passwd);

	response.sendRedirect("list.jsp");
%>
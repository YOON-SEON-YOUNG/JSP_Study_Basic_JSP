<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	BoardDao boardDao = BoardDao.getInstance();
%>
<jsp:useBean id="boardVo" class="ch13.board.BoardVo">
	<jsp:setProperty name="boardVo" property="*"/>	
</jsp:useBean>
<%=boardVo %>
<%
	boardDao.updateArticle(boardVo);

	response.sendRedirect("content.jsp?num=" + boardVo.getNum());
%>